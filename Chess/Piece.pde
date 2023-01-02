abstract class Piece{
  
  float x, y; 
  int h; 
  PImage image;
  boolean WHITE; 
  boolean moving;
  int location;
  Square startingSquare;
  ArrayList<Square> previousSquares; 
  
  
  
  
  Piece(String imagePath, Square s){
    image = loadImage(imagePath);
    startingSquare = s; 
    x = s.x; 
    y = s.y; 
    h = 80;
    location = startingSquare.index; 
    previousSquares = new ArrayList<Square>(); 
    previousSquares.add(startingSquare); 
    
  }
 
  
  void display(){
    fill(0);
    stroke(255); 
    //rect(x,y,h,h); 
    image(image, x , y, h,h); 
    
  }
  
  boolean clicked(){
    boolean insideXRange = (mouseX > x && mouseX < x + startingSquare.w);
    boolean insideYRange = (mouseY > y && mouseY < y + startingSquare.h);
    if(insideXRange && insideYRange && mousePressed){
      return true;  
      
    }
    else{
     return false;  
    }
  
}

void movetoPreviousSquare(){
 x = previousSquares.get(previousSquares.size() - 1).x;
 y = previousSquares.get(previousSquares.size() - 1).y;
}


void moveToSquare(Square s){
   x = s.x; 
   y = s.y; 
 }







abstract void move(); 




}
