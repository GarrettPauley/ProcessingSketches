
/*
Pendulum[] pendulums = new Pendulum[10] ; 

class Pendulum{ 
  
 PVector location; 
 PVector origin; 
 float r; 
 float angle; 
 float aVelocity; 
 float aAcceleration; 
 float damping; 
 
 Pendulum(PVector origin_, float r_){ 
  origin = origin_.copy();  
  location = new PVector();
  r = r_; 
  angle = PI/4; 
  
  aVelocity = 0.0; 
  aAcceleration = 0.0; 
  damping = 0.995; 
 }
 
 void animate(){ 
  update(); 
  display(); 
 }

void update(){ 
 float gravity = 0.4; 
 aAcceleration = (-1 * gravity /r ) * sin(angle); 
 aVelocity  += aAcceleration; 
 angle += aVelocity; 
 aVelocity *= damping; 
  
}

void display(){ 
 location.set(r*sin(angle), r*cos(angle), 0); 
 location.add(origin); 
 stroke(0); 
 fill(175); 
 line(origin.x, origin.y, location.x, location.y);  // draw the pendulum arm
 ellipse(location.x, location.y, 50, 50); 
 
    }
    

}



void setup(){ 
  size(1200,840); 
  for(int i = 0; i < pendulums.length ; i++){ 
    pendulums[i] = new Pendulum(new PVector(width/2, i * 10), 100 + (i * 30)); 
  }

}


void draw(){ 
  background(255); 
  for(int i = 0; i < pendulums.length; i++){ 
   pendulums[i].animate();  
   if(mousePressed){ 
    pendulums[i].aVelocity += 0.001; 
   }
  }
  
}


 

  
*/
