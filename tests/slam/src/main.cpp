
#include<iostream>
#include<algorithm>
#include<fstream>
#include<chrono>
#include <map>

#include<opencv2/core/core.hpp>
#include<opencv2/imgproc.hpp>
#include<opencv2/highgui.hpp>
#include<opencv2/videoio.hpp>
#include<opencv2/features2d.hpp>

#include<System.h>

using namespace std;

//std::map<void *, bool> allocations;
//bool doRemember = true;

void * operator new(std::size_t n) //throw(std::bad_alloc)
{
    void * p = malloc( n );
    /*
    if ( doRemember )
    {
        doRemember = false;
            allocations[p] = true;
        doRemember = true;
    }
    */
    return p;
}

void operator delete(void * p) //throw()
{
    /*
    std::map<void*, bool>::iterator it = allocations.find( p );
    if ( it == allocations.end() )
        std::cout << "ERROR: already deleted this piece of memory" << std::endl;
    else
        allocations.erase( it );
    */
    free( p );
}


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

