class King extends Piece{
  Boolean inCheck; 
  
   King(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b);
     inCheck = false; 
     
  }
  
   
   
 void addKingMoves(){
   
   boolean onLeftEdge = leftEdgeIndexes.contains(currentSquare.index);
   boolean onRightEdge = rightEdgeIndexes.contains(currentSquare.index);
   boolean onTopEdge = topEdgeIndexes.contains(currentSquare.index);
   boolean onBottomEdge = bottomEdgeIndexes.contains(currentSquare.index);
   
   if(onLeftEdge && onBottomEdge){
     
    moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT);
    moveIndexes.add(currentSquare.index - DIAGONAL_RIGHT);
   }
   
   if(onRightEdge && onBottomEdge){
     
    moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index + ADJACENT );
    moveIndexes.add(currentSquare.index + DIAGONAL_LEFT);
   }
   
   if(onLeftEdge && onTopEdge){
     
    moveIndexes.add(currentSquare.index - ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT);
   }
   
   if(onRightEdge && onTopEdge){
      
    moveIndexes.add(currentSquare.index - ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT);
   }
   
   if(onRightEdge){
     
     moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ABOVE_BELOW );
    moveIndexes.add(currentSquare.index + DIAGONAL_RIGHT );
    moveIndexes.add(currentSquare.index + DIAGONAL_LEFT ); 
    moveIndexes.add(currentSquare.index + ADJACENT );
   }
   
    if(onLeftEdge){
       
     moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ABOVE_BELOW );
    moveIndexes.add(currentSquare.index - DIAGONAL_RIGHT );
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT ); 
    moveIndexes.add(currentSquare.index - ADJACENT );
   }
   
   
    if(onTopEdge){
       
     moveIndexes.add(currentSquare.index - ABOVE_BELOW);
    moveIndexes.add(currentSquare.index + ADJACENT );
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index + DIAGONAL_RIGHT ); 
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT );
   }
   
     if(onBottomEdge){
       
     moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index + ADJACENT );
    moveIndexes.add(currentSquare.index - DIAGONAL_RIGHT ); 
    moveIndexes.add(currentSquare.index + DIAGONAL_LEFT );
   }
   
   if(!onBottomEdge && !onTopEdge && !onLeftEdge && !onRightEdge){
      
    moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index + ADJACENT );
    moveIndexes.add(currentSquare.index + DIAGONAL_RIGHT ); 
    moveIndexes.add(currentSquare.index - DIAGONAL_RIGHT ); 
    moveIndexes.add(currentSquare.index + DIAGONAL_LEFT );
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT );
     
   }
   
   // Does not behave as expected. 
   //for(Square s: board.squares){
   //  if ( 
   //  (isOneFileAway(currentSquare, s) && isOneRankAway(currentSquare, s)) 
   //  || (onSameRank(currentSquare, s) && isOneFileAway(currentSquare, s)) 
   //  || (onSameFile(currentSquare, s) && isOneRankAway(currentSquare, s)) 
     
   //  ) {moveIndexes.add(s.index);} 
   //}
   
   
   
   
 }
   @Override
   ArrayList<Integer> legalMoves(){
    moveIndexes.clear(); 
    addKingMoves(); 
    //removeOccupiedSquares();  
    return moveIndexes; 
    
  }
  
    boolean getInCheck(){
    return this.inCheck; 
  } 
  
  void setInCheck(boolean _inCheck){
   this.inCheck = _inCheck; 
  }

  
  
}
