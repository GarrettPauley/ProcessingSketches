
import java.util.stream.Collectors; 
class Game{

 ArrayList<Square> squares; 
 ChessBoard board;
 boolean movingPiece;
 boolean finishedMoving; 
 ArrayList<Piece> movedPieces; 
 int moveIndex = 0; 
 color prevColor; 
 
  ArrayList<Integer> moveIndexesToRemove; 

 
 Game(){ 
   board = new ChessBoard(1);
   squares = board.squares; 
   
   movedPieces = new ArrayList<Piece>(); 
   finishedMoving = true; 
   moveIndexesToRemove =  new ArrayList<Integer>(); 
   
 }
  
  
  

   
  
  
 void run(){
   
    // display squares
    for(Square s: board.squares){
         s.display();
         //debugMessages();
             
    }          
     for( Piece p: board.pieces){
      
      p.display();
          
 }
 
showMoves();
  

  
 if(keyPressed && keyCode == LEFT){
  undo(); 
  
  
 }
 
  if(keyPressed && keyCode == RIGHT ){
  

  
   }
 } // End of run() method. 
 
 
 void checkForMovingPieces(){
   Square s = getSquareUnderMouse(); 
  
     if(s != null && s.piece != null && movingPiece == false){
       
        print("clicking on Square " + s.name + '\n');
        movingPiece = true;
   
         Piece p = s.piece; 
         p.moving = true;
        // Uncomment to make the moving piece green. 
         //prevColor = s.squareColor; 
         //s.squareColor = color(0,255,0);
         s.piece = null;
         
         }
       
 }
 
 void showMoves(){
   if(getMovingPiece() != null){
   Piece p = getMovingPiece();
   //print( "Legal moves from " + p.currentSquare.name +  " " + p.legalMoves() + '\n');
   //print( "PreviousSquares for " + p.currentSquare.name + " " +  '\n');
   //for(Square s: p.previousSquares){
     //print(s.index); 
   //}
   for(int loc : p.legalMoves()){
     fill(50); 
     Square s = board.getSquareByIndex(loc); 
     ellipse(s.center.x, s.center.y, 10,10); 
     
   }
   }
 }
 
 
 
 
 
 void placePieceAfterMovement(){
 
       Square s = getSquareUnderMouse(); 
       Piece p = getMovingPiece();
       
     Boolean validSquare = (s != p.currentSquare) &&  (p.moveIndexes.contains(s.index));  
     
        if(s == p.currentSquare){
         s.piece = p; 
         p.moving = false; 
         movingPiece = false; 
        }
                  
        if (validSquare && p.enemyPieceOnSquare(s)){
          p.captureOn(s);  
          movingPiece = false; 
           
         } 
         if(validSquare){
           p.move(s); 
           movingPiece = false; 
           
         }
       
   }
   
   void updateSquares(){
     
   }
   
 
 
 
 void undo(){
  
  if(movedPieces.size() > 0){
  Piece p =  movedPieces.get(movedPieces.size() - 1);
  p.movetoPreviousSquare(); 
  movedPieces.remove(p); 
  
  
  
  }
 }
 

 
 
 
 
 
void debugMessages(){
   textSize(20);
     fill(255,0,0); 

     for(Square s : squares){
  
        
        text(s.index, s.center.x, s.center.y);
      
     }
     
    //text("Global Moving Piece:  " + movingPiece + '\n', width/2, height/2 + 40);
    //text("Number of Moving Pieces:  " + numberOfPiecesMoving() + '\n', width/2, height/2 + 20 ); 

    //text("Number of moves" + movedPieces.size() + '\n', width/2, height/2 );
    //text("Number of active pieces" + numberOfPiecesMoving() + '\n', width/2, height/2 - 20); 
}

boolean moreThanOnePieceMoving(){
 return board.pieces.stream().filter(p -> p.moving == true).count() > 1; 
}

 long numberOfPiecesMoving(){
 return board.pieces.stream().filter(p -> p.moving == true).count();  
}

Piece getMovingPiece(){
  return board.pieces.stream().filter(p -> p.moving == true).findFirst().orElse(null);  
  
}

Square getSquareUnderMouse(){
 return squares.stream().filter(s -> s.isClicked() == true).findFirst().orElse(null);   
}






}










   
   
 
 
 

   
  
   


 
 
  
