class Attractor { 
  
  float r; 
  PVector position; 
  float forceStrength = 300; 
  Attractor(float r_, PVector position_){ 
    r = r_; 
    position = position_; 
    
  }
  
  void display(){
    
    pushMatrix(); 
    translate(position.x, position.y); 
    stroke(0); 
    fill(0, 0, 255); 
    ellipse(0,0,r,r); 
    popMatrix(); 
    
  }
  
  PVector attract(Particle p){ 
    PVector direction = PVector.sub(position, p.position); 
    float distance = direction.mag(); 
    distance = constrain(distance, 10,12); 
    direction.normalize(); 
    float strength = forceStrength / (distance * distance); 
    direction.mult(strength);
    
    return direction; 
    
    
 
    
    
  }
  
  
}
