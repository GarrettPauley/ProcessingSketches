
class Square { 
  int x, y, h, w; 
  color squareColor;
  String name; 
  PVector center; 
  int index; 
  Piece piece; 

  Square(int x_, int y_, int w_, int h_, String name_, color squareColor_, int i){ 
   x = x_; 
   y = y_; 
   w = w_; 
   h = h_;
   name = name_; 
   squareColor = squareColor_; 
   center = new PVector(x + w/2 - 2, y + h/2);
   index = i; 
   piece = null;
   
   
  }
  
  
  
  boolean isClicked(){ 
   
   //(mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h)
   
   if ((mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h)) {
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
   
    if(isClicked()){
     
      fill(255,0,0); 
      ellipse(center.x, center.y, 15,15); 
      
    }
   
   
   
  }
  
  void displaySquareName(){ 
    pushMatrix();
    fill(255,0,0); 
    textSize(24);
    textAlign(CENTER);
    text(name, x + (w/2) , y + (h/4)); 
    
    popMatrix(); 
  }
  
  void displaySquareIndex(){
    
    pushMatrix();
    fill(255,0,0); 
    textSize(24);
    textAlign(CENTER);
    text(Integer.toString(index), x + (w/2) , y + (h/2)); 
    
    popMatrix(); 
    
    
  }
  
  void setPiece(Piece p){
    piece = p; 
    
  }
  
  int getSquareIndex(){
   return this.index; 
  }
  
  
  
  
  
  
}
