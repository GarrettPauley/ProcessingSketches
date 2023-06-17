class Target{
  float x,y; 
  float r; 
  color col;
  Target(float x_, float y_){
    x = x_; 
    y = y_; 
    r = 15; 
    col = color(0,255,0); 
  }
 
  void display(){
   fill(col); 
   ellipse(x, y, r,r); 
   ellipse(x,y,2,2); 
  }
  
  
  boolean clicked(){
    boolean insideXRange = ((mouseX > x && mouseX < x + r) || (mouseX < x && mouseX > x - r));
    boolean insideYRange = ((mouseY > y && mouseY < y + r) || (mouseY < y && mouseY > y - r));
    if(insideXRange && insideYRange && mousePressed){
      col = color(0, 255, 0);
      return true; 
    }
    else return false; 
  }
  
  
}
