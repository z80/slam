
#include "target_ctrl.h"
#include "IEventReceiver.h"
#include <iostream>

using namespace irr;
using namespace core;

const irr::f32 TargetCtrl::LINEAR_SPEED = 0.1f;

TargetCtrl::TargetCtrl()
    : irr::IEventReceiver()
{
    doClose = false;
    irr::u32 k;
    for (k = 0; k < sizeof(Keys) / sizeof(*Keys); ++k)
       Keys[k] = false;
    mousePos = irr::core::position2di( 0, 0 );
    leftButtonDown  = false;
    rightButtonDown = false;
    fwdDown = false;
    bwdDown = false;
    leftDown = false;
    rightDown = false;
    doLoadConfig = false;

    wheel = 0;

    mousePosPrev.X = -1;
    mousePosPrev.Y = -1;

    azimuth   = 0.0f;
    elevation = 45.0f;
    distance  = 100.0f;

    lookAt = core::vector3df( 0.0f, 0.0f, 0.0f );

    doSynch      = false;
    doUseVr      = false;
	doPrintDebug = false;
}

TargetCtrl::~TargetCtrl()
{

}

bool TargetCtrl::OnEvent(const irr::SEvent & event)
{
    if (event.EventType == irr::EET_KEY_INPUT_EVENT)
    {
        bool down = event.KeyInput.PressedDown;
        EKEY_CODE key = event.KeyInput.Key;
        Keys[key] = down;

        if ( event.KeyInput.Key == KEY_KEY_W )
            fwdDown = event.KeyInput.PressedDown;
        else if ( event.KeyInput.Key == KEY_KEY_S )
            bwdDown = event.KeyInput.PressedDown;
        else if ( event.KeyInput.Key == KEY_KEY_A )
           leftDown = event.KeyInput.PressedDown;
        else if ( event.KeyInput.Key == KEY_KEY_D )
            rightDown = event.KeyInput.PressedDown;
        else if (event.KeyInput.Key == KEY_ESCAPE)
        {
            //device->closeDevice();
            doClose = true;
            return true;
        }
        return true;
    }
    else if (event.EventType == irr::EET_MOUSE_INPUT_EVENT)
    {
        // Remember the mouse state
        switch(event.MouseInput.Event)
        {
        case EMIE_LMOUSE_PRESSED_DOWN:
            leftButtonDown = true;
            break;

        case EMIE_LMOUSE_LEFT_UP:
            leftButtonDown = false;
            break;

        case EMIE_RMOUSE_PRESSED_DOWN:
            rightButtonDown = true;
            break;

        case EMIE_RMOUSE_LEFT_UP:
            rightButtonDown = false;
            break;

        case EMIE_MOUSE_MOVED:
            mousePos.X = event.MouseInput.X;
            mousePos.Y = event.MouseInput.Y;
            break;

        case EMIE_MOUSE_WHEEL:
            wheel = static_cast<int>( event.MouseInput.Wheel );
            break;

        default:
            // We won't use the wheel
            break;
        }

    }
    else if ( event.EventType == EET_GUI_EVENT )
    {
        if ( event.GUIEvent.EventType == irr::gui::EGET_BUTTON_CLICKED )
        {
            s32 id = event.GUIEvent.Caller->getID();
            switch ( id )
            {
            case 101:
                doUseVr = false;
                break;
            case 102:
                doUseVr = true;
                break;
            case 103:
                // First pose button is pressed.
                doSynch = true;
                break;
			case 104:
				doPrintDebug = true;
				break;
			case 105:
				// Update system parameters.
                doLoadConfig = true;
				break;
            }
        }
    }


    return false;
}

void TargetCtrl::processFrame( f32 dt )
{
    //std::cout << "mousePos: " << mousePos.X << ", " << mousePos.Y <<
    //             "prev: " << mousePosPrev.X << ", " << mousePosPrev.Y << std::endl;
    (void)dt;
    position2di dPos;
    if ( ( mousePosPrev.X >= 0 ) && ( mousePosPrev.Y >= 0 ) )
        dPos = mousePos - mousePosPrev;
    else
        dPos = position2di( 0, 0 );
    mousePosPrev = mousePos;

    f32 dAz = 0.0f;
    f32 dEl = 0.0f;
    if ( ( rightButtonDown ) && ( ( dPos.X != 0 ) || (dPos.Y != 0) ) )
    {
        dAz = static_cast<f32>( dPos.X ) * 360.0f/800.0f;
        dEl = static_cast<f32>( dPos.Y ) * 180.0f/600.0f;
    }
    f32 dDist = static_cast<f32>( -wheel ) * 5.0f;
    wheel = 0;

    azimuth += dAz;
    elevation += dEl;
    distance  += dDist;

    // Limitations just in case.
    if ( azimuth > 360.0f )
        azimuth -= 360.0f;
    else if ( azimuth < 0.0f )
        azimuth += 360.0f;
    if ( elevation > 89.0f )
        elevation = 89.0f;
    else if ( elevation < -89.0f )
        elevation = -89.0f;
    if ( distance < 3.0f )
        distance = 3.0f;
    else if ( distance > 1000.0f )
        distance = 1000.0f;

    processMovement( dt );
}

void TargetCtrl::processMovement( irr::f32 dt )
{
    irr::f32 az = azimuth / 180.0f * 3.1415926535f;
    irr::f32 co = cos(az);
    irr::f32 si = sin(az);

    // Yes, coordinate system is left, not right(!!!)
    core::vector3df fwd   = core::vector3df( co, 0.0, -si );
    core::vector3df right = core::vector3df( si, 0.0, co );

    irr::f32 vx = 0.0f;
    if ( leftDown )
        vx += 1.0f;
    if ( rightDown )
        vx -= 1.0f;

    irr::f32 vz = 0.0f;
    if ( fwdDown )
        vz += 1.0f;
    if ( bwdDown )
        vz -= 1.0f;
    lookAt += right * (vx * dt * LINEAR_SPEED);
    lookAt += fwd   * (vz * dt * LINEAR_SPEED);
}

void TargetCtrl::camera( scene::ICameraSceneNode * cam )
{
    f32 elSi = sinf(elevation * core::DEGTORAD);
    f32 elCo = cosf(elevation * core::DEGTORAD);

    f32 azSi = sinf(azimuth * core::DEGTORAD);
    f32 azCo = cosf(azimuth * core::DEGTORAD);

    // these are switched around a little from what i posted above
    irr::core::vector3df at;
    at.X = lookAt.X - distance * elCo * azCo;
    at.Z = lookAt.Z + distance * elCo * azSi;
    at.Y = lookAt.Y + distance * elSi;

    cam->setPosition( at );
    cam->setTarget( lookAt );
    cam->updateAbsolutePosition();
}

bool TargetCtrl::close() const
{
    return doClose;
}

bool TargetCtrl::synchDevice()
{
    bool res = doSynch;
    doSynch = false;
    return res;
}

bool TargetCtrl::useVr() const
{
    bool res = doUseVr;
    return res;
}

bool TargetCtrl::printDebug()
{
	bool res = doPrintDebug;
	doPrintDebug = false;
	return res;
}


bool TargetCtrl::loadConfig()
{
    bool res = doLoadConfig;
    doLoadConfig = false;
    return res;
}








