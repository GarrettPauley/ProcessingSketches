class Rook extends Piece{
  
   Rook(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     
  }
  

    ArrayList<Integer> legalMoves(){
    moveIndexes.clear();
    addRookMoves(); 
    removeOccupiedSquares(); 
    print("ON SAME RANK: " + String.valueOf(onSameRank(19))); 
    printRanks();
    return moveIndexes; 
    
  }
  
  void addRookMoves(){ //<>//
    
   boolean onLeftEdge = leftEdgeIndexes.contains(currentSquare.index);
   boolean onRightEdge = rightEdgeIndexes.contains(currentSquare.index);
   boolean onTopEdge = topEdgeIndexes.contains(currentSquare.index);
   boolean onBottomEdge = bottomEdgeIndexes.contains(currentSquare.index);
   
   //print("ON LEFT" + String.valueOf(onLeftEdge) + "\n");   
   //print("ON RIGHT" + String.valueOf(onRightEdge)+ "\n");
   //print("ON TOP" + String.valueOf(onTopEdge)+ "\n");
   //print("ON BOTTOM" + String.valueOf(onBottomEdge)+ "\n");
     //if(onTopEdge){
  //     //print("First");
  //  getOrthogonalLines(-ABOVE_BELOW);
  //   getOrthogonalLines(ADJACENT);
  //  getOrthogonalLines(-ADJACENT);
  // }
   
  //   if(onBottomEdge){ //<>//
  //    // print("Second");
  //  getOrthogonalLines(ABOVE_BELOW);
  //  getOrthogonalLines(ADJACENT);
  //  getOrthogonalLines(-ADJACENT);
  // }
   
   
    
  //  if( (!onTopEdge) && (!onBottomEdge) && (!onLeftEdge) && (!onRightEdge))
  //  //print("Third");
  //  getOrthogonalLines(ABOVE_BELOW);
  //  getOrthogonalLines(-ABOVE_BELOW);
  //  getOrthogonalLines(ADJACENT);
  //  getOrthogonalLines(-ADJACENT);
  
    getOrthogonalLines(ABOVE_BELOW);
    getOrthogonalLines(-ABOVE_BELOW);
    
      
    getOrthogonalLines(ADJACENT);
    
    getOrthogonalLines(-ADJACENT);
  }
  
  
  
  
  boolean onSameRank(int index){
    for(List<Integer> rank : board.ranks.values()){ //<>//
      List<Integer> r = rank; 
      if(r.contains(index) && r.contains(currentSquare.index)){
       return true;  
      }
      else return false; 
     
    }
    return false; 
  }
  
   boolean onSameFile(int index){
    for(List<Integer>  file : board.files.values()){
  
      if(file.contains(index) && file.contains(currentSquare.index)){
       return true;  
      }   
    }
    return false; 
  }
  
  
  
  void printRanks(){
    for(List<Integer> rank : board.ranks.values()){
         print(rank + "\n"); 
    }
  }
  
  
  
  
   
  void getOrthogonalLines(int offset){
   int start = currentSquare.index; 
   int counter = 1; 
   
   boolean openLines = true; 
   
    
    while( openLines  && (start + (offset * counter)) < 64 && (start + (offset * counter)) >= 0 ){ //<>//
      
     Square nextSquare = board.getSquareByIndex(start + (offset * counter));
       // Find all the open spaces on vertical or horizontal line (depending  on offset provided) 
       if(nextSquare.piece == null ){
         print("in first IF :  adding index " + nextSquare.index + " to moveindexes \n");  
        moveIndexes.add(nextSquare.index); 
        counter++; 
       }
       // Find the first capturable piece on the line
       else if(nextSquare.piece != null 
                 && (nextSquare.piece.isblackPiece != this.isblackPiece) 
                 && (onSameFile(nextSquare.index) || onSameRank(nextSquare.index)
                 )){
         print("in else IF :  adding index " + nextSquare.index + " to moveindexes \n");  
         moveIndexes.add(nextSquare.index);
          
         break;
       }
      
      else{
       openLines = false; 
       }
    }
   
}

}
