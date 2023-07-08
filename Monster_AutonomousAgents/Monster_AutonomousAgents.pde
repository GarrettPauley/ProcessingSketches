
World world; 
Target target; 
int wins = 0; 
int targets = 3; 
void setup(){
  //size(640,480); 
  textSize(30);
  fullScreen(); 

  world = new World(10,200); 
  target = new Target(random(width), random(height)); 
  
} 


void draw(){
 
  background(255); 
  
  target.display();
  
   world.run();
   
   if(target.clicked()){
    wins++; 
    target.x = random(width); 
    target.y = random(height); 
   }
   
   if(!world.gameActive){
      noLoop(); 
    textSize(30); 
    fill(255,0,0); 
    text("You Lost!", width/2, height/2); 
   }
   fill(255,0,0); 
   text("Targets Remaining: " + (targets - wins) , 30, 40);
     
     
   if(wins == targets){
     noLoop(); 
    textSize(30); 
    fill(0,255,0); 
    text("You Won!", width/2, height/2); 
   }
   
   
  

}
