

class Particle{ 
  PVector position; 
  PVector velocity; 
  PVector acceleration; 
  float lifespan; 
  float mass = 1;
  
  
  
  
  Particle(PVector loc){ 
    position = loc.copy(); 
    acceleration = new PVector(0,0); 
    velocity = new PVector(random(-1, 1), random(-2, 0)); 
    lifespan = 255; 
  
    
  } 
  
  Particle(){ 
    position = new PVector(random(0,width), height/4); 
    acceleration = new PVector(0,0.05); 
    velocity = new PVector(); 
    lifespan = 255;
  } 
  
  void run(){
   update(); 
   checkedges(); 
   display();   
  }
  
  
  void update(){ 
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0); // clear the net force. 
    lifespan -= 2.0; 
    
  } 
  
  void display(){ 
    stroke(0, lifespan); // lifespan is used for alpha.  
    fill(175, lifespan); 
    ellipse(position.x, position.y, 10,10); 
  } 
  
  boolean isDead(){ 
   if (lifespan < 0) return true;  
   else return false; 
  }
  
  void applyForce(PVector force_){ 
    // F = M * A  -> A = F / M
   PVector force = force_.copy();  
   force.div(mass); 
   acceleration.add(force); 
  }
  
 
 
  
  void checkedges(){
   if(position.x > width) position.x = 0; 
   if(position.x < 0) position.x = width; 
   if(position.y > height) position.y = 0; 
   if(position.y < 0) position.y = height; 
  }
  
  
  
   void checkEdgesBounce(){
   if(position.x > width || position.x < 0) velocity.mult(-1); 
   if(position.y > height || position.y < 0) velocity.mult(-1); 
 
  }
  

} 
