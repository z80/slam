
set( proj "vo" )


find_package( OpenCV REQUIRED )
aux_source_directory( "./src" src )

include_directories( "./src"
                     ${OpenCV_INCLUDE_DIRS} )

add_library( ${proj} ${src} )
target_link_libraries( ${proj} ${OpenCV_LIBS} )
install( TARGETS ${proj} DESTINATION "./" )



