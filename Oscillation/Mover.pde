




class Mover{ 
PVector location; 
PVector velocity;
PVector acceleration; 
float mass;
float G; 

float angle = 0; 
float aVelocity = 0; 
float aAcceleration = 0; 




Mover(){ 
 location = new PVector(random(width),random(height));
 velocity = new PVector(0,0); 
 acceleration = new PVector(0,0); 
 mass = 1; 


 

}



Mover(float m, float x, float y) { 
 mass = m; 
 location = new PVector(x,y); 
 velocity = new PVector(0,0); 
 acceleration = new PVector(0,0); 
 
  
}



void update(){ 
  velocity.add(acceleration);
  location.add(velocity); 
  
  
  
  
  acceleration.mult(0); // clear the net forces with each update, otherwise they will compound. 
  
  
  
} 


void display(){ 
  
  float angle = velocity.heading(); 
 stroke(0);
 strokeWeight(2); 
 fill(175); 
 rectMode(CENTER); 
 pushMatrix();                         // Make sure the rotation of this shape does not affect the rest of the sketch. 
 translate(location.x, location.y);    // set origin at the shape's location 
 rotate(angle); 
 rect(0,0,mass*16, mass*16); 
 popMatrix(); 
}

void applyForce(PVector force){ 
  PVector f = PVector.div(force,mass); 
 acceleration.add(f);  
}
void checkEdges(){ 
  // Check if the ball is going to move off the edge of the screen. 
  // Wrap around the screen instead of moving out of the frame. 
  
  if (location.x > width){
   location.x = width;
   velocity.x *= -1; 
  }
  else if (location.x < 0){  
   location.x = 0;
   velocity.x *= -1; 
  }
  
  if(location.y > height){ 
   location.y = height; 
   velocity.y *= -1; 
  }
  else if (location.y < 0){ 
   location.y = 0;
   velocity.y *= -1; 
  }
}
 

   
   
  
 
 

}






 
