
class Vehicle {
  PVector position; 
  PVector velocity; 
  PVector acceleration; 
  float maxSpeed; 
  float maxForce; 
  float wanderTheta;
  float r; 
  
  Vehicle(float x, float y){
    acceleration = new PVector(0,0); 
    velocity = new PVector(0,0); 
    position = new PVector(x,y); 
    r = 10.0; 
    maxSpeed = 4; 
    maxForce = 0.1; 
  }
  
  
  
  PVector seek(PVector target){
   PVector desired = PVector.sub(target, position); 
   desired.normalize(); 
   desired.mult(maxSpeed); 
   
   PVector steer = PVector.sub(desired, velocity);
   steer.limit(maxForce); 
   //applyForce(steer);
   return steer;
    
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
  
  void applyForce(PVector force){ 
   acceleration.add(force);
  }
  
  void update(){
   velocity.add(acceleration);
   velocity.limit(maxSpeed); 
   position.add(velocity); 
   acceleration.mult(0); // clear the net force. 
   
  }
  
  
  void display(){
   float theta = velocity.heading() + PI/2; 
   fill(175); 
   stroke(0); 
   pushMatrix(); 
   translate(position.x, position.y);
   ellipse(0,0, r,r);
   /*
   rotate(theta); 
   beginShape(); 
   vertex(0, -r*2); 
   vertex(-r, r*2); 
   vertex(r, r*2);
   
   endShape(CLOSE);
   */
   popMatrix(); 
  }
  
  void checkEdges(){
   if (position.x > width) position.x = 0; 
   if (position.x < 0) position.x = width; 
   if (position.y > height) position.y = 0; 
   if (position.y < 0) position.y = height; 
    
  }
  
  void goWithTheFlow(FlowField flow) {
   PVector desired = flow.lookup(position);  
   desired.mult(maxSpeed); 
   
   PVector steer = PVector.sub(desired, velocity); 
   steer.limit(maxForce); 
   applyForce(steer);
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
  
  PVector separate(ArrayList<Vehicle> vehicles){
    float desiredSeparation = r * 2; 
    
    
    // If many vehicles are within the desiredSeperation distance, we want to take the average of all 'flee' vectors. 
    // A 'flee' vector is a vector that points in the opposite direction of another vehicle that is too close.
    PVector sum = new PVector(); 
    int count = 0;
    
   for(Vehicle other : vehicles){
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
  
  void applyBehaviors(ArrayList<Vehicle> vehicles){
   PVector separate = separate(vehicles);
   PVector seek = seek(new PVector(mouseX, mouseY));
   separate.mult(1.5);
   seek.mult(0.5);
   applyForce(separate); 
   applyForce(seek);
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
  
