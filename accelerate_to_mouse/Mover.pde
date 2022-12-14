class Mover{ 
PVector location; 
PVector velocity;
PVector acceleration; 
Liquid l;
float mass;
float G; 



Mover(){ 
 location = new PVector(width/2 - 50,0);
 velocity = new PVector(0,0); 
 acceleration = new PVector(0,0); 
 mass = 4; 
 G = 0.0001;
 

}



Mover(float m, float x, float y) { 
 mass = m; 
 location = new PVector(x,y); 
 velocity = new PVector(0,0); 
 acceleration = new PVector(0,0); 
 G = 0.1;
  
}



void update(){ 
  // Uncomment this block to have the Mover objects follow the mouse.  
    //PVector mouse = new PVector(mouseX, mouseY); 
    //PVector dir = PVector.sub(mouse,location); // get direction; 
    //dir.normalize();  // normalizing the direction vector
    //dir.mult(0.5); // scaling 
    //acceleration = dir;
  
  velocity.add(acceleration);
  location.add(velocity); 
  acceleration.mult(0); // clear the net forces with each update, otherwise they will compound. 
} 


void display(){ 
 stroke(0);
 strokeWeight(2); 
 fill(175); 
 ellipse(location.x, location.y, 16, 16); 
  
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
 
   void drag(Liquid l) { 
     
     float speed = velocity.mag(); 
     PVector drag = velocity.copy();
     float dragMagnitude = l.c * speed * speed; 
     drag.mult(-1); 
     drag.normalize(); 
     drag.mult(dragMagnitude); 
     applyForce(drag); 
     
     
   }
   
   
   boolean isInsideLiquid(Liquid l){ 
    if( (location.x > l.x) && (location.x < l.x + l.w) && (location.y > l.y) && location.y < l.y + l.h  ){// && location.y < l.y + l.h   )
      return true; 
    }
    else{ 
      return false; 
    }
   }
 
 
  PVector attract(Mover m){
      // get the direction of the attraction
     // get the distance between the objects. 
    // calculate the strength of the attraction and multiply the unit vector by that. 
    
    PVector force = PVector.sub(location, m.location); 
    float distance = force.mag(); 
    distance = constrain(distance, 5.0, 25.0);
   
    force.normalize();
    float strength = (G * mass * mass) / (distance * distance); 
    force.mult(strength);
    
    return force; 
     
   }
  
}






 
