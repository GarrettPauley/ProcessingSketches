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

//void mouseReleased(){
 //game.movingPiece = false;  
//}


/*
void mouseReleased(){
print("mouse Released Called \n");

game.placePieceAfterMovement(); 


}
*/

void mouseClicked(){
if(!game.movingPiece){
game.checkForMovingPieces();
}
else if (game.movingPiece){
 game.placePieceAfterMovement();
}
}







/*
Some guessing game logic


   if(s.isClicked() && guessed == false){
     guessed = true; 
     total += 1;
     if(s.name == correctAnswer.name){
      correctAnswers += 1;
      
     }
     
     updateScore();
     needAnotherRandomSquare = true;
     getRandomSquare();
     guessed = true;
   }
   
   
   
     
void getRandomSquare(){
  
 if(gameIsActive && needAnotherRandomSquare == true){
   
      
      int randomSquare = int(random(board.squares.size())); 
      Square square = board.squares.get(randomSquare);  
      correctAnswer = square;
      displayRandomSquare(square); 
      needAnotherRandomSquare = false;
       
   }

}
void displayRandomSquare(Square s){
 
 pushMatrix(); 
 translate(width/2, height - 20); 
 textSize(50); 
 textAlign(CENTER);
 fill(0); 
 text(s.name, 0,0); 
 popMatrix(); 
}

void updateScore(){
 pushMatrix(); 
 background(255);
 translate(width/16, height - 10); 
 textSize(20); 
 textAlign(CENTER);
 fill(0); 
 String runningScore = String.format("%d out of  %d", correctAnswers, total);
 text(runningScore, 0,0);
 
 popMatrix(); 
}


*/








  
