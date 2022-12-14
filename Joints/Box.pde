class Box { 
 // float x,y; we do not need to track location anymore. Box2d will handle that for us.  
 float w, h; 
 Body body; 

 
 Box(float x, float y, float w_, float h_, boolean lock){
  w = w_; 
  h = h_;
  makeBody(new Vec2(x,y), w, h, lock); 
  
 
  
 }
 
 void display(){ 
   Vec2 pos = box2d.getBodyPixelCoord(body); 
   float a = body.getAngle(); 
   
   pushMatrix(); 
   translate(pos.x, pos.y); 
   rotate(-a); // box2d is a counterclockwise rotation. Processing is clockwise. 
   fill(100, 126, 196); 
   stroke(0); 
   rectMode(CENTER); 
   rect(0,0,w,h); 
   popMatrix(); 

   
   
 }
 
 void makeBody(Vec2 center, float w_, float h_, boolean lock){
   
   
     // box2d initialization. 
  
  //Build the body
  BodyDef bd = new BodyDef(); 
  if (lock) bd.type = BodyType.DYNAMIC; 
  else bd.type = BodyType.STATIC; 
  bd.position.set(box2d.coordPixelsToWorld(center)); 
  body = box2d.createBody(bd); 
  
  
  // Build the shape
  PolygonShape ps = new PolygonShape();
  
  float box2dw = box2d.scalarPixelsToWorld(w_ / 2);    //box2d considers the w & h of a rect to be the distance
  float box2dh = box2d.scalarPixelsToWorld(h_ / 2);    // from the center to the edge, which is half of the
                                                    // distance of w & h in processing. 
                                                    
  ps.setAsBox(box2dw, box2dh); 
  
  
  // Fixture
  FixtureDef fd = new FixtureDef(); 
  fd.shape = ps; 
  fd.density = 1; 
  fd.friction = 0.3; 
  fd.restitution = 0.5; //how bouncy is it? 
  
  body.createFixture(fd);
  
  // give it a random initial velocity? 
  
  body.setLinearVelocity(new Vec2(random(-5,5), random(2,5))); 
  body.setAngularVelocity(random(-5,5)); 
  
 }
 
 void killBody(){
  box2d.destroyBody(body); 
 }
  
  
}
