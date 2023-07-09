import java.util.*;
 SoundFile sf_capture;
 SoundFile sf_move; 

int ADJACENT = 8; 
int DIAGONAL_LEFT = 9; 
int DIAGONAL_RIGHT = 7; 
int ABOVE_BELOW = 1; 

Game game; 

void setup(){
 size(720, 720);
 //imageMode(CENTER); 
 game = new Game(); 

 sf_capture = new SoundFile(this, "Resources/public_sound_standard_Capture.mp3"); 
 sf_move = new SoundFile(this, "Resources/public_sound_standard_Move.mp3");
 
 
 // second window to show game state and debugging messages. 
 SecondApplet sa = new SecondApplet(game); 
 String[] args = {"debugging"}; 
 PApplet.runSketch(args, sa); 


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


public class SecondApplet extends PApplet {
Game game; 
  public SecondApplet(Game game){ 
    this.game = game; 
  } 
  public void settings() {
    size(500,500);
  }
  public void draw() {
    background(255);
    fill(0);
   textSize(20); 
   text("Moves: " +  game.movedPieces.size(), 20,20); 
   text("Captured Pieces: " +  game.board.capturedPieces.size(), 20,40);
  text("Number of Squares attacked by White: " +  game.squaresUnderAttackByWhite.size(), 20,60);
  text("King in Check:  " +  game.isEnemyKingInCheck(), 20,80);
  }
}








  
