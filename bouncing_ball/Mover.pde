class Mover{ 
PVector location; 
PVector velocity;
PVector acceleration; 
float topSpeed; 

Mover(){ 
 location = new PVector(random(width), random(height)); // random init location 
 velocity = new PVector(0,0); 
 acceleration = new PVector(-0.001, 0.01); //small values, which are applied once every frame. ~ 30-60 times per second.
 topSpeed = 10; 
  
}


void update(){ 
  velocity.add(acceleration);
  velocity.limit(topSpeed); 
  location.add(velocity); 
} 


void display(){ 
 stroke(0); 
 fill(175); 
 ellipse(location.x, location.y, 20,20); 
  
}

void checkEdges(){ 
  // Check if the ball is going to move off the edge of the screen. 
  // Wrap around the screen instead of moving out of the frame. 
  
  
  // ball moves off the right side of the screen.
  if (location.x > width){
   location.x = 0; 
  }
 
 // ball moves off the left side of the screen. 
  else if (location.x < 0){  
   location.x = width;  
  }
  
  // ball moves off the top of the screen. 
  if(location.y > height){ 
   location.y = 0;  
  }
  
  // ball moves off the bottom of the screen
  else if (location.y < 0){ 
   location.y = height;  
  }
  
  
}
 
  
  
}
