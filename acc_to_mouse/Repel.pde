class Repel { 
 float mass; 
 PVector location; 
 float G;
 
 Repel(){ 
  location = new PVector(width/2, height/2); 
  mass = 20; 
  G = 0.01; 
   }
 
 void display(){ 
  stroke(0); 
  fill(175,200); 
  ellipse(location.x, location.y, mass*2, mass*2); 
   
   }
   
   PVector repel(Mover m){
      // get the direction of the attraction
     // get the distance between the objects. 
    // calculate the strength of the attraction and multiply the unit vector by that. 
    
    PVector force = PVector.sub(location, m.location); 
    float distance = force.mag(); 
    distance = constrain(distance, 5.0, 25.0);
   
    force.normalize();
    float strength = ((G * mass * mass) / (distance * distance)) * -1; 
    force.mult(strength);
    
    return force; 
     
   }
  
}
