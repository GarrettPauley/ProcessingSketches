class Agent{
 PVector position; 
 PVector velocity; 
 PVector acceleration; 
 float maxSpeed; 
 float maxForce; 
 int r;  

 
 Agent(PVector pos){
  position = pos; 
  velocity = new PVector(); 
  acceleration = new PVector(); 
  r = 10;
  maxSpeed = 5; 
  maxForce = 0.1; 

 }
 
 
  
  void display(){
    
   float theta = velocity.heading(); 
   pushMatrix(); 
     fill(175); 
     stroke(0); 
     
     translate(position.x, position.y);
   
     
     beginShape();
     rotate(theta + PI/2);
       vertex(0, -r*2); 
       vertex(-r, r*2); 
       vertex(r, r*2);
     endShape();
     
   popMatrix(); 
     
   
    
  }
  
  
  void update(){
    velocity.add(acceleration); 
    position.add(velocity); 
    acceleration.mult(0); 
  }
  
  
  void applyForce(PVector f){
    acceleration.add(f); 
    
  }
  
  PVector seek (PVector target){
    //Get direction to target
    PVector t = target.copy(); 
    PVector steer = PVector.sub(t, position);
    float strength = constrain(steer.mag(), 0, maxSpeed); 
    steer.normalize(); 
    
    // Move in that direction without exceeding maxSpeed
     steer.mult(strength); 
    return steer; 
    
  }
  
  void steer(PVector target){
    PVector currentVelocity = velocity.copy(); 
    PVector targetVelocity = PVector.sub(target,position); 
    
    PVector steerVelocity = PVector.sub(targetVelocity, currentVelocity); 
    steerVelocity.limit(maxForce); 
    applyForce(steerVelocity); 
    
  }
  
 void arrive(PVector target){
   PVector desired = PVector.sub(target,position); 
   float d = desired.mag(); 
   desired.normalize(); 
   if( d < 100){
     
     float m = map(d, 0, 100, 0, maxSpeed); 
     desired.mult(m); 
   }
   
   else{
    desired.mult(maxSpeed);  
   }
   PVector steer = PVector.sub(desired, velocity); 
   steer.limit(maxForce);
   applyForce(steer);
   
  }
  
  
  ArrayList<PVector> wanderingSpace(Agent a){
    ArrayList<PVector> locations = new ArrayList<PVector>(); 
    float r = 100; 
    
    for(int i = 0; i < 30; i++){
    
    float theta = random(0, TWO_PI); 
    float cx = random(0.1,r) * cos(theta); 
    float cy = random(0.1, r) * sin(theta);
     locations.add(new PVector(cx + a.position.x, cy + a.position.y)); 
    }
    return locations; 
}

void wander(ArrayList<PVector> locations){
  if(random(1) < 0.1){
    
  int index = int(random(locations.size()));
  steer(locations.get(index)); 
  }
  
  
}
  
  
}
