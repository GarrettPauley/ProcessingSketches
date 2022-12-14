
import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2d; 
BodyDef bd = new BodyDef(); 

void setup(){ 
  size(640,480) ;
  box2d = new Box2DProcessing(this); 
  box2d.createWorld();
  Body body = box2d.createBody(bd); 
  
  
} 


void draw(){ 
  Vec2 center = box2d.coordPixelsToWorld(width/2, height/2); 
  body.position.set(center); 
  
  
  
  
} 
