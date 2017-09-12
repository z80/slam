
#include<iostream>
#include<algorithm>
#include<fstream>
#include<chrono>

#include<opencv2/core/core.hpp>
#include<opencv2/imgproc.hpp>
#include<opencv2/highgui.hpp>
#include<opencv2/videoio.hpp>
#include<opencv2/features2d.hpp>

#include<System.h>

using namespace std;



int main(int argc, char **argv)
{

    // Create SLAM system. It initializes all system threads and gets ready to process frames.
    ORB_SLAM2::System SLAM( "./ORBvoc.txt", "./settings.yaml", ORB_SLAM2::System::MONOCULAR, true );

    cv::Mat img;
    cv::VideoCapture capture;
    capture.open( 0 );

    int i=0;
    for (;;)
    {
        capture >> img;
        //std::chrono::monotonic_clock::time_point t1 = std::chrono::monotonic_clock::now();

        double tframe = static_cast<double>(i++);
        SLAM.TrackMonocular( img, tframe );

        //int key = cv::waitKey( 1 );
        //if ( key == 'q' )
        //    break;
    }

    //im = cv::imread( vstrImageFilenames[ni],CV_LOAD_IMAGE_UNCHANGED );


    // Stop all threads
    SLAM.Shutdown();



    return 0;
}

