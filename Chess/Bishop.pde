class Bishop extends Piece{
  
   Bishop(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     
  }
  

  
   ArrayList<Integer> legalMoves(){
   
   moveIndexes.clear();
   addBishopMoves();
   removeOccupiedSquares();
    
  return moveIndexes; 
  }
  
  void addBishopMoves(){
    for(Square s : board.squares){
      boolean onLeftToRightDiagonal = (s.index - currentSquare.index) % 7 == 0;   
      boolean onRightToLeftDiagonal = (s.index - currentSquare.index) % 9 == 0; 
      boolean sameColorSquare = s.squareColor == currentSquare.squareColor; 
     if((onLeftToRightDiagonal || onRightToLeftDiagonal) && sameColorSquare ){
       moveIndexes.add(s.index);  
     }
    }
  }
  
 
}
