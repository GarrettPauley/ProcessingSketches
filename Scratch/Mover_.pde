class Mover{
  PVector position; 
  PVector velocity; 
  PVector acceleration; 
  
  
  Mover(){ 
    position = new PVector(random(width), random(height)); 
    velocity = new PVector(); 
    acceleration = new PVector(); 
  }
  
  
  void update(){ 
   position.add(velocity); 
   velocity.add(acceleration);
   acceleration.mult(0); 
  }
  
  void display(){ 
   // display the mover. 
    stroke(0); 
    fill(175); 
    pushMatrix(); 
    translate(position.x, position.y);
    ellipse(0,0, 20,20);
    popMatrix(); 
    
  }
  
  void applyForce(PVector f){ 
   PVector force = f.copy(); 
   float strength = force.mag(); 
   strength = constrain(strength, 0, 0.1); 
   force.normalize(); 
   force.mult(strength); 
   
   acceleration.add(force); 
   
  }
  
}
