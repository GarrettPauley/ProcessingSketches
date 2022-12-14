/*
float angle; 
PVector position; 

void setup(){ 
  size(640, 480);
  angle = 0; 
  position = new PVector(); 
} 


void draw(){ 
 
  background(255); 
  
 display(); 
  angle += 0.1; 
  
  
  
  
} 

void display(){ 
   
   
  // Blue spinning rectangle; 
  pushMatrix(); 
  fill(0, 0, 255); 
  translate(mouseX, mouseY); 
  rotate(angle); 
  rectMode(CENTER); 
  rect(position.x, position.y, 50, 80); 
  popMatrix(); 
  
  // Notice that pushMatrix() and popMatrix() are used to wrap both rotating objects. 
  
  // Red Spinning rectangle; 
  pushMatrix(); 
  translate(mouseX, mouseY); 
  rotate(-angle * 2); 
  fill(255, 0, 0) ; 
  rect(position.x, position.y, 40, 70); 
  popMatrix(); 
  
  
} 
*/
