
set( target vis )


include_directories( "./src"
                     ${ROOT}/libvo/src
                     ${ROOT}/3dparty/irrlicht/include
                     ${CMAKE_CURRENT_BINARY_DIR} )

aux_source_directory( "./src" src )

add_executable( ${target} ${src} )
target_link_libraries( ${target} libvo irrlicht )
install( TARGETS ${target} DESTINATION ./ )



