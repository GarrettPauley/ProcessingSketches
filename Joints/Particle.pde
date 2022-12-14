class Particle { 
 Body body; 
 float r; 
 
 Particle(float x, float y, float r_){ 
  r = r_; 
  makeBody(x, y, r_); 
  body.setUserData(this); 
 }
 
 void killBody(){ 
  box2d.destroyBody(body);  
 }
 
 
 boolean done(){
 // Should the particle be deleated from the world? 
 
 Vec2 pos = box2d.getBodyPixelCoord(body);
 
 // Is it off the bottom of the screen? 
 
 if(pos.y > height + r * 2){ 
  killBody();
  return true; 
 }
 return false; 
   
 }
 
 void display(){ 
  Vec2 pos = box2d.getBodyPixelCoord(body); 
  // get angle of rotation. 
  float a = body.getAngle(); 
  
  pushMatrix(); 
  
  translate(pos.x, pos.y); 
  rotate(-a); 
  fill(175); 
  stroke(0); 
  strokeWeight(2); 
  ellipse(0,0, r*2, r*2); 
  // Add a line through the ellipse so that we can see the rotation. 
  line(0,0, r, 0); 
  
  popMatrix(); 
   
 }
 
 void makeBody(float x, float y, float r){ 
  // add the particle to the Box2d world; 
  // (1) Create the body Definition. 
  BodyDef bd = new BodyDef(); 
  bd.position = box2d.coordPixelsToWorld(x,y); // set it's position  
  bd.type = BodyType.DYNAMIC;                  // set it's type. 
  
  body = box2d.world.createBody(bd);           // Create the body. 
  
  // (2) Define the shape of the body. 
  CircleShape cs = new CircleShape(); 
  cs.m_radius = box2d.scalarPixelsToWorld(r); 
  
  // (3) Create the fixture. The glue that holds the body and shape together. 
  FixtureDef fd = new FixtureDef(); 
  fd.shape = cs; 
  fd.density = 2.0; 
  fd.friction = 0.01; 
  fd.restitution = 0.3; // bounciness. 
  
  body.createFixture(fd); 
  
  // Give it a random initial velocity
  body.setAngularVelocity(random(-10,10));
  
   
 }
  
}
