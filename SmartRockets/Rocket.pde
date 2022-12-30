class Rocket { 
 DNA dna; 
 int geneCounter = 0;
 boolean hitTarget = false; 
 float fitness; 

 
 PVector position; 
 PVector velocity; 
 PVector acceleration;
 
  PVector target; 
 float r; 
 
 Rocket(PVector pos, DNA dna_, PVector target_){
   acceleration = new PVector(); 
   velocity = new PVector(); 
   position = pos.copy(); 
   r = 4; 
   dna = dna_;
   target = target_;
   
 }
 
  void fitness(){
   // How close is the rocket to the target? 
   float d = PVector.dist(target, position); 
   fitness = (1/d) * (1/d); // fitness is inversely proportional to distance from target. 
                            // The closer to the target, the higher the score. 
                            // Squaring this number so that small changes in distance can still be detected, and mapped. 
 }
 
 void applyForce(PVector force){ 
  acceleration.add(force);  
 }
 
 void update(){
  velocity.add(acceleration);
  position.add(velocity);
  acceleration.mult(0); 
  
 }
 
 void run(){
   checkTarget(); 
   if(!hitTarget){
     
   applyForce(dna.genes[geneCounter]); 
   geneCounter++; 
   update(); 
   } 
   display();
 }
 
 
 void display(){
       float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);

    // Thrusters
    rectMode(CENTER);
    fill(0);
    rect(-r/2, r*2, r/2, r);
    rect(r/2, r*2, r/2, r);

    // Rocket body
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();

    popMatrix();
 }
 
 void checkTarget(){
   float d = PVector.dist(target, position); 
   if(d < 10) hitTarget = true; 
   
 }
 
 float getFitness(){
  return fitness;  
 }
 
 DNA getDNA(){
  return dna;  
 }
 
 
 

  
}
