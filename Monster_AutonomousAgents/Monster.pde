class Monster{
 PVector position; 
 PVector velocity; 
 PVector acceleration; 
 float maxSpeed; 
 float maxForce; 
 float w,h; 
 ArrayList<PVector> locations; 
 color col; 

 
 Monster(PVector pos){
  position = pos; 
  velocity = new PVector(random(1), random(1)); 
  acceleration = new PVector(); 
  locations = new ArrayList<PVector>(); 
  maxSpeed = 2; 
  maxForce = 0.1; 
  w = 20; 
  h = 20; 
  col = color(255,0,50); 

 }
 
 
  
  void display(){
     
   pushMatrix(); 
     fill(col); 
     stroke(0);    
     translate(position.x, position.y);   
     
     rect(0,0, w,h); 
     
   popMatrix(); 
   
   
   //Uncomment to show all the locations that the Monster can steer towards. 
   //for(PVector loc : locations){
   // fill(0); 
   // ellipse(loc.x, loc.y, 4,4); 
   //}
   
   
       
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
  

  
  ArrayList<PVector> wanderingSpace(Monster m){
    ArrayList<PVector> locations = new ArrayList<PVector>(); 
    float r = random(40,150); 
    
    for(int i = 0; i < 30; i++){
    
    float theta = random(0, TWO_PI); 
    float x = random(0.1,r) * cos(theta); 
    float y = random(0.1, r) * sin(theta);
     locations.add(new PVector(x + m.position.x, y + m.position.y)); 
    }
    return locations; 
}

void wander(ArrayList<PVector> locations){
  if(random(1) < 0.5){
    
  int index = int(random(locations.size()));
  steer(locations.get(index)); 
  }
  
  
}

void checkEdges(){
 if(position.x < 0) position.x = width; 
 else if (position.x > width) position.x = 0;
 else if (position.y < 0) position.y = height; 
 else if (position.y > height) position.y = 0; 
  
}
  
  
}
