class Spring{ 
 MouseJoint mouseJoint; 
 
 Spring(){ 
  mouseJoint = null;  
 }
 
 void update(float x, float y){ 
   if(mouseJoint != null){ 
    Vec2 mouseWorldCord = box2d.coordPixelsToWorld(x,y); 
    mouseJoint.setTarget(mouseWorldCord); 
   }
 }
 
 void display(){
  if (mouseJoint != null){ 
   Vec2 v1 = new Vec2(0,0); 
   mouseJoint.getAnchorA(v1); 
   Vec2 v2 = new Vec2(0,0); 
   mouseJoint.getAnchorB(v2); 
   
   // convert these to Processing coordinates. 
   
   v1 = box2d.coordWorldToPixels(v1);
   v2 = box2d.coordWorldToPixels(v2);
   
   // draw the line 
   stroke(0); 
   strokeWeight(2); 
   line(v1.x, v1.y, v2.x, v2.y); 
   
    }
   
 }
 
 void bind(float x, float y, Box box){ 
  // attach the spring to an x,y position and the Box objects position. 
  
  MouseJointDef md = new MouseJointDef(); 
  
  md.bodyA = box2d.getGroundBody(); 
  md.bodyB = box.body; 
  
  Vec2 mp = box2d.coordPixelsToWorld(x,y); 
  
  md.target.set(mp); 
  
  //some attributes of the mouseJoint. 
  md.maxForce = 1000.0 * box.body.m_mass; 
  md.frequencyHz = 5.0; 
  md.dampingRatio = 0.9; 
  
  //make the joint 
  mouseJoint = (MouseJoint) box2d.world.createJoint(md); 
 }
 
 
 void destroy(){ 
  if(mouseJoint != null){ 
   box2d.world.destroyJoint(mouseJoint); 
   mouseJoint = null; 
  }
 }
 
 
  
}
