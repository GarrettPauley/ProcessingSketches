
class CannonBall{
  
PVector position; 
PVector velocity; 
PVector acceleration; 
float mass; 
float r = 8; 
float topSpeed = 5; 

  
  CannonBall(float x, float y, float mass_){ 
    position = new PVector(x,y); 
    velocity = new PVector(); 
    acceleration = new PVector(); 
    mass = mass_; 
    
    
    
  } 
  
  
  void update(){ 
    velocity.add(acceleration);
    velocity.limit(topSpeed); 
    position.add(velocity); 
    acceleration.mult(0); 
} 
 


void applyForce(PVector force_){ 
  PVector force = PVector.div(force_, mass);  
  acceleration.add(force); 
} 

 
  void display(){
  
  stroke(0); 
  strokeWeight(2); 
  pushMatrix(); 
  translate(position.x, position.y); 
  ellipse(0,0, mass * 2, mass*2 );
  popMatrix(); 
   
  
}
  
  
  




}
