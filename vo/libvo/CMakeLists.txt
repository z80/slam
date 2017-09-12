
set( proj "libvo" )

find_package( OpenCV REQUIRED )
find_package( Boost  COMPONENTS thread REQUIRED )

aux_source_directory( "./src" src )

include_directories( "./src"
                     ${OpenCV_INCLUDE_DIRS}
                     ${Boost_INCLUDE_DIRS} )
link_directories( ${Boost_LIBRARY_DIRS} )

add_library( ${proj} ${src} )
target_link_libraries( ${proj} ${OpenCV_LIBS} ${Boost_LIBRARIES} )
install( TARGETS ${proj} DESTINATION "./" )



