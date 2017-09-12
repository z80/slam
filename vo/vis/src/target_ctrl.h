
#ifndef __TAGET_CTRL_H_
#define __TAGET_CTRL_H_

#include "irrlicht.h"
#include <vector>

class Sixense;

class TargetCtrl: public irr::IEventReceiver
{
public:
    TargetCtrl();
    ~TargetCtrl();

    virtual bool OnEvent(const irr::SEvent & event);
    void processFrame( irr::f32 dt );
    void camera( irr::scene::ICameraSceneNode * cam );
    bool close() const;

    bool synchDevice();
    bool useVr() const;
	bool printDebug();
    bool loadConfig();

private:
    void processMovement( irr::f32 dt );
    bool Keys[irr::KEY_KEY_CODES_COUNT];
    irr::core::position2di mousePos,
                           mousePosPrev;
    bool leftButtonDown;
    bool rightButtonDown;
    bool fwdDown;
    bool bwdDown;
    bool leftDown;
    bool rightDown;

    irr::f32 azimuth;
    irr::f32 elevation;
    irr::f32 distance;
    irr::s32 wheel;

    irr::core::vector3df lookAt;

    bool doClose;
    bool doSynch;
    bool doUseVr;
	bool doPrintDebug;
    bool doLoadConfig;

    static const irr::f32 LINEAR_SPEED;
};



#endif


