
cmake_minimum_required( VERSION 2.4 )
if ( COMMAND cmake_policy )
    cmake_policy( SET CMP0003 NEW )
endif( COMMAND cmake_policy )

project( "visual_odometry_tryout" )

set( ROOT ${CMAKE_CURRENT_SOURCE_DIR} )

add_subdirectory( "./cam_cal" )
add_subdirectory( "./3dparty" )
add_subdirectory( "./libvo" )
add_subdirectory( "./vis" )






