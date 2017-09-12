
#include "vo.h"

#include "opencv2/core/core.hpp"
#include "opencv2/videoio.hpp"
#include "opencv2/core/utility.hpp"
#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/features2d/features2d.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/video/tracking.hpp"

#include <string>
#include <iostream>
#include <vector>

#include <boost/thread.hpp>
#include <boost/bind.hpp>
#include <boost/thread/mutex.hpp>

class Vo::PD
{
public:
    boost::thread_group tg;
    bool terminated;
    boost::mutex dataMutex;
    cv::Mat R;
    double x, y, z,
           qw, qx, qy, qz;

    bool loadCameraParams( cv::Mat & cameraMatrix,
                           cv::Mat & distCoefs,
                           const char * fileName = "./cameraParameters.xml" );
    bool detectFeatures( cv::Ptr<cv::Feature2D> detector, const cv::Mat & image, std::vector<cv::Point2f> & pts );
    bool trackOpticalFlow( const cv::Mat & imgA, std::vector<cv::Point2f> & pointsA,
                           const cv::Mat & imgB, std::vector<cv::Point2f> & pointsB );
    bool computePoseDisplacement( std::vector<cv::Point2f> & pointsA,
                                  std::vector<cv::Point2f> & pointsB,
                                  const cv::Mat & cameraMatrix );

    void process();

    PD()
    {
        x = y = z = 0.0;
        qw = 1.0;
        qx = qy = qz = 0.0;

        terminated = false;
        tg.create_thread( boost::bind( &PD::process, this ) );
    }

    ~PD()
    {
        terminated = true;
        tg.join_all();
    }

    //cv::recoverPose();
    //cv::undistort( undistorted, undistorted, cameraMatrix, distCoeffs );
};

bool Vo::PD::loadCameraParams( cv::Mat & cameraMatrix,
                               cv::Mat & distCoefs,
                               const char * fileName )
{
    cv::FileStorage fs( fileName, cv::FileStorage::READ );
    if (!fs.isOpened())
    {
        std::cout << "Could not open the configuration file" << std::endl;
        return false;
    }

    cv::Mat cm = cv::Mat::eye(   3, 3, CV_64F );
    cv::Mat dc = cv::Mat::zeros( 5, 1, CV_64F );

    fs[ "cameraMatrix" ] >> cm;
    fs[ "dist_coeffs" ]  >> dc;
    fs.release();

    cameraMatrix = cm;
    distCoefs    = dc;

    return true;
}

bool Vo::PD::detectFeatures( cv::Ptr<cv::Feature2D> detector, const cv::Mat & image, std::vector<cv::Point2f> & pts )
{
    std::vector<cv::KeyPoint> kp;
    //int FAST_th = 20;
    //bool nonmaxSuppression = true;
    //cv::FAST( image, kp, FAST_th, nonmaxSuppression );
    detector->detect( image, kp );
    cv::KeyPoint::convert( kp, pts, std::vector<int>() );
    return true;
}

bool Vo::PD::trackOpticalFlow( const cv::Mat & imgA, std::vector<cv::Point2f> & pointsA,
                               const cv::Mat & imgB, std::vector<cv::Point2f> & pointsB )
{
    pointsB = pointsA;
    const cv::Size wndSize( 21, 21 );
    const int maxLevel = 3;
    const int maxCount = 30;
    const double epsilon = 0.01;
    const double minThreshold = 0.001;
    const cv::TermCriteria tc = cv::TermCriteria( cv::TermCriteria::COUNT+cv::TermCriteria::EPS, maxCount, epsilon );

    std::vector<uchar> status;
    std::vector<float> err;
    cv::calcOpticalFlowPyrLK( imgA, imgB, pointsA, pointsB, status, err,
                              wndSize, maxLevel, tc, cv::OPTFLOW_USE_INITIAL_FLOW, minThreshold );

    // Remove points which are not tracked.
    int sz = static_cast<int>( status.size() );
    std::vector<cv::Point2f> resA, resB;
    for ( int i=0; i<sz; i++ )
    {
        if ( status.at( i ) )
        {
            resA.push_back( pointsA.at( i ) );
            resB.push_back( pointsB.at( i ) );
        }
    }
    pointsA = resA;
    pointsB = resB;

    return true;
}

