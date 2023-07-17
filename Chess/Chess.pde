import java.util.*;
 SoundFile sf_capture;
 SoundFile sf_move; 
 SoundFile sf_error; 

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
 sf_error = new SoundFile(this, "Resources/public_sound_standard_Error.mp3");
 
 
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
   textSize(30); 
   text("Moves: " +  game.movedPieces.size(), 20,20); 
   text("Captured Pieces: " +  game.board.capturedPieces.size(), 20,40);
   text("Squares attacked by white: " +  game.squaresUnderAttackByWhite.size(), 20,60);
   text("king in check: " +  game.kingInCheck, 20,80);
   text("White's Turn: " + game.whiteToMove, 20,100);
    
   
  
  }
}








  
