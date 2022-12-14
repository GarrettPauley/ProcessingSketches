
class Spring { 
  PVector anchor; 
  float restLength; 
  float k = 0.2; 
  
  Bob a; 
  Bob b; 
  
  Spring(Bob a_, Bob b_, int len){
   a = a_; 
   b = b_; 
   restLength = len; 
  }
  
  
  void update(){ 
   PVector force = PVector.sub(a.position, b.position); 
   float d = force.mag(); 
   float stretch = d - restLength; // how much has the spring been stretched? 
   
   
   //Caclulate force according to Hooke's Law. 
   // F = - k * stretch 
   force.normalize();
   force.mult(-1 * k * stretch); 
   a.applyForce(force); 
   force.mult(-1);  // reverse the direction, which is the force applied to the other other attached bob. 
   b.applyForce(force);  
   
   
  }
  
  void display(){ 
   strokeWeight(2); 
   stroke(0); 
   line(a.position.x, a.position.y, b.position.x, b.position.y); 
  }
  
  
} 

// Mover object
Bob b1;
Bob b2;
Bob b3;

Spring s1;
Spring s2;
Spring s3;

void setup() {
  size(640, 360);
  // Create objects at starting position
  // Note third argument in Spring constructor is "rest length"
  b1 = new Bob(width/2, 100);
  b2 = new Bob(width/2, 200);
  b3 = new Bob(width/2, 300);

  s1 = new Spring(b1,b2,100);
  s2 = new Spring(b2,b3,100);
  s3 = new Spring(b1,b3,100);
}

void draw() {
  background(255); 

  s1.update();
  s2.update();
  s3.update();
  
  s1.display();
  s2.display();
  s3.display();

  b1.update();
  b1.display();
  b2.update();
  b2.display();
  b3.update();
  b3.display();

  b1.drag(mouseX, mouseY);
}



void mousePressed() {
  b1.clicked(mouseX, mouseY);
}

void mouseReleased() {
  b1.stopDragging();
}
