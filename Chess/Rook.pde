class Rook extends Piece{
  
   Rook(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     
  }
  
    @Override
    ArrayList<Integer> legalMoves(){
    moveIndexes.clear();
    addRookMoves(); 
    
    return moveIndexes; 
    
  }
  
  void addRookMoves(){
   
    getFileAndRankMoves(ABOVE_BELOW);
    getFileAndRankMoves(-ABOVE_BELOW);
    getFileAndRankMoves(ADJACENT);
    getFileAndRankMoves(-ADJACENT);
  }
  
  
  
  

  

  



}