bool Vo::PD::computePoseDisplacement( std::vector<cv::Point2f> & pointsA,
                                      std::vector<cv::Point2f> & pointsB,
                                      const cv::Mat & cameraMatrix )
{
    cv::Mat E, r, t, mask;
    std::vector<uchar> status;
    E = cv::findEssentialMat( pointsA, pointsB, cameraMatrix, cv::RANSAC, 0.999, 1.0, mask );
    int res = cv::recoverPose( E, pointsA, pointsB, cameraMatrix, r, t, status );

    this->R = this->R * r;
    //cv::Rodrigues( r, R );

    std::cout << "res: " << res << std::endl;
    //std::cout << t << std::endl;

    if ( res < 10 )
        return false;
    // Convert rotation matrix to quaternion.
    double w  = std::sqrt( 1.0 + R.at<double>(0,0) + R.at<double>(1,1) + R.at<double>(2,2) ) / 2.0;
    double w4 = ( 4.0 + w );
    double x  = (R.at<double>(2,1) - R.at<double>(1,2)) / w4;
    double y  = (R.at<double>(0,2) - R.at<double>(2,0)) / w4;
    double z  = (R.at<double>(1,0) - R.at<double>(0,1)) / w4;

    boost::mutex::scoped_lock lock( this->dataMutex );
        this->x += t.at<double>( 0, 0 );
        this->y += t.at<double>( 1, 0 );
        this->z += t.at<double>( 2, 0 );
        this->qw = 1.0; //w;
        this->qx = 0.0; //x;
        this->qy = 0.0; //y;
        this->qz = 0.0; //z;

    return true;
}

void Vo::PD::process()
{
    cv::VideoCapture inputCapture;
    inputCapture.open( 0 );
    if ( !inputCapture.isOpened() )
    {
        std::cout << "Failed to open camera!" << std::endl;
        return;
    }

    cv::Mat cameraMatrix;
    cv::Mat distCoeffs;

    bool res = loadCameraParams( cameraMatrix,
                                 distCoeffs );
    if ( !res )
    {
        std::cout << "Failed to read camera params!" << std::endl;
        return;
    }

    // For holding previous image.
    cv::Mat prevImage;
    std::vector<cv::Point2f> prevFeaturePoints;
    // For current image.
    std::vector<cv::Point2f> featurePoints;

    cv::Mat rawImage;
    cv::Mat greyImage;
    cv::Mat undistImage;

    this->R = cv::Mat::eye( 3, 3, CV_64F );
    cv::Ptr<cv::ORB> detector = cv::ORB::create( 100 );
    //cv::Ptr<cv::Feature2D> detector = cv::FAST();

    do {
        inputCapture >> rawImage;
        cv::cvtColor( rawImage, greyImage, cv::COLOR_BGR2GRAY );
        cv::undistort( greyImage, undistImage, cameraMatrix, distCoeffs );

        // *******************
        //      Step 1.
        // Detect feature points.
        // *******************
        this->detectFeatures( detector, greyImage, featurePoints );

        if ( ( greyImage.rows > 0 ) && ( prevImage.rows > 0) )
        {
            // *******************
            //      Step 2.
            // Establish correspondence between feature points of two sequential images.
            // *******************
            if ( featurePoints.size() > 20 )
                trackOpticalFlow( greyImage, featurePoints,
                                  prevImage, prevFeaturePoints );
            // If at least some points are tracked.
            if ( ( prevFeaturePoints.size() > 20 ) && ( featurePoints.size() > 20 ) )
                // *******************
                //       Step 3.
                // Retrieve rotation and translation.
                // *******************
                computePoseDisplacement( prevFeaturePoints, featurePoints, cameraMatrix );
        }
        // Loop.
        // Save previous image and feature points.
        prevImage = greyImage.clone();

    } while ( !terminated );
}





Vo::Vo()
{
    pd = new PD();
}

Vo::~Vo()
{
    delete pd;
}

bool Vo::isRunning() const
{
    bool res = !pd->terminated;
    return res;
}

void Vo::pose( double & x, double & y, double & z,
               double & qw, double & qx, double & qy, double & qz )
{
    boost::mutex::scoped_lock lock( pd->dataMutex );
        x = pd->x;
        y = pd->y;
        z = pd->z;
        qw = pd->qw;
        qx = pd->qx;
        qy = pd->qy;
        qz = pd->qz;
}






