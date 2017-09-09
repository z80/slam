#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "zlib" for configuration "Debug"
set_property(TARGET zlib APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(zlib PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/libzlib.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS zlib )
list(APPEND _IMPORT_CHECK_FILES_FOR_zlib "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/libzlib.a" )

# Import target "libjpeg" for configuration "Debug"
set_property(TARGET libjpeg APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(libjpeg PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/liblibjpeg.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libjpeg )
list(APPEND _IMPORT_CHECK_FILES_FOR_libjpeg "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/liblibjpeg.a" )

# Import target "libjasper" for configuration "Debug"
set_property(TARGET libjasper APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(libjasper PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/liblibjasper.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libjasper )
list(APPEND _IMPORT_CHECK_FILES_FOR_libjasper "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/liblibjasper.a" )

# Import target "libpng" for configuration "Debug"
set_property(TARGET libpng APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(libpng PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "zlib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/liblibpng.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libpng )
list(APPEND _IMPORT_CHECK_FILES_FOR_libpng "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/liblibpng.a" )

# Import target "ittnotify" for configuration "Debug"
set_property(TARGET ittnotify APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(ittnotify PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "dl"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/libittnotify.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ittnotify )
list(APPEND _IMPORT_CHECK_FILES_FOR_ittnotify "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/libittnotify.a" )

# Import target "libprotobuf" for configuration "Debug"
set_property(TARGET libprotobuf APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(libprotobuf PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/liblibprotobuf.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libprotobuf )
list(APPEND _IMPORT_CHECK_FILES_FOR_libprotobuf "${_IMPORT_PREFIX}/share/OpenCV/3rdparty/lib/liblibprotobuf.a" )

# Import target "opencv_cudev" for configuration "Debug"
set_property(TARGET opencv_cudev APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudev PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudev.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudev )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudev "${_IMPORT_PREFIX}/lib/libopencv_cudev.a" )

# Import target "opencv_core" for configuration "Debug"
set_property(TARGET opencv_core APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_core PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps;zlib;ittnotify"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_core.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_core )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_core "${_IMPORT_PREFIX}/lib/libopencv_core.a" )

# Import target "opencv_cudaarithm" for configuration "Debug"
set_property(TARGET opencv_cudaarithm APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudaarithm PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cufft;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudaarithm.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudaarithm )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudaarithm "${_IMPORT_PREFIX}/lib/libopencv_cudaarithm.a" )

# Import target "opencv_flann" for configuration "Debug"
set_property(TARGET opencv_flann APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_flann PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_flann.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_flann )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_flann "${_IMPORT_PREFIX}/lib/libopencv_flann.a" )

# Import target "opencv_imgproc" for configuration "Debug"
set_property(TARGET opencv_imgproc APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_imgproc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_imgproc.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_imgproc )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_imgproc "${_IMPORT_PREFIX}/lib/libopencv_imgproc.a" )

# Import target "opencv_ml" for configuration "Debug"
set_property(TARGET opencv_ml APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_ml PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_ml.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_ml )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_ml "${_IMPORT_PREFIX}/lib/libopencv_ml.a" )

# Import target "opencv_objdetect" for configuration "Debug"
set_property(TARGET opencv_objdetect APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_objdetect PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_objdetect.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_objdetect )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_objdetect "${_IMPORT_PREFIX}/lib/libopencv_objdetect.a" )

# Import target "opencv_video" for configuration "Debug"
set_property(TARGET opencv_video APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_video PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_video.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_video )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_video "${_IMPORT_PREFIX}/lib/libopencv_video.a" )

# Import target "opencv_cudabgsegm" for configuration "Debug"
set_property(TARGET opencv_cudabgsegm APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudabgsegm PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;opencv_video;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudabgsegm.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudabgsegm )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudabgsegm "${_IMPORT_PREFIX}/lib/libopencv_cudabgsegm.a" )

# Import target "opencv_cudafilters" for configuration "Debug"
set_property(TARGET opencv_cudafilters APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudafilters PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_imgproc;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudafilters.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudafilters )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudafilters "${_IMPORT_PREFIX}/lib/libopencv_cudafilters.a" )

# Import target "opencv_cudaimgproc" for configuration "Debug"
set_property(TARGET opencv_cudaimgproc APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudaimgproc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_imgproc;opencv_cudafilters;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudaimgproc.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudaimgproc )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudaimgproc "${_IMPORT_PREFIX}/lib/libopencv_cudaimgproc.a" )

