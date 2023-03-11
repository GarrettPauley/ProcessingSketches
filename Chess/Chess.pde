import java.util.*;

int ADJACENT = 8; 
int DIAGONAL_LEFT = 9; 
int DIAGONAL_RIGHT = 7; 
int ABOVE_BELOW = 1; 

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

void mouseReleased(){
    game.toDraw.clear();
  }











  
