class Bishop extends Piece{
     ArrayList<Integer> diagonalSquares; 
  
   Bishop(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     diagonalSquares = new ArrayList<Integer>(); 
     
  }
  

  
   ArrayList<Integer> legalMoves(){
   
   moveIndexes.clear();
   addBishopMoves();
   removeOccupiedSquares();
    
  return moveIndexes; 
  }
  
  void addBishopMoves(){
    getDiagonalSquares(9);
    getDiagonalSquares(-9);
    getDiagonalSquares(7);
    getDiagonalSquares(-7);
  
  }

  
  
  // TODO - need to include the first square on the diagonal with an enemy piece. 
  void getDiagonalSquares(int offset){
   int start = currentSquare.index; 
   int counter = 1; 
   int foundPiecesOnDiagonal = 0; 
   boolean openDiagonal = true; 
   
  
    while( openDiagonal  && (start + (offset * counter)) <= 64 && (start + (offset * counter)) >= 0 ){
     Square nextSquareOnDiagonal = board.getSquareByIndex(start + (offset * counter));
     
     if(nextSquareOnDiagonal.piece == null){
      moveIndexes.add(nextSquareOnDiagonal.index); 
      counter++; 
     }
     else{
     openDiagonal = false; 
     }
    }
   
   
  }

    
  }
 
