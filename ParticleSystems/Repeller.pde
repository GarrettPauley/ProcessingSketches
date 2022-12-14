
class Repeller { 
 PVector position; 
 float r = 20; 
 float strength = 100;  
 
 Repeller(float x, float y){ 
   position = new PVector(x, y); 
 } 
 
 void display(){
  stroke(0); 
  fill(175); 
  ellipse(position.x, position.y, r*2, r*2);
 }
 
 PVector repel(Particle p){ 
  PVector dir = PVector.sub(position, p.position); //get the force direction. 
  float distance = dir.mag();
  distance = constrain(distance, 5, 50); // don't let it get crazy. distance ~0 means the strength would be very very strong.  
  dir.normalize(); 
  float force = -1 * strength / (distance * distance); 
  dir.mult(force); 
  return dir; 
  
   
 }
  
  
}
