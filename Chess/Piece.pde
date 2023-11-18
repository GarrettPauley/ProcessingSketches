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
  move(s);
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
    if(s != this.currentSquare){
        Move m = new Move(this, this.currentSquare, s, true);
        currentSquare.piece = null;
        game.moves.add(m);
        s.piece = this;
        currentSquare = s;    
        moveToSquare(s);
        moving = false;     
     }
  
 }
 


   void move(Square s){
     if(s != this.currentSquare){
        previousSquares.add(currentSquare);
        Move m = new Move(this, this.currentSquare, s, false);
        currentSquare.piece = null;
        //print("Adding move from " + m.from.name  + "to " + m.to.name + " called from piece \n");
        game.moves.add(m);
        s.piece = this;
        currentSquare = s;    
        moveToSquare(s);
        moving = false;     
     }
  }
  
  
   void dummy_move(Square s){
        
        s.piece = this;
        currentSquare = s;    
        moveToSquare(s);
        moving = false;  
         
  }
  
  

  void removeOccupiedSquares(){
   List<Integer> occupied; 
   if(isblackPiece) occupied =  board.getSquareswithBlackPieces();
   else   occupied = board.getSquareswithWhitePieces();
     for(int i = moveIndexes.size() - 1; i >= 0 ; i--){
      if(occupied.contains(moveIndexes.get(i))){
       moveIndexes.remove(i);  
      }
     }
      
  }
  
   boolean isOneRankAway(Square s1, Square s2){
   return ( (s1.index - s2.index) & 7) == 1; 
  }
  
  boolean isOneFileAway(Square s1, Square s2){
   return (s1.index >> 3) - (s2.index >> 3) == 1; 
  }
  
  boolean onSameFile(Square s1, Square s2){
    int index1 = s1.index; 
    int index2 = s2.index;
    return (index2 >> 3) - (index1 >> 3) == 0; 
  }
  
  boolean onSameRank(Square s1, Square s2){
    int index1 = s1.index; 
    int index2 = s2.index;
    
    return ((index2 - index1) & 7) == 0; 
  }
  
  boolean onSameDiagonal(Square s1, Square s2){
    
    int index1 = s1.index; 
    int index2 = s2.index; 
    boolean sameColor = s1.squareColor == s2.squareColor;
    
    return  ( (index1 - index2) % 7 == 0 || (index1 - index2) % 9 == 0 ) && sameColor ;
    
  }
  
  
  
     void getFileAndRankMoves(int offset){
       int start = currentSquare.index; 
       int counter = 1; 
   
        boolean openLines = true; 
   
        while( openLines  && (start + (offset * counter)) < 64 && (start + (offset * counter)) >= 0 ){ 
         Square nextSquare = board.getSquareByIndex(start + (offset * counter));
           // Find all the open spaces on vertical or horizontal line (depending  on offset provided) 
           if(nextSquare.piece == null ){
            moveIndexes.add(nextSquare.index); 
            counter++; 
           }
           // Find the first capturable piece on the line
           else if(nextSquare.piece != null 
                     && (nextSquare.piece.isblackPiece != this.isblackPiece) 
                     && (onSameRank(nextSquare, currentSquare) || onSameFile(nextSquare, currentSquare)
                     )){
             moveIndexes.add(nextSquare.index);
             break;
           }
          
          else{
           openLines = false; 
           }
        }
   
}


    void getDiagonalMoves(int offset){
      
       int start = currentSquare.index; 
       int counter = 1; 
       
       boolean openLines = true; 
       
      while( openLines  && (start + (offset * counter)) < 64 && (start + (offset * counter)) >= 0 ){ 
        
       Square nextSquare = board.getSquareByIndex(start + (offset * counter));
       
         // Find all the open spaces on vertical or horizontal line (depending  on offset provided) 
         if(nextSquare.piece == null && onSameDiagonal(currentSquare, nextSquare)){
          moveIndexes.add(nextSquare.index); 
          counter++; 
         }
         // Find the first capturable piece on the line
         else if(nextSquare.piece != null 
                   && (nextSquare.piece.isblackPiece != this.isblackPiece) 
                   && onSameDiagonal(currentSquare, nextSquare)
                   ){
           moveIndexes.add(nextSquare.index);
           break;
         }
        
        else{
         openLines = false; 
         }
      }
   
} 
  
  

abstract ArrayList<Integer> legalMoves(); 

  




}
