
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
 ArrayList<Move> moves; 
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
   moves = new ArrayList<Move>();   

   
 }
  
  
  

   
  
  
 void run(){
   
    // display squares
    for(Square s: board.squares){
         s.display();
         debugMessages();
             
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
showOccupiedSquare();
  
  
 } // End of run() method. 
 
 

 
 
 void checkForMovingPieces(){
   Square s = getSquareUnderMouse(); 
  
     if(s != null 
         && s.getPiece() != null 
         && s.getPiece().isblackPiece == !whiteToMove 
         && movingPiece == false){
         // clicked on a square with a piece that matches the color of the turn. (black or white).    
           
         movingPiece = true;
         Piece p = s.getPiece(); 
         p.moving = true;
         s.setPiece(null);
         }
 }
 
 boolean isEscapeSquareForKing(Square s, Piece p){
 
     if(whiteToMove){
       if(squaresUnderAttackByBlack.contains(s.index) && p.moveIndexes.contains(s.index)) return false;
       else return true;
       
     }
     else{
        if(squaresUnderAttackByWhite.contains(s.index) && p.moveIndexes.contains(s.index)) return false;  
         else return true;  
       }
     }
 
 boolean mock_move_resolves_check (Square s, Piece p){ 
   board.mock_move(s,p); 
   updateSquaresAttackedByWhite(this.board);
   updateSquaresAttackedByBlack(this.board);
   if(isEnemyKingInCheck()){
     undo(moves.get(moves.size()-1));
     kingInCheck = false; 
     return false;  
   }
   else{
    return true; 
   }
   
 }
  
 
 void undo(Move m){
 print("undoing move: "); 
 print("from " + m.from.name + " to " + m.to.name + "\n");  
 if(m.capture){ //<>//
  
   Piece captured = board.capturedPieces.get(board.capturedPieces.size()-1);

   m.to.piece = captured;  
   m.piece.dummy_move(m.from);
   moves.remove(moves.get(moves.size()-1));
   
   board.capturedPieces.remove(captured);
   board.pieces.add(captured);
 }
 else{ 
   m.to.piece = null; 
   m.piece.dummy_move(m.from);
   moves.remove(moves.get(moves.size()-1));
   
 }
 
     updateSquaresAttackedByWhite(this.board);
     updateSquaresAttackedByBlack(this.board);

 }
  
 
 boolean resolvesCheck(Square s, Piece p){ 

  if(kingInCheck == false) return true; 
  else{ 
    if((p instanceof King) && isEscapeSquareForKing(s, p)){ // escape squares
      kingInCheck = false; 
      return true; 
    }
    else{
     // check if placing that piece resolves the check. Recalculate the attacked squares
     if(mock_move_resolves_check(s,p)){
       kingInCheck = false; 
       return true; 
     }
    }
  }
  return false; 
 }
 
 boolean movePlacesSelfInCheck(Square s, Piece p){ 
   if ( (p instanceof King) && !isEscapeSquareForKing(s, p ) ) { 
  return true;  
 }
 else{ 
    if(!mock_move_resolves_check(s,p)){
       return true; 
     }
 }

return false; 
   
 }
 
 
 boolean satisfiesConstraints(Square s, Piece p){ 
   if (resolvesCheck(s, p) && !movePlacesSelfInCheck(s, p)){
   return true; 
   }
   else{
   sf_error.play(); 
   return false;
   }
  
 }
 
  void placePieceAfterMovement(){
    
       Square s = getSquareUnderMouse(); 
       Piece p = getMovingPiece();
       move_capture_stay(s, p);  
     
       }  
       
 
 
   
 
 void move_capture_stay(Square s, Piece p){ 
    if(s != null &&  p != null) { 
        Boolean validSquare = (s != p.currentSquare) &&  (p.moveIndexes.contains(s.index) && satisfiesConstraints(s, p) ); 
       
                  
        if (validSquare && p.enemyPieceOnSquare(s)){
          //capture enemy piece
          
          p.captureOn(s);  
          movingPiece = false; 
          sf_capture.play();
          nextPlayersTurn();
           
         } 
         else if(validSquare){
         // Move to the square  
           p.move(s); 
           movingPiece = false; 
           sf_move.play(); 
          nextPlayersTurn();  
         }
         else{
         // put the piece back down
         p.currentSquare.setPiece(p); 
         p.moving = false; 
         movingPiece = false; 
         }
   }
 }
 


 

 
 
 void showMoves(){
  
   if(getMovingPiece() != null){
   Piece p = getMovingPiece();
   for(int loc : p.legalMoves()){
     fill(50); 
     Square s = board.getSquareByIndex(loc); 
     ellipse(s.center.x, s.center.y, 20,20); 
     
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
  
      if(squaresUnderAttackByWhite.contains(getEnemyKingLocation().index)
           || squaresUnderAttackByBlack.contains(getEnemyKingLocation().index)){ 
       return true;  
      }
      return false; 
    }
    
 void startingPosition(){  
 movingPiece = false;
 kingInCheck = false; 
 whiteToMove = true;
 squaresUnderAttackByBlack.clear(); 
 squaresUnderAttackByWhite.clear(); 
 board.resetBoard(); 
 }
 





void nextPlayersTurn(){
 if(whiteToMove == true) whiteToMove = false; 
 else whiteToMove = true;
 updateSquaresAttackedByWhite(this.board);
 updateSquaresAttackedByBlack(this.board);

}

void updateSquaresAttackedByWhite(ChessBoard board){
  squaresUnderAttackByWhite.clear(); 
  for(Piece p : board.pieces){
   if(!p.isblackPiece  && !(p instanceof Pawn)){
    p.legalMoves();

     for(int i: p.moveIndexes){ 
      squaresUnderAttackByWhite.add(i); 
     }
   }
   else if (!p.isblackPiece && (p instanceof Pawn)){ 
    
     for(int i: ((Pawn) p).attackingMoves()){ 
     
       squaresUnderAttackByWhite.add(i); 
     } 
   }
  } 
}

void updateSquaresAttackedByBlack(ChessBoard board){
  squaresUnderAttackByBlack.clear(); 
  for(Piece p : board.pieces){
   if(p.isblackPiece && !(p instanceof Pawn)){
    p.legalMoves(); 
     for(int i: p.moveIndexes){ 
      squaresUnderAttackByBlack.add(i); 
     }
   }
    else if (p.isblackPiece && (p instanceof Pawn)){ 
     for(int i: ((Pawn) p).attackingMoves()){ 
       squaresUnderAttackByBlack.add(i); 
     } 
   }
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
  
  
  void showOccupiedSquare(){
    if(mousePressed && mouseButton == RIGHT){
       Square s = getSquareUnderMouse(); 
       if(s != null && s.piece != null){
        Square cur  = s.piece.currentSquare; 
        cur.drawCircleInSquare(); 
       }
       
    }
  }
  
  
   
void debugMessages(){
   
   textSize(20);
     fill(255,0,0); 
     for(Square s : squares){
       if(s.piece != null){
       text("X", s.center.x, s.center.y); 
       }
       else{
       text("O", s.center.x, s.center.y); 
       }
     //text(s.index, s.center.x, s.center.y);
     }
     
}
  
  void checkForInputs(){ 
      

  if(keyPressed && key == 'r' ){
  
  startingPosition(); 
  
   }
    if(keyPressed && key == 'd' ){
    if(moves.size() != 0){
    for(Move m: moves){ 
     print(m.from.name + " to " + m.to.name + "\n");  
    }
    }
  
   }
   

  }
    



}

















   
   
 
 
 

   
  
   


 
 
  
  