# Import target "opencv_cudawarping" for configuration "Debug"
set_property(TARGET opencv_cudawarping APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudawarping PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudawarping.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudawarping )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudawarping "${_IMPORT_PREFIX}/lib/libopencv_cudawarping.a" )

# Import target "opencv_dnn" for configuration "Debug"
set_property(TARGET opencv_dnn APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_dnn PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;libprotobuf;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_dnn.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_dnn )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_dnn "${_IMPORT_PREFIX}/lib/libopencv_dnn.a" )

# Import target "opencv_imgcodecs" for configuration "Debug"
set_property(TARGET opencv_imgcodecs APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_imgcodecs PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;zlib;libjpeg;/usr/lib/x86_64-linux-gnu/libwebp.so;libpng;/usr/lib/x86_64-linux-gnu/libtiff.so;libjasper;/usr/lib/x86_64-linux-gnu/libImath.so;/usr/lib/x86_64-linux-gnu/libIlmImf.so;/usr/lib/x86_64-linux-gnu/libIex.so;/usr/lib/x86_64-linux-gnu/libHalf.so;/usr/lib/x86_64-linux-gnu/libIlmThread.so;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_imgcodecs.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_imgcodecs )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_imgcodecs "${_IMPORT_PREFIX}/lib/libopencv_imgcodecs.a" )

# Import target "opencv_photo" for configuration "Debug"
set_property(TARGET opencv_photo APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_photo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_imgproc;opencv_cudafilters;opencv_cudaimgproc;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_photo.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_photo )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_photo "${_IMPORT_PREFIX}/lib/libopencv_photo.a" )

# Import target "opencv_shape" for configuration "Debug"
set_property(TARGET opencv_shape APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_shape PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;opencv_video;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_shape.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_shape )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_shape "${_IMPORT_PREFIX}/lib/libopencv_shape.a" )

# Import target "opencv_videoio" for configuration "Debug"
set_property(TARGET opencv_videoio APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_videoio PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;opencv_imgcodecs;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;dc1394;avcodec-ffmpeg;avformat-ffmpeg;avutil-ffmpeg;swscale-ffmpeg;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_videoio.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_videoio )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_videoio "${_IMPORT_PREFIX}/lib/libopencv_videoio.a" )

# Import target "opencv_cudacodec" for configuration "Debug"
set_property(TARGET opencv_cudacodec APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudacodec PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;opencv_imgcodecs;opencv_videoio;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudacodec.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudacodec )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudacodec "${_IMPORT_PREFIX}/lib/libopencv_cudacodec.a" )

# Import target "opencv_highgui" for configuration "Debug"
set_property(TARGET opencv_highgui APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_highgui PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_imgproc;opencv_imgcodecs;opencv_videoio;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;gtk-x11-2.0;gdk-x11-2.0;pangocairo-1.0;atk-1.0;cairo;gdk_pixbuf-2.0;gio-2.0;pangoft2-1.0;pango-1.0;gobject-2.0;glib-2.0;fontconfig;freetype;gthread-2.0;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_highgui.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_highgui )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_highgui "${_IMPORT_PREFIX}/lib/libopencv_highgui.a" )

# Import target "opencv_features2d" for configuration "Debug"
set_property(TARGET opencv_features2d APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_features2d PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_flann;opencv_imgproc;opencv_imgcodecs;opencv_videoio;opencv_highgui;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_features2d.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_features2d )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_features2d "${_IMPORT_PREFIX}/lib/libopencv_features2d.a" )

# Import target "opencv_calib3d" for configuration "Debug"
set_property(TARGET opencv_calib3d APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_calib3d PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_flann;opencv_imgproc;opencv_imgcodecs;opencv_videoio;opencv_highgui;opencv_features2d;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_calib3d.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_calib3d )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_calib3d "${_IMPORT_PREFIX}/lib/libopencv_calib3d.a" )

# Import target "opencv_cudafeatures2d" for configuration "Debug"
set_property(TARGET opencv_cudafeatures2d APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudafeatures2d PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_flann;opencv_imgproc;opencv_cudafilters;opencv_cudawarping;opencv_imgcodecs;opencv_videoio;opencv_highgui;opencv_features2d;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudafeatures2d.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudafeatures2d )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudafeatures2d "${_IMPORT_PREFIX}/lib/libopencv_cudafeatures2d.a" )

