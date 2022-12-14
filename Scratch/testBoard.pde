import java.util.*;

boolean gameIsActive;
boolean needAnotherRandomSquare = true; 
boolean guessed = false; 
ChessBoard board; 
Square correctAnswer; 

int correctAnswers, total; 




// get a random square 
// display on the screen until user selects a square. 

//if the user clicks on a square, that is the user's guess. set guessed == true and 


void setup(){
 size(720, 720);
 correctAnswers = 0;
 total = 0; 

 board = new ChessBoard();
 board.createBoard(1);
 play();
 

 
  
}

void play(){
  gameIsActive = true; 
  
}



void draw(){ 
  
  getRandomSquare();
  for(Square s: board.squares){
   s.display();
   
  
   
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
   
  }
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











  
