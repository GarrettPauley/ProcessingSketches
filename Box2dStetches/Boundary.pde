
// Static block that other blocks will bounce off of. 

class Boundary {
  float x, y; 
  float w, h; 
  Body body; 
  
  Boundary(float x_, float y_, float w_, float h_){
    x = x_; 
    y = y_; 
    w = w_; 
    h = h_; 
    makeBody(new Vec2(x,y), w, h); 
    
    
  }
  
  void makeBody(Vec2 position, float width_, float height_){ 
    // create body definition;
    BodyDef bodyDef = new BodyDef(); 
    bodyDef.type = BodyType.STATIC; 
    bodyDef.setPosition(box2d.coordPixelsToWorld(position)); 
    body = box2d.createBody(bodyDef); 
    
    // create Shape; 
    PolygonShape polyShape = new PolygonShape(); 
    float box2DsurfaceWidth = box2d.scalarPixelsToWorld(width_ / 2); 
    float box2DsurfaceHeight = box2d.scalarPixelsToWorld(height_ / 2); 
    polyShape.setAsBox(box2DsurfaceWidth, box2DsurfaceHeight);
    
    
    // create fixtures. 
    FixtureDef fixture = new FixtureDef(); 
    fixture.shape = polyShape;
    fixture.friction = 0.4; 
    fixture.restitution = 1.5; 
    fixture.density = 1;
    
    body.createFixture(fixture);
  }
  
  void display(){ 
   // get the pixel coordinates. 
    Vec2 position = box2d.getBodyPixelCoord(body); 
    pushMatrix(); 
    translate(position.x, position.y); 
    stroke(0); 
    fill(175); 
    rect(0,0, w,h); 
    
    popMatrix(); 
    
  }
  
} 
