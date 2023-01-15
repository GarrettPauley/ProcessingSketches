class Pawn extends Piece{
  
   boolean onLeftEdge = leftEdgeIndexes.contains(currentSquare.index);
   boolean onRightEdge = rightEdgeIndexes.contains(currentSquare.index);
  
   Pawn(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     
  }
  
  @Override
  void move(Square s){
        previousSquares.add(currentSquare);
        s.piece = this;
        currentSquare = s; 
        
        moveToSquare(s);
     
        game.movedPieces.add(this);
        moving = false;
         
  }
  
  
  
  
  
  ArrayList<Integer> legalMoves(){
   
   moveIndexes.clear();
  
     if(isblackPiece){
       addblackPawnMoves();   
        }
     else{
     addwhitePawnMoves();
    }
  return moveIndexes; 
  }
  
  Boolean canAttackToRight(){
    if(isblackPiece ){ 
      if(!onRightEdge){
      Square s = board.getSquareByIndex(currentSquare.index - 7);
      if(s.piece != null){
      boolean hasWhitePiece = (!(s.piece.isblackPiece));
         if(hasWhitePiece ){
           return true; 
         }
         else{
           return false; 
         }
      }
    }
    }
    
    else{
      if(!onLeftEdge){ 
       Square s = board.getSquareByIndex(currentSquare.index + 7);
      if(s.piece != null){
      boolean hasBlackPiece = (s.piece.isblackPiece);
         if(hasBlackPiece ){
           return true; 
         }
         else{
           return false; 
         }
      }
      }
      
    }
    return false; 
  }
  
  Boolean canAttackToLeft(){
       if(isblackPiece){
        if(!onLeftEdge){ 
        Square s = board.getSquareByIndex(currentSquare.index + 9);
        if(s.piece != null){
        boolean hasWhitePiece = (!(s.piece.isblackPiece));
           if(hasWhitePiece ){
             return true; 
           }
           else{
             return false; 
           }
        }
      }
    }
    else{
      if(!onRightEdge){ 
       Square s = board.getSquareByIndex(currentSquare.index - 9);
      if(s.piece != null){
      boolean hasBlackPiece = (s.piece.isblackPiece);
         if(hasBlackPiece ){
           return true; 
         }
         else{
           return false; 
         }
      }
      }
    }
    
    
    return false; 
    
  }
  
  
  void removeOccupiedSquares(){
   List<Integer> occupied; 
   if(isblackPiece) occupied =  board.getSquareswithWhitePieces();
   else   occupied = board.getSquareswithWhitePieces();
   
     for(int i = 0; i < moveIndexes.size(); i++){
      if(occupied.contains(moveIndexes.get(i))){
       moveIndexes.remove(i);  
      }
     }
   
  }
  
  
 void  addwhitePawnMoves(){
     if(onStart() && noPieceInFront()){
      moveIndexes.add(currentSquare.index - 2);
      moveIndexes.add(currentSquare.index - 1);
    }
    
     if(!onStart() && noPieceInFront()){
       moveIndexes.add(currentSquare.index - 1);
    }
    
    if(canAttackToRight()){
      moveIndexes.add(currentSquare.index + 7); 
    }
    
     if(canAttackToLeft()){
      moveIndexes.add(currentSquare.index - 9); 
    }
    
    
       
   }
     
  
  
  
  void addblackPawnMoves(){
    
    if(onStart() && noPieceInFront()){
      moveIndexes.add(currentSquare.index + 2);
      moveIndexes.add(currentSquare.index + 1);
    }
    
    if(!onStart() && noPieceInFront()){
       moveIndexes.add(currentSquare.index + 1);
    }
    
    
     if(canAttackToRight()){
      moveIndexes.add(currentSquare.index - 7); 
    }
    
     if(canAttackToLeft()){
      moveIndexes.add(currentSquare.index + 9); 
    }
    

    
  }
  
  boolean onStart(){
    return  currentSquare.index == startingSquare.index;
  }
  
  boolean noPieceInFront(){
    if(isblackPiece){ 
      Square s = board.getSquareByIndex(currentSquare.index + 1);
      if(s.piece == null) return true; 
      else return false; 
    }
    else{
      Square s = board.getSquareByIndex(currentSquare.index - 1);
      if(s.piece == null) return true; 
      else return false;   
    }
      

  }
  
  
  
}
