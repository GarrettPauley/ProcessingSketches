class Box { 
 float x,y; 
 float w, h; 
 
 Box(float x_, float y_){
  x = x_; 
  y = y_; 
  w = 15; 
  h = 15; 
 }
 
 void display(){ 
  fill(175); 
  stroke(0); 
  rectMode(CENTER); 
  rect(x,y,w,h); 
   
   
 }
  
  
}
