
import java.util.stream.Collectors; 
class Game{
 ArrayList<Piece> pieces; 
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
   initPieces(); 
   movedPieces = new ArrayList<Piece>(); 
   finishedMoving = true; 
   moveIndexesToRemove =  new ArrayList<Integer>(); 
   
 }
  
  
  

 
 void initPieces(){
   pieces = new ArrayList<Piece>(); 
   
   pieces.add( new Pawn("Resources/white_pawn.png", board.findSquareByName("A2")));
   
  
   pieces.add(new Pawn("Resources/white_pawn.png", board.findSquareByName("B2")));  
   pieces.add(new Pawn("Resources/white_pawn.png", board.findSquareByName("C2"))); 
   pieces.add(new Pawn("Resources/white_pawn.png", board.findSquareByName("D2"))); 
   pieces.add(new Pawn("Resources/white_pawn.png", board.findSquareByName("E2"))); 
   pieces.add(new Pawn("Resources/white_pawn.png", board.findSquareByName("F2")));
   pieces.add(new Pawn("Resources/white_pawn.png", board.findSquareByName("G2"))); 
   pieces.add(new Pawn("Resources/white_pawn.png", board.findSquareByName("H2"))); 
  
   pieces.add( new Pawn("Resources/black_pawn.png", board.findSquareByName("A7")));
   pieces.add(new Pawn("Resources/black_pawn.png", board.findSquareByName("B7")));  
   pieces.add(new Pawn("Resources/black_pawn.png", board.findSquareByName("C7"))); 
   pieces.add(new Pawn("Resources/black_pawn.png", board.findSquareByName("D7"))); 
   pieces.add(new Pawn("Resources/black_pawn.png", board.findSquareByName("E7"))); 
   pieces.add(new Pawn("Resources/black_pawn.png", board.findSquareByName("F7")));
   pieces.add(new Pawn("Resources/black_pawn.png", board.findSquareByName("G7"))); 
   pieces.add(new Pawn("Resources/black_pawn.png", board.findSquareByName("H7"))); 
   
  
   //White rooks
   pieces.add(new Rook("Resources/white_rook.png", board.findSquareByName("A1"))); 
   pieces.add(new Rook("Resources/white_rook.png", board.findSquareByName("H1"))); 
   //Black rooks
   pieces.add(new Rook("Resources/black_rook.png", board.findSquareByName("A8"))); 
   pieces.add(new Rook("Resources/black_rook.png", board.findSquareByName("H8"))); 
   //White Rook
   pieces.add(new Knight("Resources/white_knight.png", board.findSquareByName("B1"))); 
   pieces.add(new Knight("Resources/white_knight.png", board.findSquareByName("G1"))); 
   
   //Black knights
   pieces.add(new Knight("Resources/black_knight.png", board.findSquareByName("B8"))); 
   pieces.add(new Knight("Resources/black_knight.png", board.findSquareByName("G8"))); 
   
   
    //White Bishops
   pieces.add(new Bishop("Resources/white_bishop.png", board.findSquareByName("C1"))); 
   pieces.add(new Bishop("Resources/white_bishop.png", board.findSquareByName("F1"))); 
   
   //Black Bishops
   pieces.add(new Bishop("Resources/black_bishop.png", board.findSquareByName("C8"))); 
   pieces.add(new Bishop("Resources/black_bishop.png", board.findSquareByName("F8"))); 
   
   // White Queen and King 
   pieces.add(new Queen("Resources/white_queen.png", board.findSquareByName("D1"))); 
   pieces.add(new King("Resources/white_king.png", board.findSquareByName("E1"))); 
   // Black Queen and King 
   pieces.add(new Queen("Resources/black_queen.png", board.findSquareByName("D8"))); 
   pieces.add(new King("Resources/black_king.png", board.findSquareByName("E8"))); 
   
  
// Add Pieces to starting squares
for(Piece p_: pieces){
 Square s = board.findSquareByName(p_.currentSquare.name);  
 s.piece = p_; 
}
   }
   
  
  
 void run(){
   
    // display squares
    for(Square s: board.squares){
         s.display();
         debugMessages();
         showMoves(); 
         
    }    
    
    
           
         
     for( Piece p: pieces){
      
      p.display();
      
      
    
        
 }
 

  

  
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
       // set that piece to be the moving piece. 
         Piece p = s.piece; 
         p.moving = true;
          
         prevColor = s.squareColor; 
         s.squareColor = color(0,255,0);
         s.piece = null;
         
         }
       //text("moving Piece bool " + movingPiece, width/3, height - 10); 
 }
 
 void showMoves(){
   if(getMovingPiece() != null){
   Piece p = getMovingPiece();
   print( "Legal moves from " + p.currentSquare.name +  " " + p.legalMoves() + '\n');
   for(int loc : p.legalMoves()){
     fill(0); 
     Square s = board.getSquareByIndex(loc); 
     ellipse(s.center.x, s.center.y, 4,4); 
     
   }
   }
 }
 
 
 
 
 
 void placePieceAfterMovement(){
 

  // check if one piece was moving. 
       Square s = getSquareUnderMouse(); 
       Piece p = getMovingPiece();
         if(s != p.currentSquare){
           p.previousSquares.add(p.currentSquare);
           p.currentSquare.squareColor =  prevColor ;  
           p.moveToSquare(s);
           s.piece = p; 
           movedPieces.add(p);
           p.currentSquare = s;  
           p.moving = false;
           movingPiece = false; 
           print("moved to " + p.currentSquare.name ); 
         }
         else{
          s.squareColor = prevColor; 
        
         }
   }
   
   void updateSquares(){
     
   }
   
 
 
 
 void undo(){
  
  if(movedPieces.size() > 0){
  Piece p =  movedPieces.get(movedPieces.size() - 1);
  p.movetoPreviousSquare(); 
  
  
  }
 }
 

 
 
 
 
 