# Import target "opencv_cudalegacy" for configuration "Debug"
set_property(TARGET opencv_cudalegacy APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudalegacy PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_flann;opencv_imgproc;opencv_objdetect;opencv_video;opencv_cudafilters;opencv_cudaimgproc;opencv_imgcodecs;opencv_videoio;opencv_highgui;opencv_features2d;opencv_calib3d;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudalegacy.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudalegacy )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudalegacy "${_IMPORT_PREFIX}/lib/libopencv_cudalegacy.a" )

# Import target "opencv_cudaobjdetect" for configuration "Debug"
set_property(TARGET opencv_cudaobjdetect APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudaobjdetect PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_flann;opencv_imgproc;opencv_objdetect;opencv_video;opencv_cudafilters;opencv_cudaimgproc;opencv_cudawarping;opencv_imgcodecs;opencv_videoio;opencv_highgui;opencv_features2d;opencv_calib3d;opencv_cudalegacy;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudaobjdetect.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudaobjdetect )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudaobjdetect "${_IMPORT_PREFIX}/lib/libopencv_cudaobjdetect.a" )

# Import target "opencv_cudaoptflow" for configuration "Debug"
set_property(TARGET opencv_cudaoptflow APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudaoptflow PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_flann;opencv_imgproc;opencv_objdetect;opencv_video;opencv_cudafilters;opencv_cudaimgproc;opencv_cudawarping;opencv_imgcodecs;opencv_videoio;opencv_highgui;opencv_features2d;opencv_calib3d;opencv_cudalegacy;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudaoptflow.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudaoptflow )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudaoptflow "${_IMPORT_PREFIX}/lib/libopencv_cudaoptflow.a" )

# Import target "opencv_cudastereo" for configuration "Debug"
set_property(TARGET opencv_cudastereo APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_cudastereo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_flann;opencv_imgproc;opencv_imgcodecs;opencv_videoio;opencv_highgui;opencv_features2d;opencv_calib3d;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_cudastereo.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_cudastereo )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_cudastereo "${_IMPORT_PREFIX}/lib/libopencv_cudastereo.a" )

# Import target "opencv_stitching" for configuration "Debug"
set_property(TARGET opencv_stitching APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_stitching PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_flann;opencv_imgproc;opencv_objdetect;opencv_video;opencv_cudafilters;opencv_cudaimgproc;opencv_cudawarping;opencv_imgcodecs;opencv_videoio;opencv_highgui;opencv_features2d;opencv_calib3d;opencv_cudafeatures2d;opencv_cudalegacy;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_stitching.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_stitching )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_stitching "${_IMPORT_PREFIX}/lib/libopencv_stitching.a" )

# Import target "opencv_superres" for configuration "Debug"
set_property(TARGET opencv_superres APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_superres PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_flann;opencv_imgproc;opencv_objdetect;opencv_video;opencv_cudafilters;opencv_cudaimgproc;opencv_cudawarping;opencv_imgcodecs;opencv_videoio;opencv_cudacodec;opencv_highgui;opencv_features2d;opencv_calib3d;opencv_cudalegacy;opencv_cudaoptflow;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_superres.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_superres )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_superres "${_IMPORT_PREFIX}/lib/libopencv_superres.a" )

# Import target "opencv_videostab" for configuration "Debug"
set_property(TARGET opencv_videostab APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(opencv_videostab PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "opencv_cudev;opencv_core;opencv_cudaarithm;opencv_flann;opencv_imgproc;opencv_objdetect;opencv_video;opencv_cudafilters;opencv_cudaimgproc;opencv_cudawarping;opencv_imgcodecs;opencv_photo;opencv_videoio;opencv_highgui;opencv_features2d;opencv_calib3d;opencv_cudalegacy;opencv_cudaoptflow;stdc++;dl;m;pthread;rt;ippiw;ippicv;cudart;nppc;nppi;npps;cufft;-L/usr/local/cuda/lib64;cudart;nppc;nppi;npps"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libopencv_videostab.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS opencv_videostab )
list(APPEND _IMPORT_CHECK_FILES_FOR_opencv_videostab "${_IMPORT_PREFIX}/lib/libopencv_videostab.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
