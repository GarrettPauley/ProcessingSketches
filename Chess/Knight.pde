class Knight extends Piece{
  
   Knight(String imagePath, Square s){
     super(imagePath, s); 
     
  }
  
  @Override
  void move(){
    if(this.moving){
     text("Clicked on " + this.currentSquare.name, width/2, height/2) ;
    }
  }
  
    ArrayList<Integer> legalMoves(){
    return null;
    
  }
}
