/*
import shiffman.box2d.*;
import java.util.Iterator; 
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import java.util.Iterator; 

Box2DProcessing box2d; 
WindMill windmill; 

ArrayList<Particle> particles; 



void setup(){ 
 size(640, 480); 
 box2d = new Box2DProcessing(this); 
 box2d.createWorld(); 
 
 windmill = new WindMill(width/2, 170); 
 particles = new ArrayList<Particle>(); 
} 

void mousePressed() { 
 windmill.toggleMotor();  
}


void draw(){ 
  background(255); 
  if(random(1) < 0.1){
   float sz = random(4,8); 
   particles.add(new Particle(random(width/2 -100, width/2 + 100), -20, sz)); 
  }
  
  box2d.step(); 
  
  for(int i = particles.size()-1; i >= 0; i--){ 
   Particle p = particles.get(i); 
   p.display(); 
   
   if(p.done()){
     particles.remove(i); 
   } 
  }
  
 windmill.display(); 
 
 String status = "OFF"; 
 if(windmill.motorOn()) status = "ON"; 
 fill(0); 
 text("Click mouse to toggle motor: " + status, 10, height -30);
  
  
  
  
}
*/
