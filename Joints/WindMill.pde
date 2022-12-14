class WindMill { 
 RevoluteJoint joint; 
 Box box1; 
 Box box2; 
 
 WindMill(float x, float y) { 
  box1 = new Box(x, y, 120, 10, false); 
  box2 = new Box(x, y, 200,10, true);
  
  RevoluteJointDef rjd = new RevoluteJointDef(); 
  rjd.initialize(box1.body, box2.body, box1.body.getWorldCenter()); // The joint connects body one and two, anchoring at body1.WorldCenter; 
  rjd.motorSpeed = -(PI * 2); 
  rjd.maxMotorTorque = 2000.0; 
  rjd.enableMotor = true; 
  
  joint =(RevoluteJoint) box2d.world.createJoint(rjd); 
 }
  
 void toggleMotor(){ 
  boolean motorstatus = joint.isMotorEnabled(); 
  joint.enableMotor(!motorstatus); 
 }
 
 boolean motorOn(){ 
  return joint.isMotorEnabled();  
 }
 
 void display() { 
  box1.display(); 
  box2.display(); 
  
  Vec2 anchor = box2d.coordWorldToPixels(box1.body.getWorldCenter()); 
  fill(0); 
  noStroke(); 
  ellipse(anchor.x, anchor.y, 8, 8); 
 }
  
}
