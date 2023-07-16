
import java.util.stream.Collectors; 
import processing.sound.*; 
class Game{
 
 ArrayList<Square> squares; 
  ArrayList<Integer> squaresUnderAttackByWhite; 
 ArrayList<Integer> squaresUnderAttackByBlack;  
 ChessBoard board;
 boolean movingPiece;
 boolean whiteToMove; 
 boolean debug = true;
 boolean kingInCheck; 
 ArrayList<Piece> movedPieces; 
 int moveIndex = 0; 
 color prevColor; 

 

 ArrayList<Square> toDraw = new ArrayList(); 
 

 
 Game(){ 
   board = new ChessBoard(1);
   squares = board.squares; 
   whiteToMove = true;  
   kingInCheck = false; 
   squaresUnderAttackByWhite = new ArrayList();
   squaresUnderAttackByBlack = new ArrayList();
   movedPieces = new ArrayList<Piece>(); 
    

  
  
   
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
if(isEnemyKingInCheck()){ 
 kingInCheck = true; 
 showCheck();
  
}
showMoves();
drawArrow();
checkForInputs(); 
  
  
 } // End of run() method. 
 
 

 
 
 void checkForMovingPieces(){
   Square s = getSquareUnderMouse(); 
  
     if(s != null && s.getPiece() != null && movingPiece == false){
         movingPiece = true;
         Piece p = s.getPiece(); 
         p.moving = true;
         s.setPiece(null);
         }
 }
 
 boolean isEscapeSquareForKing(Square s){
     if(whiteToMove){
       if(squaresUnderAttackByBlack.contains(s)) return false;
       else return true;
       
     }
     else{
        if(squaresUnderAttackByWhite.contains(s)) return false;  
         else return true;  
       }
     }
 
 
 boolean resolvesCheck(Square s){ 
  //Square kingLocation = getKingLocation();  //<>//
  if(kingInCheck == false) return true; 
  else{ 
    if(isEscapeSquareForKing(s)){
      kingInCheck = false;  //<>//
      return true; 
    } //<>//
  } //<>//
  return false; 
 }
 
 boolean movePlacesSelfInCheck(Square s, Piece p){ 
   if ( (p instanceof King) && !isEscapeSquareForKing(s) ) { 
  return true;  
 }

return false; 
   
 }
 
 
 boolean satisfiesConstraints(Square s, Piece p){ 
   if (resolvesCheck(s) && !movePlacesSelfInCheck(s, p)) return true; 
   return false; 
  
 }
 
