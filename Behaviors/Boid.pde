class Boid{
 PVector position; 
 PVector velocity;  
 PVector acceleration; 
 float r; 
 
  Boid(int x, int y){
    position = new PVector(x,y); 
    velocity = new PVector(random(-1,1), random(-1,1)); // random init velocity
    acceleration = new PVector(); 
    r = 5; 
    
  }
  
  
  void update(){
    velocity.add(acceleration); 
    position.add(velocity); 
    acceleration.mult(0); //clear the net force. 
  }
  
  void display(){
    pushMatrix();
    translate(position.x, position.y); 
    fill(175); 
    ellipse(position.x, position.y, r * 2, r * 2); 
    popMatrix(); 
    
  }
  
  void applyForce(PVector f){
    PVector force = f.copy(); 
    float strength = force.mag(); 
    force.normalize(); 
    force.mult(strength); 
    
    acceleration.add(force); 
  }
  
  
  PVector seek(ArrayList<Boid> boids){
    
    
    
  }
  
  
}
