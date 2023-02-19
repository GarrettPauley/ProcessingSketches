abstract class Piece{
  List<Integer> leftEdgeIndexes = Arrays.asList(56,57,58,59,60,61,62,63);
  List<Integer> rightEdgeIndexes  = Arrays.asList(0,1,2,3,4,5,6,7);
  List<Integer> topEdgeIndexes = Arrays.asList(63,55,47,39,31,23,15,7);
  List<Integer> bottomEdgeIndexes = Arrays.asList(56, 48, 40, 32, 24, 16, 8, 0); 
  List<Integer> blackStartingSquares  = Arrays.asList(0,1,8,9,16,17,24,25,32,33,40,41,48,49,56,57);
  ArrayList<Integer> moveIndexes; 
  ChessBoard board; 
  
  
  float x, y; 
  int h; 
  int BUFFER = 20; 
  PImage image;
  boolean isblackPiece; 
  boolean moving;
  int location;
  Square currentSquare;
  Square startingSquare; 
  ArrayList<Square> previousSquares;
  ArrayList<Square> legalMoves;
 
  
  
  
  
  
  Piece(String imagePath, Square s, ChessBoard b){
    image = loadImage(imagePath);
    startingSquare = s; 
    currentSquare = s; 
    x = s.x; 
    y = s.y; 
    h = 80;
    location = currentSquare.index; 
    previousSquares = new ArrayList<Square>(); 
    previousSquares.add(currentSquare); 
    moveIndexes = new ArrayList<Integer>();
    isblackPiece = isBlackPieceIndex(location); 
    board = b; 
    

    
  }
 
  
  void display(){
    fill(0);
    stroke(255); 
    //rect(x,y,h,h); 
    image(image, x , y, h,h); 
    
  }
  
  boolean clicked(){
    boolean insideXRange = (mouseX > x + BUFFER && mouseX < x + BUFFER + currentSquare.w);
    boolean insideYRange = (mouseY > y + BUFFER && mouseY < y  + BUFFER +currentSquare.h);
    if(insideXRange && insideYRange && mousePressed){
      
      return true;  
      
    }
    else{
     return false;  
    }
  
}

void movetoPreviousSquare(){
  Square s = previousSquares.get(previousSquares.size() - 1);
  moveToSquare(s);
}


void moveToSquare(Square s){
   x = s.center.x - h/2; 
   y = s.center.y - h/2; 
 }
 
 boolean isBlackPieceIndex(int index){
   if (blackStartingSquares.contains(index)){
    return true;  
   }
   else{
     return false; 
       
     }
 }
 
 boolean enemyPieceOnSquare(Square s){
  if(s.piece != null){
   return s.piece.isblackPiece != this.isblackPiece ;
  }
  else {
   return false; 
  }
 }
 
 
 void captureOn(Square s){
  Piece captured = s.piece;
  board.pieces.remove(captured);
  board.capturedPieces.add(captured);
  previousSquares.add(currentSquare);
  moveToSquare(s); 
  s.piece = this;
  moving = false;
  
  
 }

   void move(Square s){
        previousSquares.add(currentSquare);
        s.piece = this;
        currentSquare = s; 
        
        moveToSquare(s);
     
        game.movedPieces.add(this);
        moving = false;
         
  }

  void removeOccupiedSquares(){
   List<Integer> occupied; 
   if(isblackPiece) occupied =  board.getSquareswithBlackPieces();
   else   occupied = board.getSquareswithWhitePieces();
   
     for(int i = moveIndexes.size() - 1; i >= 0 ; i--){ //<>//
      if(occupied.contains(moveIndexes.get(i))){ //<>//
       moveIndexes.remove(i);  
      }
     }
      
  }

abstract ArrayList<Integer> legalMoves(); 

  




}
