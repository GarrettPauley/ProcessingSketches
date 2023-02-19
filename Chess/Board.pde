
class ChessBoard{
 int sizeX = 720; 
int sizeY = 720; 
int scale = sizeX/9;
int cols, rows; 
ArrayList<Square> squares;
ArrayList<Piece> pieces;
ArrayList<Piece> capturedPieces; 
color lightSquareColor = color(204,183,174); 
color darkSquareColor = color(112,102,119);

ChessBoard(int mode){
  createBoard(mode);
  initPieces();

}

 
  

void createBoard(int mode){ 
  squares =  new ArrayList();
  int index = 0; 
  List<String> ranks = Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8");
  List<String> files = Arrays.asList("A", "B", "C", "D", "E", "F", "G", "H"); 
  List<String> lightSquares = Arrays.asList("B1", "D1", "F1", "H1", 
                                          "A2", "C2", "E2", "G2",
                                          "B3", "D3", "F3", "H3",
                                          "A4", "C4", "E4", "G4",
                                          "B5", "D5", "F5", "H5", 
                                          "A6", "C6", "E6", "G6",
                                          "B7", "D7", "F7", "H7",
                                          "A8", "C8", "E8", "G8"
                                          ); 
    if(mode == 1){ //view from the perspective of the black pieces. 
      Collections.reverse(files);
        for(int i = ranks.size()-1; i >= 0; i--){
       for(int j = files.size()-1; j >=0;  j--){ 
         
          int x = (i * scale) + width/16; 
          int y = (j * scale) + height/64; 
          
          String squareName = files.get(i) + ranks.get(j) ; 
          
          //print("Adding " + squareName + " at i = " + i + " and j = " + j  + '\n');
          if(lightSquares.contains(squareName)){
           
            squares.add(new Square(x,y, scale, scale, squareName, lightSquareColor, index)); 
          }
          else{
            
            squares.add(new Square(x,y, scale, scale, squareName, darkSquareColor, index)); 
          }
          //print("Adding " + squareName + " at i = " + i + " and j = " + j + "Index = " + index  + '\n' );
          index++; 
       }
   
    }
      
    }
    
    else if (mode == 0) { //view from the perspective of the white pieces. 
      Collections.reverse(ranks); 
      index = 0; 
    for(int i = 0; i <ranks.size(); i++){
       for(int j = 0; j < files.size(); j++){ 
         
          int x = (i * scale) + width/16; 
          int y = (j * scale) + height/64; 
          
          String squareName = files.get(i) + ranks.get(j) ; 
          
          print("Adding " + squareName + " at i = " + i + " and j = " + j  + '\n');
          if(lightSquares.contains(squareName)){
           
            squares.add(new Square(x,y, scale, scale, squareName, lightSquareColor, index)); 
          }
          else{
            
            squares.add(new Square(x,y, scale, scale, squareName, darkSquareColor, index)); 
          }
          
       }
       index ++; 
   
    }
    }
    
    
}




 
 void initPieces(){
   pieces = new ArrayList<Piece>();
   capturedPieces = new ArrayList<Piece>(); 
   
   pieces.add( new Pawn("Resources/white_pawn.png", findSquareByName("A2"),this));
   
  
   pieces.add(new Pawn("Resources/white_pawn.png", findSquareByName("B2"),this));  
   pieces.add(new Pawn("Resources/white_pawn.png", findSquareByName("C2"),this)); 
   pieces.add(new Pawn("Resources/white_pawn.png", findSquareByName("D2"),this)); 
   pieces.add(new Pawn("Resources/white_pawn.png", findSquareByName("E2"),this)); 
   pieces.add(new Pawn("Resources/white_pawn.png", findSquareByName("F2"),this));
   pieces.add(new Pawn("Resources/white_pawn.png", findSquareByName("G2"),this)); 
   pieces.add(new Pawn("Resources/white_pawn.png", findSquareByName("H2"),this)); 
  
   pieces.add( new Pawn("Resources/black_pawn.png", findSquareByName("A7"),this));
   pieces.add(new Pawn("Resources/black_pawn.png", findSquareByName("B7"),this));  
   pieces.add(new Pawn("Resources/black_pawn.png", findSquareByName("C7"),this)); 
   pieces.add(new Pawn("Resources/black_pawn.png", findSquareByName("D7"),this)); 
   pieces.add(new Pawn("Resources/black_pawn.png", findSquareByName("E7"),this)); 
   pieces.add(new Pawn("Resources/black_pawn.png", findSquareByName("F7"),this));
   pieces.add(new Pawn("Resources/black_pawn.png", findSquareByName("G7"),this)); 
   pieces.add(new Pawn("Resources/black_pawn.png", findSquareByName("H7"),this)); 
   
  
   //White rooks
   pieces.add(new Rook("Resources/white_rook.png", findSquareByName("A1"),this)); 
   pieces.add(new Rook("Resources/white_rook.png", findSquareByName("H1"),this)); 
   //Black rooks
   pieces.add(new Rook("Resources/black_rook.png", findSquareByName("A8"),this)); 
   pieces.add(new Rook("Resources/black_rook.png", findSquareByName("H8"),this)); 
   //White Rook
   pieces.add(new Knight("Resources/white_knight.png", findSquareByName("B1"),this)); 
   pieces.add(new Knight("Resources/white_knight.png", findSquareByName("G1"),this)); 
   
   //Black knights
   pieces.add(new Knight("Resources/black_knight.png", findSquareByName("B8"),this)); 
   pieces.add(new Knight("Resources/black_knight.png", findSquareByName("G8"),this)); 
   
   
    //White Bishops
   pieces.add(new Bishop("Resources/white_bishop.png", findSquareByName("C1"),this)); 
   pieces.add(new Bishop("Resources/white_bishop.png", findSquareByName("F1"),this)); 
   
   //Black Bishops
   pieces.add(new Bishop("Resources/black_bishop.png", findSquareByName("C8"),this)); 
   pieces.add(new Bishop("Resources/black_bishop.png", findSquareByName("F8"),this)); 
   
   // White Queen and King 
   pieces.add(new Queen("Resources/white_queen.png", findSquareByName("D1"),this)); 
   pieces.add(new King("Resources/white_king.png", findSquareByName("E1"),this)); 
   // Black Queen and King 
   pieces.add(new Queen("Resources/black_queen.png", findSquareByName("D8"),this)); 
   pieces.add(new King("Resources/black_king.png", findSquareByName("E8"),this)); 
   
  
// Add Pieces to starting squares
for(Piece p_: pieces){
 Square s = findSquareByName(p_.currentSquare.name);  
 s.piece = p_; 
}
   }


Square findSquareByName(String name){
  return squares.stream().filter(s -> s.name.equals(name)).findFirst().orElse(null); 
}

Square getSquareByIndex(int index){
  
  return squares.get(index); 
}



void setPieceOnSquare(Piece p, Square s){
 s.piece = p;  
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




    



 //<>// //<>//



}
