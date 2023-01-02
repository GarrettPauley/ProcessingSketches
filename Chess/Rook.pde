class Rook extends Piece{
  
   Rook(String imagePath, Square s){
     super(imagePath, s); 
     
  }
  
  @Override
  void move(){
    if(this.moving){
     text("Clicked on " + this.startingSquare.name, width/2, height/2) ;
    }
  }
  
  void legalMoves(){
    
    
  }
  
}
