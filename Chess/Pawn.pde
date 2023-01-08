class Pawn extends Piece{
  
  
   Pawn(String imagePath, Square s){
     super(imagePath, s); 
     
  }
  
  @Override
  void move(){
    if(this.moving){
     text("Clicked on " + this.currentSquare.name, width/2, height/2) ;
    }
  }
  
  
  
  ArrayList<Integer> legalMoves(){
   moveIndexes.clear();
   
   
   boolean onLeftEdge = leftEdgeIndexes.contains(currentSquare.index); 
   
   boolean onRightEdge = rightEdgeIndexes.contains(currentSquare.index);
   boolean onStart = currentSquare.index == startingSquare.index;
   
   
 if(isblackPiece){
    if(onStart){
      moveIndexes.add(currentSquare.index + 2);
      moveIndexes.add(currentSquare.index + 1);
    }
    if(onLeftEdge ){
      
      moveIndexes.add(currentSquare.index - 7 );
    }
    
    if(onRightEdge){
      moveIndexes.add(currentSquare.index + 9  );
    }
   
   
   if ( !onRightEdge && !onLeftEdge){
     moveIndexes.add(currentSquare.index + 1);
     moveIndexes.add(currentSquare.index + 9  );
     moveIndexes.add(currentSquare.index - 7 );
     }
   
    }
   else{
         if(onStart){
      moveIndexes.add(currentSquare.index - 2);
      moveIndexes.add(currentSquare.index - 1);
    }
    if(onLeftEdge ){
      
      moveIndexes.add(currentSquare.index + 7 );
    }
    
    if(onRightEdge){
      moveIndexes.add(currentSquare.index - 9  );
    }
   
   
   if ( !onRightEdge && !onLeftEdge){
     moveIndexes.add(currentSquare.index - 1);
     moveIndexes.add(currentSquare.index - 9  );
     moveIndexes.add(currentSquare.index + 7 );
     }
     
   }
    
    
       return moveIndexes; 
  
  }
  
  
  
}
