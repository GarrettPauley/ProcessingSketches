class Game{
 ArrayList<Piece> pieces; 
 ArrayList<Square> squares; 
 ChessBoard board; 

 
 Game(){ 
   board = new ChessBoard(1);
   squares = board.squares; 
  
   initPieces(); 
   
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
   
  

for(Piece p_: pieces){
 Square s = board.findSquareByName(p_.startingSquare.name);  
 s.piece = p_; 
}
   }
   
  
  
 void run(){
   
  
    for(Square s: board.squares){
         s.display();
         debugMessages();
         /*
         
         *Got close with this. 
         
         
         
         if(s.isClicked() && s.piece != null){
         text(s.piece.location + " " + s.piece.startingSquare.name + '\n', width/2, height - 10);
         s.piece.moving = true; 
         
         }
         else if (s.piece != null){
          
           //s.piece.moving = false; 
           //s.piece.movetoPreviousSquare(); 
          }
          */
    }
    
           
         
      
      
     for( Piece p: pieces){
      
      p.display();
      if(p.moving){
          p.x = mouseX - p.h / 2; 
          p.y = mouseY - p.h / 2;
      }
    
     
     
     }
      
     
   
 }
  // feeble attempt at fixing the bug that keeps moving all the pieces.  
  void mouseDragged(){
      Square s = getSquareUnderMouse();
      if(s != null && s.piece != null){
      s.piece.moving = true; 
      
    }
    }
 
 
void debugMessages(){
  for(Square s: board.squares){
         s.display();
         s.displaySquareIndex(); 
         s.displaySquareName(); 
          
      }
}

void pieceMoving(){
  
   for( Piece p: pieces){
       p.x = p.startingSquare.x;
       p.y = p.startingSquare.y; 
       p.moving = false; 
  }

}



 void piececlicked(Piece p){
    if(p.clicked()){
      p.moving = true; 
      //stopOtherPiecesFromMoving(p); 
      
      p.x = mouseX - p.h / 2; 
      p.y = mouseY - p.h / 2;
      
      }
      
      else {
       
     //Square s = getSquareUnderMouse(); 
     //p.moveToSquare(s);  
     //p.movetoPreviousSquare(); 
     
    }
      }
      
      
    
      


      
      
    
    
 

 
 
 
 
 void stopOtherPiecesFromMoving(Piece p){
  for(Piece p2: pieces){
    if(p2 == p){
     p.moving = true;  
    }
    else{
     p.moving = false;  
    }
  }
 }

Piece anyPiecesMoving(){
 return pieces.stream().filter(p -> p.moving == true).findFirst().orElse(null);  
}

 long numberOfPiecesMoving(){
 return pieces.stream().filter(p -> p.moving == true).count();  
}

Square getSquareUnderMouse(){
 return squares.stream().filter(s -> s.isClicked() == true).findFirst().orElse(null);   
}



}





   
   
 
 
 

   
  
   


 
 
  
