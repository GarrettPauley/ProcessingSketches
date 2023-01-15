class Rook extends Piece{
  
   Rook(String imagePath, Square s, ChessBoard b){
     super(imagePath, s, b); 
     
  }
  
  @Override
  void move(Square s){
    if(this.moving){
     text("Clicked on " + this.currentSquare.name, width/2, height/2) ;
    }
  }
  
    ArrayList<Integer> legalMoves(){
    return null;
    
  }
  
}
