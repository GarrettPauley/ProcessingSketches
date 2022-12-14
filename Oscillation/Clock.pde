/*
float aVel; 
float aAcc; 
float angle; 
PVector position; 

float seconds; 
float handLength; 

void setup(){ 
  size(640, 480); 
  handLength = 300; 
  position = new PVector(0, handLength * -1); 
  angle = 0; 
  frameRate(60); 
  textSize(64); 
 
} 


void draw(){ 
  
  background(255); 
  stroke(0);
  fill(0);  
  angle += ( 1 / (frameRate)) * 6;
  seconds +=  1 / frameRate; 
  
  text(seconds, 50, 50); 
  if(seconds > 60 && seconds < 61){
     fill(255, 0,0); 
    rect(0,-150, 20, 20); 
  }
  
  display(); 
  
 
  
  
   

}


void display(){ 
   pushMatrix(); 
  translate(width/2, height/2);
  rect(0,-150, 20, 20); 
  
  rotate(radians(angle)); 
  line(0,0, position.x, position.y);
  ellipse(position.x, position.y, 20, 20); 
  popMatrix(); 
  
  //clock
  pushMatrix(); 
  noFill(); 
  strokeWeight(5);
  translate(width/2, height/2); 
  ellipse(0,0,2 * PI * handLength, 2 * PI * handLength);
  
  popMatrix(); 
  
} 

void update(){ 
 angle += aVel; 
 aVel += aAcc; 
  
}
/*
