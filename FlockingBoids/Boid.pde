class Boid {
  PVector position; 
  PVector velocity; 
  PVector acceleration; 
  float maxSpeed; 
  float maxForce; 
  float wanderTheta;
  color boidColor;
  float r; 
  
  // constructor
  Boid(float x, float y){
    acceleration = new PVector(0,0); 
    velocity = new PVector(random(-1,1), random(-1,1)); 
    position = new PVector(x,y); 
    r = 10.0; 
    maxSpeed = 4; 
    maxForce = 0.1; 
    boidColor = color(175); 
  }
  
  
  
  void run(ArrayList<Boid> boids){
   flock(boids);
   update(); 
   checkEdges(); 
   display(); 
   /*
   while(keyPressed && key  == ' ' ){
     PVector sca = scatter(boids); 
     sca.mult(2.0); 
     applyForce(sca); 
     update(); 
     checkEdges(); 
     display(); 
   }
   */
  }
  
  void flock(ArrayList<Boid> boids){
      PVector sep = separate(boids); 
      PVector ali = align(boids); 
      //PVector coh = cohesion(boids); 
      PVector scat = scatter(boids);
      
      sep.mult(1.5); 
      ali.mult(1.0); 
      //coh.mult(1.0);
      scat.mult(3.0);
      
      applyForce(sep); 
      applyForce(ali); 
      //applyForce(coh);
      applyForce(scat);
      
  
      
      
     
    
  }
  
  
  
  
  
  // Behaviors
  PVector seek(PVector target){
     PVector desired = PVector.sub(target, position); 
     desired.normalize(); 
     desired.mult(maxSpeed); 
     
     desired.sub(velocity); 
     
     desired.limit(maxForce); 
    
     return desired;
  }
  
  // Behaviors
  PVector avoid(PVector target){
     PVector desired = PVector.sub(position, target); 
     desired.normalize(); 
     desired.mult(maxSpeed); 
     
     desired.sub(velocity); 
     
     desired.limit(maxForce); 
    
     return desired;
  }
  

  
    
  PVector separate(ArrayList<Boid> boids){
      float desiredSeparation = r * 2; 
    
      // If many vehicles are within the desiredSeperation distance, we want to take the average of all 'flee' vectors. 
      // A 'flee' vector is a vector that points in the opposite direction of another vehicle that is too close.
      PVector sum = new PVector(); 
      int count = 0;
      
     for(Boid other : boids){
      float d = PVector.dist(position, other.position); // how close is the vehicle to another vehicle 
      
      if((d > 0 && (d < desiredSeparation))){
       PVector diff = PVector.sub(position, other.position); // vector pointing away from the other vehicles within the desiredSeparation distance. 
       diff.normalize();
       sum.add(diff);
       count++; 
      }
     }
     if (count > 0){
      sum.div(count); // average 
      sum.normalize();
      sum.mult(maxSpeed);
      sum.sub(velocity);
      sum.limit(maxForce);
      
     }
     return sum;
    
  }
  
  
  PVector align(ArrayList<Boid> boids){
    float neighbordist = 50; 
   PVector sum = new PVector();
   int count = 0; 
   for(Boid other: boids){
     float d = PVector.dist(position, other.position); 
     if((d > 0) && (d < neighbordist)){
        sum.add(other.velocity);  
        count++; 
     }
   }
   if(count > 0){ // boids found within neighbordistance; 
       sum.div(count); 
       sum.setMag(maxSpeed);
       PVector steer = PVector.sub(sum, velocity); // Each boid should steer towards that averaged velocity
       steer.limit(maxSpeed); 
    
     return steer; 
     
     }  else { // no boids found within neighbordistance; 
     
      return new PVector(0,0); // steering force is zero, no change.  
     }
    
  }
  
  
  PVector cohesion(ArrayList<Boid> boids){
     float neighbordist = 50; 
     PVector sum = new PVector();
     int count = 0; 
     
     for(Boid other: boids){
       float d = PVector.dist(position, other.position); 
       if((d > 0) && (d < neighbordist)){
          boidColor = color(0,255,0);
          sum.add(other.velocity);  
          count++; 
       }
     }
   if(count > 0){ // boids found within neighbordistance; 
       sum.div(count); 
       return seek(sum); // seek the average velocity of neighboring boids; 
     }  else { // no boids found within neighbordistance; 
     
      return new PVector(0,0); // steering force is zero, no change.  
     }
    
  }
  
 PVector scatter(ArrayList<Boid> boids){
     float neighbordist = 10; 
     PVector sum = new PVector();
     int count = 0; 
     
     for(Boid other: boids){
       float d = PVector.dist(position, other.position); 
       if((d > 0) && (d < neighbordist)){
          boidColor = color(255,0,0);
          sum.add(other.velocity);  
          count++; 
       }
     }
   if(count > 0){ // boids found within neighbordistance; 
       sum.div(count); 
       PVector f = velocity.sub(sum);
       f.limit(maxSpeed);
       return f; 
      
     }  else { // no boids found within neighbordistance; 
     
      return new PVector(0,0); // steering force is zero, no change.  
     }
    
  }
  
  void arrive(PVector target){
   PVector desired = PVector.sub(target,position); 
   float d = desired.mag(); 
   desired.normalize(); 
     if( d < 100){
       
       float m = map(d, 0, 100, 0, maxSpeed); 
       desired.mult(m); 
     }
     
     else{
      desired.mult(maxSpeed);  
     }
     PVector steer = PVector.sub(desired, velocity); 
     steer.limit(maxForce);
     applyForce(steer);

  }
  
  
  void wander(){
    float wanderRadius = 30; 
    float wanderDistance = 80; 
    float change = 0.2; 
    
    wanderTheta += random(-change, change); 
    
    PVector circlePos = velocity.copy(); 
    circlePos.normalize(); 
    circlePos.mult(wanderDistance); 
    circlePos.add(position); // push the circle out in front of the Vehicle. 
    
    float h = velocity.heading(); 
    
    PVector circleOffSet = new PVector(wanderRadius * cos(wanderTheta + h ), wanderRadius * sin(wanderTheta + h)); 
    PVector target = PVector.add(circlePos, circleOffSet); 
    seek(target);
    drawWanderLines(position, circlePos, target, wanderRadius);
    
  }
  


  
  // Utility functions; 
  
    void applyForce(PVector force){ 
     acceleration.add(force);
    }
    
    void applyBehaviors(ArrayList<Boid> boids){
   PVector separate = separate(boids);
   PVector seek = seek(new PVector(mouseX, mouseY));
   separate.mult(1.5);
   seek.mult(0.5);
   applyForce(separate); 
   applyForce(seek);
  }
  
    void update(){
   velocity.add(acceleration);
   velocity.limit(maxSpeed); 
   position.add(velocity); 
   acceleration.mult(0); // clear the net force. 
   
  }
  
  
  void display(){
   float theta = velocity.heading() + PI/2; 
   fill(boidColor); 
   stroke(0); 
   pushMatrix(); 
   translate(position.x, position.y);

   rotate(theta); 
   beginShape(); 
   vertex(0, -r*2); 
   vertex(-r, r*2); 
   vertex(r, r*2);
   
   endShape(CLOSE);
   
   popMatrix(); 
  }
  
  
   
  

  
  void checkEdges(){
   if (position.x > width) position.x = 0; 
   if (position.x < 0) position.x = width; 
   if (position.y > height) position.y = 0; 
   if (position.y < 0) position.y = height; 
    
  }
  
  void drawWanderLines(PVector position, PVector circle, PVector target, float radius){
   stroke(0); 
   noFill(); 
   ellipseMode(CENTER); 
   ellipse(circle.x, circle.y, radius * 2, radius * 2); 
   ellipse(target.x, target.y, 4, 4); 
   line(position.x, position.y, circle.x, circle.y); 
   line(circle.x, circle.y, target.x, target.y); 
  }

  
 
  
  

  PVector getNormalPoint(PVector path, PVector pointA, PVector pointB){
    
   PVector vector_from_pointA_to_path = PVector.sub(path, pointA);
   PVector vector_from_pointA_to_pointB = PVector.sub(pointB, pointA);   
   vector_from_pointA_to_pointB.normalize(); 
   
   vector_from_pointA_to_pointB.mult(vector_from_pointA_to_path.dot(vector_from_pointA_to_pointB)); 
   PVector normal = PVector.add(pointA, vector_from_pointA_to_pointB);
 return normal; 
 
 }
 
}
