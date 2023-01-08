
class ChessBoard{
 int sizeX = 720; 
int sizeY = 720; 
int scale = sizeX/9;
int cols, rows; 
ArrayList<Square> squares = new ArrayList();
color lightSquareColor = color(204,183,174); 
color darkSquareColor = color(112,102,119);

ChessBoard(int mode){
  createBoard(mode); 
}

 
  

void createBoard(int mode){ 
  
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


Square findSquareByName(String name){
  return squares.stream().filter(s -> s.name.equals(name)).findFirst().orElse(null); 
}

Square getSquareByIndex(int index){
  return squares.get(index); 
}



void setPieceOnSquare(Piece p, Square s){
 s.piece = p;  
}




    



 //<>//



}
