class Queen extends Piece{
  
   Queen(String imagePath, Square s , ChessBoard b){
     super(imagePath, s, b); 
     
  }
  
    @Override
    ArrayList<Integer> legalMoves(){
    moveIndexes.clear(); 
    addQueenMoves(); 
    return moveIndexes; 
    
  }
  
  void addQueenMoves(){
    
    getFileAndRankMoves(ABOVE_BELOW);
    getFileAndRankMoves(-ABOVE_BELOW);
    getFileAndRankMoves(ADJACENT);
    getFileAndRankMoves(-ADJACENT);
    getDiagonalMoves(DIAGONAL_LEFT);
    getDiagonalMoves(-DIAGONAL_LEFT);
    getDiagonalMoves(DIAGONAL_RIGHT);
    getDiagonalMoves(-DIAGONAL_RIGHT);
   
   
  }
  


  
}
