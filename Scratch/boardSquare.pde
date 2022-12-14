
class Square { 
  int x, y, h, w; 
  color squareColor;
  String name; 
  Square(int x_, int y_, int w_, int h_, String name_, color squareColor_){ 
   x = x_; 
   y = y_; 
   w = w_; 
   h = h_;
   name = name_; 
   squareColor = squareColor_; 
   //squareColor = squareColor_; 
   
  }
  
  
  
  boolean isClicked(){ 
   
   //(mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h)
   
   if ((mousePressed) && (mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h)){
     return true; 
   }
   else{
     return false; 
   }
  }
  
  void display(){ 
   pushMatrix(); 
   fill(squareColor); 
   noStroke();
   rect(x,y,w,h); 
   popMatrix(); 
  }
  
  void displaySquareName(){ 
    pushMatrix();
    fill(255,0,0); 
    textSize(24);
    textAlign(CENTER);
    text(name, x + (w/2) , y + (h/2)); 
    
    popMatrix(); 
  }
  
  
  
  
}
