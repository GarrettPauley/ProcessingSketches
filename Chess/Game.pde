
import java.util.stream.Collectors; 
import processing.sound.*; 
class Game{
 
 ArrayList<Square> squares; 
 ChessBoard board;
 boolean movingPiece;
 Boolean whiteToMove; 
 boolean finishedMoving; 
 ArrayList<Piece> movedPieces;
 int moveIndex = 0; 
 color prevColor; 

 

 ArrayList<Square> toDraw = new ArrayList(); 
 ArrayList<Integer> moveIndexesToRemove; 

 
 Game(){ 
   board = new ChessBoard(1);
   squares = board.squares; 
   whiteToMove = true; 
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

if(isEnemyKingInCheck()){
 showCheck();  
}


  
 if(keyPressed && keyCode == LEFT){
  undo(); 
  
 }
  if(keyPressed && key == 'r' ){
  
  startingPosition(); 
  
   }
   
  if(mousePressed && (mouseButton == RIGHT) ){
    if(getSquareUnderMouse() != null)
     getSquareUnderMouse().drawCircleInSquare(); 
  }
  
  drawArrow();
  
  
 } // End of run() method. 
 
 
void checkForMovingPieces(){
   Square s = getSquareUnderMouse(); 

     
     if(s != null && s.getPiece() != null && movingPiece == false && whiteToMove != s.getPiece().isblackPiece){
        print("clicking on Square " + s.name + '\n');
        movingPiece = true;

         Piece p = s.getPiece(); 
         p.moving = true;

         s.setPiece(null);

         }
     }

 
 void showMoves(){
   if(getMovingPiece() != null){
   Piece p = getMovingPiece();
   for(int loc : p.legalMoves()){
     fill(50); 
     Square s = board.getSquareByIndex(loc); 
     ellipse(s.center.x, s.center.y, 10,10); 
     
   }
   }
 }
 
 
 
 
 
 void placePieceAfterMovement(){
 
       Square s = getSquareUnderMouse(); 
       Piece p = getMovingPiece(); //<>//
     
     Boolean validSquare = (s != p.currentSquare) &&  (p.moveIndexes.contains(s.index)); //<>//
     
     
        if(s == p.currentSquare){
         s.setPiece(p); 
         p.moving = false;  //<>//
         movingPiece = false;
         sf_move.play();  //<>//
        }
                  
        if (validSquare && p.enemyPieceOnSquare(s)){
          p.captureOn(s);  
          movingPiece = false; 
          sf_capture.play();
          nextPlayersTurn(); 
           
         } 
         else if (validSquare){
           p.move(s); 
           movingPiece = false; 
           sf_move.play(); 
           nextPlayersTurn(); 
           
         }
     
       
   }
   
  
   
 
 
 
 void undo(){
  
  if(movedPieces.size() > 0){
  Piece p =  movedPieces.get(movedPieces.size() - 1);
  p.movetoPreviousSquare(); 
  movedPieces.remove(p); 
  
  }
 }
 
 void startingPosition(){
   
   for(Square s: board.squares){
     s.setPiece(null); 
   }
   
   for(Piece p: board.capturedPieces){
    board.pieces.add(p);  
   }
   
  for(Piece p : board.pieces){
   p.move(p.startingSquare); 
  }
  
  board.capturedPieces.clear();
  whiteToMove = true; 
 }
 

 
 
 
 
 
void debugMessages(){
   textSize(20);
     fill(255,0,0); 
     for(Square s : squares){
        text(s.index, s.center.x, s.center.y);
     }
     
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

void nextPlayersTurn(){
 if(whiteToMove == true) whiteToMove = false; 
 else whiteToMove = true; 
}

Square getKingLocation(boolean _whiteToMove){
  String startingSquareOfKing = _whiteToMove ? "E8" : "E1"; 
  return board.pieces.stream()
          .filter(p -> p.startingSquare == board.findSquareByName(startingSquareOfKing))
          .findFirst().get().currentSquare; 
}

Boolean isEnemyKingInCheck(){
  // not complete. Does not include discovered or double check. 
 if(movedPieces.size() >= 1){
 Piece p = movedPieces.get(movedPieces.size() - 1);
 //print("Last piece to move: " + p.location  + "\n" );
 //print(p.legalMoves()); 
 //print("enemy King: " + getKingLocation(!whiteToMove).index); 
 if(p.legalMoves().contains(getKingLocation(!whiteToMove).index)){
   getKingLocation(!whiteToMove).piece.setInCheck(true);
   return true;
 }
 else return false; 
 }
 
 
 
 
 else return false; 
 
 
  
}

void showCheck(){
  fill(255,0,0,60); // red with 60% opacity
  stroke(255,0,0); 
  ellipse(getKingLocation(!whiteToMove).center.x + 2, getKingLocation(!whiteToMove).center.y, 75,75); 
}



void drawArrow(){
   
   if(mousePressed && (mouseButton == RIGHT) && (keyPressed && key == 'a') ){     
    if(getSquareUnderMouse() != null){
      toDraw.add(getSquareUnderMouse());     
     }
   
    Square s1 = toDraw.get(0); 
    Square s2 = toDraw.get(toDraw.size() - 1); 
    
      stroke(0,0,255); 
      strokeWeight(7);
      fill(0,0,255); 
      pushMatrix(); 
        line(s1.center.x, s1.center.y, s2.center.x, s2.center.y);
        translate(s2.center.x, s2.center.y); 
        ellipse(0,0, 10,10);
      popMatrix(); 
     }
  }


} // END Game class
  
  
 
  

















   
   
 
 
 

   
  
   


 
 
  
