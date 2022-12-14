class Box{ 
  float x,y; 
  float w,h; 
  Body body; 
  
  Box(float x_, float y_, float w_, float h_){
    x = x_; 
    y = y_; 
    w = w_; 
    h = h_; 
    
    makeBody(new Vec2(x, y), w, h); 
    
  }
  
  void makeBody(Vec2 position, float w_, float h_){
    //create body def 
    BodyDef bd = new BodyDef(); 
    bd.setPosition(box2d.coordPixelsToWorld(position)); 
    bd.type = BodyType.DYNAMIC; 
    body = box2d.createBody(bd); 
    
    
    
    // create shape
    PolygonShape ps = new PolygonShape(); 
    float box2dW = box2d.scalarPixelsToWorld(w_ / 2); 
    float box2dH = box2d.scalarPixelsToWorld(h_ / 2);
    ps.setAsBox(box2dW, box2dH);
    
    
    // create fixture. 
    FixtureDef fd  = new FixtureDef();
    fd.shape = ps; 
    fd.density = 1; 
    fd.restitution = 0.4; 
    fd.friction = 0.3;
    
    body.createFixture(fd); 
    
  }
  
  void display(){ 
    // Infinite falling. 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.y > height){ 
     pos.y = pos.y % height;  
     
    }
    
    float a = body.getAngle(); 
    pushMatrix(); 
    translate(pos.x, pos.y); 
    rect(0,0, w,h); 
    rotate(-a); 
    
    popMatrix(); 
    
    
  }
  
  void checkEdges(Vec2 pos){ 
   if(pos.y > height){ 
    pos.y = 0;  
   }
   
    
  }
  
} 
