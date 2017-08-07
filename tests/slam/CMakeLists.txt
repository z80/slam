
set( proj "test_slam" )


include( "${ROOT}/settings.unix.cmake" )
find_package( OpenCV REQUIRED )

file( GLOB src PATH "./src/*.cpp" )

include_directories( "./include"
                     ${OpenCV_INCLIDE_DIRS} )

add_executable( ${proj} ${src} )
target_link_libraries( ${proj} ${PROJECT_NAME} ${OpenCV_LIBS} )


