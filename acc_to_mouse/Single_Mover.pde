/*

Mover m; 

void setup(){ 
  size(640,480); 
  m = new Mover(); 
} 


void draw(){ 
  background(255); 
 PVector wind = new PVector(0.01, 0); 
  PVector gravity = new PVector(0, 0.2); 
  
 // m.applyForce(wind); 
  m.applyForce(gravity); 
  m.update(); 
  m.checkEdges(); 
  m.display(); 
  
} 

*/
