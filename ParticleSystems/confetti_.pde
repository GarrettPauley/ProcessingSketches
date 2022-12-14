
class Confetti extends Particle{
  float[] confettiColor;
  
  Confetti(PVector location){
   super(location); // call the constructer in Particle
    confettiColor = new float[] {random(255), random(255), random(255)}; // random RGB value for the confetti. 
  }
  
  // no update method - we inherit that from the parent class. 
  
  void display(){
    float theta = map(position.x, 0, width, 0, TWO_PI * 4); 
   rectMode(CENTER); 
   fill(confettiColor[0], confettiColor[1], confettiColor[2]); 
   stroke(0); 
   pushMatrix(); 
   translate(position.x, position.y); 
   rotate(theta); 
   rect(0,0, 8,8); 
   popMatrix(); 
  }
  
}
