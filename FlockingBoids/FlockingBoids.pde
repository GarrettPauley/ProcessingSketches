
Boid boid; 

 
Flock flock; 

 

void setup(){
  fullScreen(); 
  //size(800, 600);
  flock = new Flock(); 
  fill(0); 

 
 for(int i = 0; i < 100; i++){
  flock.addBoid(new Boid(random(width), random(height)));  
 }
 

 
}

void draw(){ 
 stroke(0); 
 background(255);
 flock.run(); 

   
  
}

void mousePressed(){
 flock.addBoid(new Boid(mouseX, mouseY));  
}
