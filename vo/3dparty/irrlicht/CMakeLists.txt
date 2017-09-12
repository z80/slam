
set( libname "irrlicht" )

find_package( OpenGL REQUIRED )
if ( UNIX )
    find_package( X11 REQUIRED )
    include_directories( ${X11_INCLUDE_DIR} )
endif ( UNIX )

include_directories( "./include" 
                     "./src/aexGladman" 
                     "./src/bzip2" 
                     "./src/jpeglib" 
                     "./src/libpng" 
                     "./src/lzma" 
                     "./src/zlib" 
                     ${OPENGL_INCLUDE_DIR} )

add_definitions( -DIRRLICHT_EXPORTS=1 
                 -DPNG_THREAD_UNSAFE_OK 
                 -DPNG_NO_MMX_CODE 
                 -DPNG_NO_MNG_FEATURES )
remove_definitions( -U__STRICT_ANSI )

if ( UNIX )
    # To be able to load binary modules as shared libraries.
    add_definitions( -DIRRLICHT_EXPORTS=1 )
endif ( UNIX )

set( src ./src/CBSPMeshFileLoader.cpp 
         ./src/CMD2MeshFileLoader.cpp 
         ./src/CMD3MeshFileLoader.cpp 
         ./src/CMS3DMeshFileLoader.cpp 
         ./src/CB3DMeshFileLoader.cpp 
         ./src/C3DSMeshFileLoader.cpp 
         ./src/COgreMeshFileLoader.cpp 
         ./src/COBJMeshFileLoader.cpp 
         ./src/CColladaFileLoader.cpp 
         ./src/CCSMLoader.cpp 
         ./src/CDMFLoader.cpp 
         ./src/CLMTSMeshFileLoader.cpp 
         ./src/CMY3DMeshFileLoader.cpp 
         ./src/COCTLoader.cpp 
         ./src/CXMeshFileLoader.cpp 
         ./src/CIrrMeshFileLoader.cpp 
         ./src/CSTLMeshFileLoader.cpp 
         ./src/CLWOMeshFileLoader.cpp 
         ./src/CPLYMeshFileLoader.cpp 
         ./src/CSMFMeshFileLoader.cpp 
         ./src/CMeshTextureLoader.cpp

         ./src/CColladaMeshWriter.cpp 
         ./src/CIrrMeshWriter.cpp 
         ./src/CSTLMeshWriter.cpp 
         ./src/COBJMeshWriter.cpp 
         ./src/CPLYMeshWriter.cpp 
         ./src/CB3DMeshWriter.cpp

         ./src/CSkinnedMesh.cpp 
         ./src/CBoneSceneNode.cpp 
         ./src/CMeshSceneNode.cpp 
         ./src/CAnimatedMeshSceneNode.cpp 
         ./src/CAnimatedMeshMD2.cpp 
         ./src/CAnimatedMeshMD3.cpp 
         ./src/CQ3LevelMesh.cpp 
         ./src/CQuake3ShaderSceneNode.cpp 
         ./src/CAnimatedMeshHalfLife.cpp

         ./src/CBillboardSceneNode.cpp 
         ./src/CCameraSceneNode.cpp 
         ./src/CDummyTransformationSceneNode.cpp 
         ./src/CEmptySceneNode.cpp 
         ./src/CGeometryCreator.cpp 
         ./src/CLightSceneNode.cpp 
         ./src/CMeshManipulator.cpp 
         ./src/CMetaTriangleSelector.cpp 
         ./src/COctreeSceneNode.cpp 
         ./src/COctreeTriangleSelector.cpp 
         ./src/CSceneCollisionManager.cpp 
         ./src/CSceneManager.cpp 
         ./src/CShadowVolumeSceneNode.cpp 
         ./src/CSkyBoxSceneNode.cpp 
         ./src/CSkyDomeSceneNode.cpp 
         ./src/CTerrainSceneNode.cpp 
         ./src/CTerrainTriangleSelector.cpp 
         ./src/CVolumeLightSceneNode.cpp 
         ./src/CCubeSceneNode.cpp 
         ./src/CSphereSceneNode.cpp 
         ./src/CTextSceneNode.cpp 
         ./src/CTriangleBBSelector.cpp 
         ./src/CTriangleSelector.cpp 
         ./src/CWaterSurfaceSceneNode.cpp 
         ./src/CMeshCache.cpp 
         ./src/CDefaultSceneNodeAnimatorFactory.cpp 
         ./src/CDefaultSceneNodeFactory.cpp 
         ./src/CSceneLoaderIrr.cpp

         ./src/CParticleAnimatedMeshSceneNodeEmitter.cpp 
         ./src/CParticleBoxEmitter.cpp 
         ./src/CParticleCylinderEmitter.cpp 
         ./src/CParticleMeshEmitter.cpp 
         ./src/CParticlePointEmitter.cpp 
         ./src/CParticleRingEmitter.cpp 
         ./src/CParticleSphereEmitter.cpp 
         ./src/CParticleAttractionAffector.cpp 
         ./src/CParticleFadeOutAffector.cpp 
         ./src/CParticleGravityAffector.cpp 
         ./src/CParticleRotationAffector.cpp 
         ./src/CParticleSystemSceneNode.cpp 
         ./src/CParticleScaleAffector.cpp 

         ./src/CSceneNodeAnimatorCameraFPS.cpp 
         ./src/CSceneNodeAnimatorCameraMaya.cpp 
         ./src/CSceneNodeAnimatorCollisionResponse.cpp 
         ./src/CSceneNodeAnimatorDelete.cpp 
         ./src/CSceneNodeAnimatorFlyCircle.cpp 
         ./src/CSceneNodeAnimatorFlyStraight.cpp 
         ./src/CSceneNodeAnimatorFollowSpline.cpp 
         ./src/CSceneNodeAnimatorRotation.cpp 
         ./src/CSceneNodeAnimatorTexture.cpp 

         ./src/CNullDriver.cpp 
         ./src/COpenGLCacheHandler.cpp 
         ./src/COpenGLDriver.cpp 
         ./src/COpenGLNormalMapRenderer.cpp 
         ./src/COpenGLParallaxMapRenderer.cpp 
         ./src/COpenGLShaderMaterialRenderer.cpp 
         ./src/COpenGLSLMaterialRenderer.cpp 
         ./src/COpenGLExtensionHandler.cpp 
         ./src/CD3D9Driver.cpp 
         ./src/CD3D9HLSLMaterialRenderer.cpp 
         ./src/CD3D9NormalMapRenderer.cpp 
         ./src/CD3D9ParallaxMapRenderer.cpp 
         ./src/CD3D9ShaderMaterialRenderer.cpp 
         ./src/CD3D9Texture.cpp 
         ./src/CGLXManager.cpp 
         ./src/CWGLManager.cpp 


         ./src/CColorConverter.cpp 
         ./src/CImage.cpp 
         ./src/CImageLoaderBMP.cpp 
         ./src/CImageLoaderDDS.cpp 
         ./src/CImageLoaderJPG.cpp 
         ./src/CImageLoaderPCX.cpp 
         ./src/CImageLoaderPNG.cpp 
         ./src/CImageLoaderPSD.cpp 
         ./src/CImageLoaderPVR.cpp 
         ./src/CImageLoaderTGA.cpp 
         ./src/CImageLoaderPPM.cpp 
         ./src/CImageLoaderWAL.cpp 
         ./src/CImageLoaderRGB.cpp 
         ./src/CImageWriterBMP.cpp 
         ./src/CImageWriterJPG.cpp 
         ./src/CImageWriterPCX.cpp 
         ./src/CImageWriterPNG.cpp 
         ./src/CImageWriterPPM.cpp 
         ./src/CImageWriterPSD.cpp 
         ./src/CImageWriterTGA.cpp 

         ./src/CVideoModeList.cpp 
         ./src/CFPSCounter.cpp 

         ./src/CSoftwareDriver.cpp 
         ./src/CSoftwareTexture.cpp 
         ./src/CTRFlat.cpp 
         ./src/CTRFlatWire.cpp 
         ./src/CTRGouraud.cpp 
         ./src/CTRGouraudWire.cpp 
         ./src/CTRNormalMap.cpp 
         ./src/CTRStencilShadow.cpp 
         ./src/CTRTextureFlat.cpp 
         ./src/CTRTextureFlatWire.cpp 
         ./src/CTRTextureGouraud.cpp 
         ./src/CTRTextureGouraudAdd.cpp 
         ./src/CTRTextureGouraudNoZ.cpp 
         ./src/CTRTextureGouraudWire.cpp 
         ./src/CZBuffer.cpp 
         ./src/CTRTextureGouraudVertexAlpha2.cpp 
         ./src/CTRTextureGouraudNoZ2.cpp 
         ./src/CTRTextureLightMap2_M2.cpp 
         ./src/CTRTextureLightMap2_M4.cpp 
         ./src/CTRTextureLightMap2_M1.cpp 
         ./src/CSoftwareDriver2.cpp 
         ./src/CSoftwareTexture2.cpp 
         ./src/CTRTextureGouraud2.cpp 
         ./src/CTRGouraud2.cpp 
         ./src/CTRGouraudAlpha2.cpp 
         ./src/CTRGouraudAlphaNoZ2.cpp 
         ./src/CTRTextureDetailMap2.cpp 
         ./src/CTRTextureGouraudAdd2.cpp 
         ./src/CTRTextureGouraudAddNoZ2.cpp 
         ./src/CTRTextureWire2.cpp 
         ./src/CTRTextureLightMap2_Add.cpp 
         ./src/CTRTextureLightMapGouraud2_M4.cpp 
         ./src/IBurningShader.cpp 
         ./src/CTRTextureBlend.cpp 
         ./src/CTRTextureGouraudAlpha.cpp 
         ./src/CTRTextureGouraudAlphaNoZ.cpp 
         ./src/CDepthBuffer.cpp 
         ./src/CBurningShader_Raster_Reference.cpp 
        
         ./src/CFileList.cpp 
         ./src/CFileSystem.cpp 
         ./src/CLimitReadFile.cpp 
         ./src/CMemoryFile.cpp 
         ./src/CReadFile.cpp 
         ./src/CWriteFile.cpp 
         ./src/CXMLReader.cpp 
         ./src/CXMLWriter.cpp 
         ./src/CWADReader.cpp 
         ./src/CZipReader.cpp 
         ./src/CPakReader.cpp 
         ./src/CNPKReader.cpp 
         ./src/CTarReader.cpp 
         ./src/CMountPointReader.cpp 
         ./src/irrXML.cpp 
         ./src/CAttributes.cpp 
         ./src/lzma/LzmaDec.c


         ./src/CIrrDeviceSDL.cpp 
         ./src/CIrrDeviceLinux.cpp 
         ./src/CIrrDeviceConsole.cpp 
         ./src/CIrrDeviceStub.cpp 
         ./src/CIrrDeviceWin32.cpp 
         ./src/CIrrDeviceFB.cpp 
         ./src/CLogger.cpp 
         ./src/COSOperator.cpp 
         ./src/Irrlicht.cpp 
         ./src/os.cpp 
         ./src/leakHunter.cpp 
         ./src/CProfiler.cpp 
         ./src/utf8.cpp 

         ./src/CGUIButton.cpp 
         ./src/CGUICheckBox.cpp 
         ./src/CGUIComboBox.cpp 
         ./src/CGUIContextMenu.cpp 
         ./src/CGUIEditBox.cpp 
         ./src/CGUIEnvironment.cpp 
         ./src/CGUIFileOpenDialog.cpp 
         ./src/CGUIFont.cpp 
         ./src/CGUIImage.cpp 
         ./src/CGUIInOutFader.cpp 
         ./src/CGUIListBox.cpp 
         ./src/CGUIMenu.cpp 
         ./src/CGUIMeshViewer.cpp 
         ./src/CGUIMessageBox.cpp 
         ./src/CGUIModalScreen.cpp 
         ./src/CGUIScrollBar.cpp 
         ./src/CGUISpinBox.cpp 
         ./src/CGUISkin.cpp 
         ./src/CGUIStaticText.cpp 
         ./src/CGUITabControl.cpp 
         ./src/CGUITable.cpp 
         ./src/CGUIToolBar.cpp 
         ./src/CGUIWindow.cpp 
         ./src/CGUIColorSelectDialog.cpp 
         ./src/CDefaultGUIElementFactory.cpp 
         ./src/CGUISpriteBank.cpp 
         ./src/CGUIImageList.cpp 
         ./src/CGUITreeView.cpp 
         ./src/CGUIProfiler.cpp
   
         ./src/zlib/adler32.c 
         ./src/zlib/compress.c 
         ./src/zlib/crc32.c 
         ./src/zlib/deflate.c 
         ./src/zlib/inffast.c 
         ./src/zlib/inflate.c 
         ./src/zlib/inftrees.c 
         ./src/zlib/trees.c 
         ./src/zlib/uncompr.c 
         ./src/zlib/zutil.c 

         ./src/jpeglib/jcapimin.c 
         ./src/jpeglib/jcapistd.c 
         ./src/jpeglib/jccoefct.c 
         ./src/jpeglib/jccolor.c 
         ./src/jpeglib/jcdctmgr.c 
         ./src/jpeglib/jchuff.c 
         ./src/jpeglib/jcinit.c 
         ./src/jpeglib/jcmainct.c 
         ./src/jpeglib/jcmarker.c 
         ./src/jpeglib/jcmaster.c 
         ./src/jpeglib/jcomapi.c 
         ./src/jpeglib/jcparam.c 
         ./src/jpeglib/jcprepct.c 
         ./src/jpeglib/jcsample.c 
         ./src/jpeglib/jctrans.c 
         ./src/jpeglib/jdapimin.c 
         ./src/jpeglib/jdapistd.c 
         ./src/jpeglib/jdatadst.c 
         ./src/jpeglib/jdatasrc.c 
         ./src/jpeglib/jdcoefct.c 
         ./src/jpeglib/jdcolor.c 
         ./src/jpeglib/jddctmgr.c 
         ./src/jpeglib/jdhuff.c 
         ./src/jpeglib/jdinput.c 
         ./src/jpeglib/jdmainct.c 
         ./src/jpeglib/jdmarker.c 
         ./src/jpeglib/jdmaster.c 
         ./src/jpeglib/jdmerge.c 
         ./src/jpeglib/jdpostct.c 
         ./src/jpeglib/jdsample.c 
         ./src/jpeglib/jdtrans.c 
         ./src/jpeglib/jerror.c 
         ./src/jpeglib/jfdctflt.c 
         ./src/jpeglib/jfdctfst.c 
         ./src/jpeglib/jfdctint.c 
         ./src/jpeglib/jidctflt.c 
         ./src/jpeglib/jidctfst.c 
         ./src/jpeglib/jidctint.c 
         ./src/jpeglib/jmemmgr.c 
         ./src/jpeglib/jmemnobs.c 
         ./src/jpeglib/jquant1.c 
         ./src/jpeglib/jquant2.c 
         ./src/jpeglib/jutils.c 
         ./src/jpeglib/jcarith.c 
         ./src/jpeglib/jdarith.c 
         ./src/jpeglib/jaricom.c

         ./src/libpng/png.c 
         ./src/libpng/pngerror.c 
         ./src/libpng/pngget.c 
         ./src/libpng/pngmem.c 
         ./src/libpng/pngpread.c 
         ./src/libpng/pngread.c 
         ./src/libpng/pngrio.c 
         ./src/libpng/pngrtran.c 
         ./src/libpng/pngrutil.c 
         ./src/libpng/pngset.c 
         ./src/libpng/pngtrans.c 
         ./src/libpng/pngwio.c 
         ./src/libpng/pngwrite.c 
         ./src/libpng/pngwtran.c 
         ./src/libpng/pngwutil.c

         ./src/aesGladman/aescrypt.cpp 
         ./src/aesGladman/aeskey.cpp 
         ./src/aesGladman/aestab.cpp 
         ./src/aesGladman/fileenc.cpp 
         ./src/aesGladman/hmac.cpp 
         ./src/aesGladman/prng.cpp 
         ./src/aesGladman/pwd2key.cpp 
         ./src/aesGladman/sha1.cpp 
         ./src/aesGladman/sha2.cpp

         ./src/bzip2/blocksort.c 
         ./src/bzip2/huffman.c 
         ./src/bzip2/crctable.c 
         ./src/bzip2/randtable.c 
         ./src/bzip2/bzcompress.c 
         ./src/bzip2/decompress.c 
         ./src/bzip2/bzlib.c )














add_library( ${libname} STATIC ${src} )
set( libs ${OPENGL_gl_LIBRARY} )
if ( UNIX )
    #target_link_libraries( ${libname} m dl )
    set( libs ${libs} m dl ${X11_X11_LIB} ${X11_Xxf86vm_LIB} ${X11_Xext_LIB} ${X11_Xcursor_LIB} )
endif ( UNIX )

target_link_libraries( ${libname} ${libs} )











