class SliderBar{
 float w,h; 
 float x,y; 
 String label;
 Slide slide; 
 
  SliderBar(float x_, float y_, String label_){
   x = x_; 
   y = y_; 
   w = 100; 
   h = 10; 
   label = label_;
   slide = new Slide(this); 
  
    
  }
  
  void display(){
    
    textSize(15);
    fill(0,0,255);
    text(label, x - 10, y);
    fill(175); 
    rect(x,y, w,h); 
    fill(255,0,0);
    rect(slide.x,slide.y, slide.h,slide.h);
    
    
    
  }
  
  
  void run(){
   slide.moveSlider();
   display();
   
  }
 
  
    
  }
  
  
  
  
  
  
  
  
