/*
Mover[] movers = new Mover[100]; 
void setup(){ 
  size(640,480); 
  for(int i = 0; i < movers.length; i++){
   movers[i] = new Mover(random(0.1,5), 0,0); // random mass, x and y = 0.  
  }
} 


void draw(){ 
  background(255); 
  PVector wind = new PVector(0.05, 0); 
  
  
 for(int i = 0; i < movers.length; i++) { 
   float m = movers[i].mass; 
   
   PVector gravity = new PVector(0, 0.1); // scale the force of gravity by mass. 
   // force = mass * acceleration. 
   // therefore, acceleration = force / mass
   
   // Friction = -1 * mu * N * (unit vector) v
     // -1 because friction applies a force in the opposite direction of the velocity
     // mu is the coefficient of friction - strength of the friction force for a surface
     // N is the normal force - the force perpendicular to the object moving along a surface. 
     // the unit vector v is the velocity
     
   boolean fric1 = (movers[i].location.x > 200 && movers[i].location.x < 202);
   boolean fric2 = (movers[i].location.x > 300 && movers[i].location.x < 400);
   if (fric1 ){
      float c = 0.0001; // mu - the coefficient of friction; 
   PVector friction = movers[i].velocity; 
   friction.mult(-1); 
   friction.normalize(); 
   friction.mult(c); 
   movers[i].applyForce(friction);
   }
   
 
  
   
   
  movers[i].applyForce(wind); 
  movers[i].applyForce(gravity); 
  movers[i].update(); 
  movers[i].display();
  movers[i].checkEdges(); 
  
 }

} 

*/ 