  void placePieceAfterMovement(){
 
       Square s = getSquareUnderMouse(); 
       Piece p = getMovingPiece();
       move_capture_stay(s, p); 
     
        
    
   
     
       }   
   
 
 void move_capture_stay(Square s, Piece p){ 
    if(s != null &&  p != null) { 
        Boolean validSquare = (s != p.currentSquare) &&  (p.moveIndexes.contains(s.index) && satisfiesConstraints(s, p) );
        if(s == p.currentSquare){
         s.setPiece(p); 
         p.moving = false; 
         movingPiece = false;
         
        }
                   //<>//
        if (validSquare && p.enemyPieceOnSquare(s)){
          p.captureOn(s);  
          movingPiece = false; 
          sf_capture.play();
          nextPlayersTurn(); 
           
         } 
         if(validSquare){
           p.move(s); 
           movingPiece = false; 
           sf_move.play(); 
          nextPlayersTurn();  
         }
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
 
 Square getEnemyKingLocation(){
  String startingSquareOfEnemyKing = !whiteToMove ? "E8" : "E1"; 
  return board.pieces.stream()
          .filter(p -> p.startingSquare == board.findSquareByName(startingSquareOfEnemyKing))
          .findFirst().get().currentSquare; 
}

 Square getKingLocation(){
  String startingSquareOfKing = whiteToMove ? "E8" : "E1"; 
  return board.pieces.stream()
          .filter(p -> p.startingSquare == board.findSquareByName(startingSquareOfKing))
          .findFirst().get().currentSquare; 
}
 
 
 Boolean isEnemyKingInCheck(){
  
      if(squaresUnderAttackByWhite.contains(getEnemyKingLocation())
           || squaresUnderAttackByBlack.contains(getEnemyKingLocation())){ 
       return true;  
      }
      return false; 
    } 
 
 

   
  
   
 
 
 
 void undo(){
 // move the last moved piece back to it's previous square.  
  if(movedPieces.size() > 0){
  Piece p =  movedPieces.get(movedPieces.size() - 1);
  p.movetoPreviousSquare(); 
  movedPieces.remove(p); 
  
  
  
  }
 }
 
 void startingPosition(){   //<>//
 movingPiece = false; 
 board.resetBoard(); 
 }
 


 
void debugMessages(){
   textSize(20); //<>//
     fill(255,0,0); 
     for(Square s : squares){
        text(s.piece.x, s.center.x, s.center.y);
     }
     
}


void nextPlayersTurn(){
 if(whiteToMove == true) whiteToMove = false; 
 else whiteToMove = true;
 updateSquaresAttackedByWhite();
 updateSquaresAttackedByBlack();
}

void updateSquaresAttackedByWhite(){
  squaresUnderAttackByWhite.clear(); 
  for(Piece p : board.pieces){ //<>//
   if(!p.isblackPiece  && !(p instanceof Pawn)){
    p.legalMoves(); 
     for(int i: p.moveIndexes){ 
      squaresUnderAttackByWhite.add(board.getSquareByIndex(i)); 
     }
   }
   else if (!p.isblackPiece && (p instanceof Pawn)){ 
     for(int i: ((Pawn) p).attackingMoves()){ 
       squaresUnderAttackByWhite.add(board.getSquareByIndex(i)); 
     } 
   }
  }


  
   
  
}

void updateSquaresAttackedByBlack(){
  squaresUnderAttackByBlack.clear(); 
  for(Piece p : board.pieces){
   if(p.isblackPiece && !(p instanceof Pawn)){
    p.legalMoves(); 
     for(int i: p.moveIndexes){ 
      squaresUnderAttackByBlack.add(board.getSquareByIndex(i)); 
     }
   }
    else if (p.isblackPiece && (p instanceof Pawn)){ 
     for(int i: ((Pawn) p).attackingMoves()){ 
       squaresUnderAttackByBlack.add(board.getSquareByIndex(i)); 
     } 
   }
  }
   print("Squares under attack by Black");
  for(Square s: squaresUnderAttackByBlack){ 
    print(s.index + "\n"); 
  }
  
}

void showCheck(){
  fill(255,0,0,60); // red with 60% opacity
  stroke(255,0,0); 
  ellipse(getEnemyKingLocation().center.x + 2, getEnemyKingLocation().center.y, 75,75); 
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
  
  void showAttackingMoves(Piece p){
    
    if(p instanceof Pawn){ 
     for(int i: ((Pawn) p).attackingMoves()){ 
      board.getSquareByIndex(i).drawCircleInSquare();  
     }
    }
    
    else{ 
      for(int i: p.legalMoves()){ 
      board.getSquareByIndex(i).drawCircleInSquare();  
     }
    }
    
  }
  
  void checkForInputs(){ 
      
 if(keyPressed && keyCode == LEFT){
  undo(); 
  
 }
  if(keyPressed && key == 'r' ){
  
  startingPosition(); 
  
   }
   
  //if(mousePressed && (mouseButton == RIGHT) ){
  //  if(getSquareUnderMouse() != null)
  //   getSquareUnderMouse().drawCircleInSquare(); 
  //}
  
   if(mousePressed && (mouseButton == RIGHT) ){
    if(getSquareUnderMouse() != null){
     Square s = getSquareUnderMouse();
     if(s.piece != null){
     showAttackingMoves(s.piece);
     }
    
  }
  
  }
    
}


}

















   
   
 
 
 

   
  
   


 
 
  
