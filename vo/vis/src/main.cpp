

#include "irrlicht.h"
#include "target_ctrl.h"
#include "lines_node.h"

#include "vo.h"

#define WND_WIDTH  1800
#define WND_HEIGHT 1000

using namespace irr;

using namespace core;
using namespace scene;
using namespace video;
using namespace io;
using namespace gui;

static void posToIrr( const core::vector3df  & pos, core::vector3df  & res );
static void quatToIrr( const core::quaternion & pos, core::quaternion & res );
static void applyPose( Vo * sen, ISceneNode * node );
static void createOrigin( LinesNode * lines );
static void createXYGrid( LinesNode * lines, int steps = 10, float step = 50.0f );


int main()
{
	IrrlichtDevice *device =
        createDevice( video::EDT_OPENGL, dimension2d<u32>(WND_WIDTH, WND_HEIGHT), 16,
            false, false, true, 0 );

	if (!device)
		return 1;

    //FusionHdw fh;
    Vo fh;

    TargetCtrl targetCtrl;

    device->setEventReceiver( &targetCtrl );
    device->setWindowCaption( L"Fusion" );

	IVideoDriver* driver = device->getVideoDriver();
	ISceneManager* smgr = device->getSceneManager();
	IGUIEnvironment* guienv = device->getGUIEnvironment();

    // Create UI
    //guienv->addButton( rect<s32>( 10,  10, 110, 50 ),  0, 101, L"Use regular (X)" );
    //guienv->addButton( rect<s32>( 120, 10, 220, 50 ),  0, 102, L"Use VR (X)" );
    guienv->addButton( rect<s32>( 230, 10, 330, 50 ),  0, 105, L"Load config");
    //guienv->addButton( rect<s32>( 10,  70, 110, 120 ), 0, 103, L"Synch device" );
    //guienv->addButton( rect<s32>( 120, 70, 220, 120 ), 0, 104, L"Print debug info" );

    smgr->addLightSceneNode( 0, core::vector3df(0.0f,350.0f,0.0f),
                             video::SColorf(1.0f,1.0f,1.0f),400.0f );

	scene::ISceneNode* skyboxNode = smgr->addSkyBoxSceneNode(
                                            driver->getTexture("craterlake_up.jpg"),
											driver->getTexture("craterlake_dn.jpg"),
											driver->getTexture("craterlake_lf.jpg"),
											driver->getTexture("craterlake_rt.jpg"),
											driver->getTexture("craterlake_ft.jpg"),
											driver->getTexture("craterlake_bk.jpg") );

    // Create camera.
    ICameraSceneNode * cameraNode = smgr->addCameraSceneNode();

    ISceneNode * fusedNode;
    fusedNode = smgr->addMeshSceneNode(smgr->getMesh("mir.ms3d"));
    fusedNode->setMaterialFlag(EMF_LIGHTING, false);
    fusedNode->setMaterialType(EMT_TRANSPARENT_ALPHA_CHANNEL);
    fusedNode->setMaterialTexture(0, driver->getTexture("cube.png"));
    fusedNode->setScale(core::vector3df( 0.02f, 0.02f, 0.02f));

    // Create ref frame grid.
    LinesNode * linesNode = new LinesNode( smgr->getRootSceneNode(), smgr );
    createOrigin( linesNode );
    createXYGrid( linesNode );

    u32 oldT = device->getTimer()->getRealTime();
	while(device->run())
	{
        u32 t = device->getTimer()->getRealTime();
        s32 dt = t - oldT;
        oldT = t;

        // Built-in camera movements.
        targetCtrl.processFrame( (f32)dt );
        targetCtrl.camera( cameraNode );
        // Sixense pose.
        applyPose( &fh, fusedNode );

        driver->beginScene(ECBF_COLOR | ECBF_DEPTH, SColor(255,100,101,140));

        driver->setViewPort( core::rect<irr::s32>( 0, 0, WND_WIDTH, WND_HEIGHT ) );
        smgr->drawAll();
        guienv->drawAll();

		driver->endScene();

        // Check if it's time to exit.
        if ( targetCtrl.close() )
            device->closeDevice();
	}
	device->drop();

	return 0;
}

static void posToIrr( const core::vector3df  & pos, core::vector3df  & res )
{
    res.X = -pos.X;
    res.Y =  pos.Y;
    res.Z = -pos.Z;
}

static void quatToIrr( const core::quaternion & pos, core::quaternion & res )
{
    res.W =  pos.W;
    res.X =  -pos.X;
    res.Y =  -pos.Z;
    res.Z =  -pos.Y;
}

static void applyPose( Vo * fh, ISceneNode * fusedNode )
{
    core::vector3df at;
    core::quaternion q;

    core::vector3df  atIrr;
    core::quaternion qIrr;

    core::vector3df euler;

    //fh->poseFused(at.X, at.Y, at.Z, q.W, q.X, q.Y, q.Z );
    double x, y, z, qw, qx, qy, qz;
    fh->pose( x, y, z, qw, qx, qy, qz );
    at.X = x;
    at.Y = y;
    at.Z = z;
    q.W = qw;
    q.X = qx;
    q.Y = qy;
    q.Z = qz;

    at *= 1.0f;

    posToIrr(at, atIrr);
    quatToIrr(q, qIrr);

    qIrr.toEuler(euler);
    euler *= core::RADTODEG;

    fusedNode->setPosition(atIrr);
    fusedNode->setRotation(euler);
}

static void createOrigin( LinesNode * lines )
{
    core::vector3df from( -1000.0f, 0.0f, 0.0f );
    core::vector3df to( 1000.0f, 0.0f, 0.0f );
    video::SColor   color( 255, 200, 0, 0 );
    
    lines->addLine( from ,to, color );

    from = core::vector3df( 0.0f, 0.0f, -1000.0f );
    to   = core::vector3df( 0.0f, 0.0f,  1000.0f );
    color = video::SColor( 255, 0, 200, 0 );

    lines->addLine( from ,to, color );

    from = core::vector3df( 0.0f, -1000.0f, 0.0f );
    to   = core::vector3df( 0.0f,  1000.0f, 0.0f );
    color = video::SColor( 255, 0, 0, 200 );

    lines->addLine( from ,to, color );
}

static void createXYGrid( LinesNode * lines, int steps, float step )
{
    const float dist = static_cast<float>( steps ) * step;
    for ( int i=-steps; i<=steps; i++ )
    {
        for ( int j=1; j<=steps; j++ )
        {
            float d = static_cast<float>( j ) * step;
            core::vector3df from( -dist, 0.0f, d );
            core::vector3df to( dist, 0.0f, d );
            video::SColor   color( 255, 150, 0, 0 );

            lines->addLine( from ,to, color );
        }
    }
    for ( int i=-steps; i<=steps; i++ )
    {
        for ( int j=-steps; j<=steps; j++ )
        {
            float d = static_cast<float>( j ) * step;
            core::vector3df from( d, 0.0f, 0.0f );
            core::vector3df to( d, 0.0f, dist );
            video::SColor   color( 255, 0, 150, 0 );

            lines->addLine( from ,to, color );
        }
    }
}











