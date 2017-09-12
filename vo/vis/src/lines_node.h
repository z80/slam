
#ifndef __LINES_NODE_H_
#define __LINES_NODE_H_

#include "irrlicht.h"
#include "IAnimatedMeshSceneNode.h"
#include <string>
#include <list>

using namespace irr;

using namespace core;
using namespace scene;
using namespace video;
using namespace io;
using namespace gui;


class LinesNode: public ISceneNode
{
public:
    LinesNode( ISceneNode * parent, ISceneManager * smgr, int id = -1 );
    ~LinesNode();

    void clear();
    void addLine( const core::vector3df & from, const core::vector3df & to, const video::SColor & color );

    virtual void OnRegisterSceneNode();
    virtual void render();
    virtual const core::aabbox3df & getBoundingBox() const;
    virtual u32 getMaterialCount() const;
    virtual video::SMaterial & getMaterial( u32 i );

private:
    class Line
    {
    public:
        Line()
        {}

        Line( const core::vector3df & from, const core::vector3df & to, const video::SColor & color )
        {
            this->from  = from;
            this->to    = to;
            this->color = color;
        }

        Line( const Line & inst )
        {
            *this = inst;
        }

        const Line & operator=( const Line & inst )
        {
            if ( this != &inst )
            {
                from  = inst.from;
                to    = inst.to;
                color = inst.color;
            }
            return *this;
        }

        core::vector3df from, to;
        video::SColor   color;
    };

    std::list<Line>     lines;
    core::aabbox3d<f32> box;
    video::SMaterial    material;
};




#endif






