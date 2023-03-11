class Bishop extends Piece{
     ArrayList<Integer> diagonalSquares; 
  
   Bishop(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     diagonalSquares = new ArrayList<Integer>(); 
     
  }
    
   ArrayList<Integer> legalMoves(){
   moveIndexes.clear();
   addBishopMoves();
   
    
  return moveIndexes; 
  }
  
  void addBishopMoves(){
     getDiagonalMoves(DIAGONAL_LEFT);
    getDiagonalMoves(-DIAGONAL_LEFT);
    getDiagonalMoves(DIAGONAL_RIGHT);
    getDiagonalMoves(-DIAGONAL_RIGHT);
  }


  
  
  
  
 

    
  }
 
