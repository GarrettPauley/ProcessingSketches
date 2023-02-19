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

  
  
  
  void getDiagonalSquares(int offset){
   int start = currentSquare.index; 
   int counter = 1; 
   
   boolean openDiagonal = true; 
   
    
    while( openDiagonal  && (start + (offset * counter)) < 64 && (start + (offset * counter)) >= 0 ){
      
     Square nextSquareOnDiagonal = board.getSquareByIndex(start + (offset * counter));
       // Find all the open spaces on the diagonal 
       if(nextSquareOnDiagonal.piece == null && nextSquareOnDiagonal.squareColor == currentSquare.squareColor){
    
        moveIndexes.add(nextSquareOnDiagonal.index); 
        counter++; 
       }
       // Find the first capturable piece on the diagonal
       else if(nextSquareOnDiagonal.piece != null && (nextSquareOnDiagonal.piece.isblackPiece != this.isblackPiece) && nextSquareOnDiagonal.squareColor == currentSquare.squareColor ){
         moveIndexes.add(nextSquareOnDiagonal.index); 
         break;
       }
      
      else{
       openDiagonal = false; 
       }
    }
   
   
  }
  
  
  
 

    
  }
 
