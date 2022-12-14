import peasy.*;


Vehicle vehicle;
FlowField flow; 
Path path; 
ArrayList<Vehicle> vehicles; 
PeasyCam cam; 

void setup(){
  cam = new PeasyCam(this,400);
  size(640,480, P3D); 
  fill(0); 
 newPath();
 vehicles = new ArrayList<Vehicle>(); 
 for(int i = 0; i < 100; i++){
  vehicles.add(new Vehicle(random(width), random(height)));  
 }
 
 flow = new FlowField();
 
}

void draw(){ 
 stroke(0); 
 background(255);
 PVector target = new PVector(mouseX, mouseY); 

  for (Vehicle v : vehicles){
   v.applyBehaviors(vehicles);
   v.checkEdges();
   v.update(); 
   v.display(); 
  }
   
  
}

void newPath() {
  // A path is a series of connected points
  // A more sophisticated path might be a curve
  path = new Path();
  path.addPoint(-20, height/2);
  path.addPoint(random(0, width/2), random(0, height));
  path.addPoint(random(width/2, width), random(0, height));
  path.addPoint(width+20, height/2);
 
}