void debugMessages(){
   textSize(20);
     fill(255,0,0); 

     for(Square s : squares){
  
        
        text(s.index, s.center.x, s.center.y);
      
     }
     
    text("Global Moving Piece:  " + movingPiece + '\n', width/2, height/2 + 40);
    text("Number of Moving Pieces:  " + numberOfPiecesMoving() + '\n', width/2, height/2 + 20 ); 

    text("Number of moves" + movedPieces.size() + '\n', width/2, height/2 );
    //text("Number of active pieces" + numberOfPiecesMoving() + '\n', width/2, height/2 - 20); 
}


void dontMove(){
Piece p = pieces.stream().filter(p2 -> p2.moving == true).findFirst().orElse(null);
p.moving = false; 
p.movetoPreviousSquare();

}





boolean moreThanOnePieceMoving(){
 return pieces.stream().filter(p -> p.moving == true).count() > 1; 
}

 long numberOfPiecesMoving(){
 return pieces.stream().filter(p -> p.moving == true).count();  
}

Piece getMovingPiece(){
  return pieces.stream().filter(p -> p.moving == true).findFirst().orElse(null);  
  
}

Square getSquareUnderMouse(){
 return squares.stream().filter(s -> s.isClicked() == true).findFirst().orElse(null);   
}

List<Integer> getSquareswithBlackPieces(){
  
 return squares.stream()
         .filter(s -> s.piece != null && s.piece.isblackPiece)
           .map(Square::getSquareIndex)
             .collect(Collectors.toList()); 
}

List<Integer> getSquareswithWhitePieces(){
  
 return squares.stream()
         .filter(s -> s.piece != null && !s.piece.isblackPiece)
           .map(Square::getSquareIndex)
             .collect(Collectors.toList()); 
}

void removeOccupiedSquares(Piece p){
   moveIndexesToRemove.clear(); 
  if(p.isblackPiece){
    for(int i: getSquareswithBlackPieces()){
      moveIndexesToRemove.add(i); 
    }
  }
  
  else if(! p.isblackPiece){
    for(int i: getSquareswithWhitePieces()){
      moveIndexesToRemove.add(i);
  }
  
}

}
boolean isLegalMove(Piece p, Square s){
  // Square does not have piece of same color on it.
  removeOccupiedSquares(p); 
  return false; 
  // Capturing Square has enemy piece on it. 
  
  
}

}










   
   
 
 
 

   
  
   


 
 
  
