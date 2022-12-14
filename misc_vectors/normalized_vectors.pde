void normal(){ 
  // Using a unit vector and scaling the magnitude means that 
  // no matter where the mouse it, the magnitute will remain the same. 
    // Compare this to the drawVector() method, which calculates the magnitude by
    // subtracting the current mouse position from the center of the frame and draws a line between them. 
 PVector mouse = new PVector(mouseX, mouseY); 
 PVector center = new PVector(width/2, height/2); 
 
 mouse.sub(center); // distance between the center, and the current pos of the mouse. 
 mouse.normalize(); // make it a unit vector; 
 mouse.mult(60);  // scale by 60. 
 line(0,0, mouse.x, mouse.y);  //(x1, y1, x2, y2). After translate(width/2, height/2) is called, (0,0) is the middle of the screen. 
  
  
}
