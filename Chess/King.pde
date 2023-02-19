class King extends Piece{
  
   King(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     
  }
  
   
   
 void addKingMoves(){
   
   boolean onLeftEdge = leftEdgeIndexes.contains(currentSquare.index);
   boolean onRightEdge = rightEdgeIndexes.contains(currentSquare.index);
   boolean onTopEdge = topEdgeIndexes.contains(currentSquare.index);
   boolean onBottomEdge = bottomEdgeIndexes.contains(currentSquare.index);
   
   if(onLeftEdge && onBottomEdge){
     print("LEFT AND BOTTOM \n"); 
    moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT);
    moveIndexes.add(currentSquare.index - DIAGONAL_RIGHT);
   }
   
   if(onRightEdge && onBottomEdge){
     print("RIGHT AND BOTTOM \n"); 
    moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index + ADJACENT );
    moveIndexes.add(currentSquare.index + DIAGONAL_LEFT);
   }
   
   if(onLeftEdge && onTopEdge){
     print("LEFT AND TOP \n"); 
    moveIndexes.add(currentSquare.index - ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT);
   }
   
   if(onRightEdge && onTopEdge){
     print("RIGHT AND TOP \n"); 
    moveIndexes.add(currentSquare.index - ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT);
   }
   
   if(onRightEdge){
     print("RIGHT \n"); 
     moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ABOVE_BELOW );
    moveIndexes.add(currentSquare.index + DIAGONAL_RIGHT );
    moveIndexes.add(currentSquare.index + DIAGONAL_LEFT ); 
    moveIndexes.add(currentSquare.index + ADJACENT );
   }
   
    if(onLeftEdge){
      print("LEFT \n"); 
     moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ABOVE_BELOW );
    moveIndexes.add(currentSquare.index - DIAGONAL_RIGHT );
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT ); 
    moveIndexes.add(currentSquare.index - ADJACENT );
   }
   
   
    if(onTopEdge){
      print("TOP \n"); 
     moveIndexes.add(currentSquare.index - ABOVE_BELOW);
    moveIndexes.add(currentSquare.index + ADJACENT );
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index + DIAGONAL_RIGHT ); 
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT );
   }
   
     if(onBottomEdge){
       print("BOTTOM \n"); 
     moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index + ADJACENT );
    moveIndexes.add(currentSquare.index - DIAGONAL_RIGHT ); 
    moveIndexes.add(currentSquare.index + DIAGONAL_LEFT );
   }
   
   if(!onBottomEdge && !onTopEdge && !onLeftEdge && !onRightEdge){
     print("SOMEWHERE IN THE MIDDLE \n"); 
    moveIndexes.add(currentSquare.index + ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ABOVE_BELOW);
    moveIndexes.add(currentSquare.index - ADJACENT );
    moveIndexes.add(currentSquare.index + ADJACENT );
    moveIndexes.add(currentSquare.index + DIAGONAL_RIGHT ); 
    moveIndexes.add(currentSquare.index - DIAGONAL_RIGHT ); 
    moveIndexes.add(currentSquare.index + DIAGONAL_LEFT );
    moveIndexes.add(currentSquare.index - DIAGONAL_LEFT );
     
   }
   
   
   
 }
  
   ArrayList<Integer> legalMoves(){
    moveIndexes.clear(); 
    addKingMoves(); 
    print("Moves before removing:  " + moveIndexes + "\n");
    removeOccupiedSquares(); 
    print("Moves after removing: " + moveIndexes + "\n"); 
    return moveIndexes; 
    
  }
  
}
