
/*
Oscillator osc; 
void setup(){ 
  size(1000,1000); 
  osc = new Oscillator(); 
 
} 


void draw(){ 
  background(255); 
  osc.oscillate();
    
  osc.display(); 
  
} 

class Oscillator { 
 
  PVector angle; 
  PVector velocity; 
  PVector amplitude; 
  
  Oscillator(){ 
   angle = new PVector(); 
   velocity = new PVector (random(-0.05, 0.05), random(-0.05, 0.05)); 
   amplitude = new PVector(random(width/2), random(height/2)); 
  }
  
  void oscillate(){ 
   angle.add(velocity);  
  }
  
  void display(){ 
   float x = sin(angle.x) * amplitude.x; 
   float y = sin(angle.y) * amplitude.y;
   
   pushMatrix(); 
   translate(width/2, height/2) ;
   stroke(0); 
   fill(275); 
   line(0,0,x,y); 
   ellipse(x,y, 15,15); 
   popMatrix(); 
  }
  
  
}


*/
