class Rook extends Piece{
  
   Rook(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     
  }
  

    ArrayList<Integer> legalMoves(){
    moveIndexes.clear();
    addRookMoves(); 
    removeOccupiedSquares(); 
    return moveIndexes; 
    
  }
  
  void addRookMoves(){
    getOrthogonalLines(ABOVE_BELOW);
    getOrthogonalLines(-ABOVE_BELOW);
    getOrthogonalLines(ADJACENT);
    getOrthogonalLines(-ADJACENT);
  }
  
  
  
  
   
  void getOrthogonalLines(int offset){
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
       else if(nextSquare.piece != null && (nextSquare.piece.isblackPiece != this.isblackPiece) && nextSquare.squareColor == currentSquare.squareColor ){
         moveIndexes.add(nextSquare.index); 
         break;
       }
      
      else{
       openLines = false; 
       }
    }
   
}

}
