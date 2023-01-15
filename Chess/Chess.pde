import java.util.*;


Game game; 

void setup(){
 size(720, 720);
 //imageMode(CENTER); 
 game = new Game(); 
 


}


void draw(){ 
  background(255); 
  
game.run(); 

}


void mouseClicked(){
if(!game.movingPiece){
game.checkForMovingPieces();

}
else if (game.movingPiece){
 game.placePieceAfterMovement();
}
}











  
