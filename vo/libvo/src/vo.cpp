
#include "vo.h"

#include "opencv2/video/tracking.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/features2d/features2d.hpp"
#include "opencv2/calib3d/calib3d.hpp"

#include <string>
#include <iostream>
#include <vector>
#include <fstream>

class Vo::PD
{
public:
    cv::Mat rot,
            tr;
    cv::Mat image;
    std::vector<cv::Point2f> points;

    cv::recoverPose();
};

