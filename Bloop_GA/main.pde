

World world; 


void setup(){
  size(640,480); 
  textSize(20); 
  world = new World(); 
  world.run(); 
}


void draw(){
  background(255);
 
  text("HP: " + bloopy.health, 40,40); 
  
  
  
}
