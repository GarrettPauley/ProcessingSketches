class Knight extends Piece{
   HashMap<String, Integer> knightMoves; 
   
   
  
   Knight(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     knightMoves = new HashMap<String,Integer>(); 
     knightMoves.put("TOP_RIGHT", -6);
     knightMoves.put("DIAG_RIGHT", -15);
     knightMoves.put("DIAG_RIGHT2", -17);
     knightMoves.put("BOTTOM_RIGHT", -10);
     knightMoves.put("TOP_LEFT", 10);
     knightMoves.put("DIAG_LEFT", 17);
     knightMoves.put("DIAG_LEFT2", 15);
     knightMoves.put("BOTTOM_LEFT", 6);
  }
  

  
    ArrayList<Integer> legalMoves(){
       moveIndexes.clear();
       addKnightMoves();
       removeOccupiedSquares();
       return moveIndexes; 
    
  }
  
  
  void addKnightMoves(){
    
    for(int i: knightMoves.values()){
      if ( (currentSquare.index + i) >= 0 && (currentSquare.index + i) < 64 ){
      if(board.getSquareByIndex(currentSquare.index + i).squareColor != currentSquare.squareColor){
        moveIndexes.add(currentSquare.index + i);
      }
       
      
      }
      
      
    }
    
    
  }
  
  
}
