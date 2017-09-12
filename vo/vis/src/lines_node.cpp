
#include "lines_node.h"


LinesNode::LinesNode( ISceneNode * parent, ISceneManager * smgr, int id )
    : ISceneNode( parent, smgr, id )
{
    material.Wireframe = true;
    material.Lighting  = false;

    ISceneNode::setAutomaticCulling( irr::scene::EAC_OFF );
}

LinesNode::~LinesNode()
{

}

void LinesNode::clear()
{
    lines.clear();
}

void LinesNode::addLine( const core::vector3df & from, const core::vector3df & to, const video::SColor & color )
{
    lines.push_back( Line( from, to, color ) );
}

void LinesNode::OnRegisterSceneNode()
{
    if ( IsVisible )
        SceneManager->registerNodeForRendering( this );

    ISceneNode::OnRegisterSceneNode();
}

void LinesNode::render()
{
    video::IVideoDriver * driver = SceneManager->getVideoDriver();

    driver->setMaterial( material );
    driver->setTransform( video::ETS_WORLD, AbsoluteTransformation );

    for ( std::list<Line>::iterator it=lines.begin(); it!=lines.end(); it++ )
    {
        Line & line = *it;
        driver->draw3DLine( line.from, line.to, line.color );
    }
}

const core::aabbox3df & LinesNode::getBoundingBox() const
{
    return box;
}

u32 LinesNode::getMaterialCount() const
{
    return 1;
}

video::SMaterial & LinesNode::getMaterial( u32 i )
{
    return material;
}




