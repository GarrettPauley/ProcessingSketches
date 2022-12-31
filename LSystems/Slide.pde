 class Slide {
    
     float h; 
     float x,y; 
     SliderBar bar; 
     
     Slide(SliderBar s){
       bar = s; 
       x = s.x; 
       y = s.y; 
       h = s.h; 
    }
    
    void display(){
    pushMatrix();
    fill(255,0,0);
    rect(x,y, h,h);
    popMatrix(); 
  
    
    
  }
   
  void moveSlider(){
    boolean insideXRange = (mouseX > bar.x && mouseX < bar.x + bar.w);
    boolean insideYRange = (mouseY >= bar.y && mouseY <= bar.y + bar.h);
    if(insideXRange && insideYRange && mousePressed){
      x = mouseX;  
    }
  }
  
  float getValue(float max){
     float val = map(bar.slide.x, bar.x, bar.x + bar.w, 0, max); 
     return val;
  }
  
  
 }
