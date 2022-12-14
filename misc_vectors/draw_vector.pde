 
 void drawVector(){ 
 PVector mousePos = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2); 
  mousePos.sub(center);
  
  // Horizontal bar on the screen that shows the magnitude of the vector.
  float m = mousePos.mag(); 
  fill(0); 
  rect(0,0,m, 10); 
  line(0,0, mousePos.x, mousePos.y); 
  
 }
