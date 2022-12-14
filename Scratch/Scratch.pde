/*
Mover mover; 
ArrayList<Mover> movers; 
void setup(){ 
  size(640, 480); 
  mover = new Mover(); 
  movers = new ArrayList(); 
  for(int i = 0; i < 10; i++){ 
   movers.add(new Mover());  
  }
  
} 



void draw(){ 
  background(255); 
 

    for(Mover mover : movers){ 
    PVector mouse = new PVector(mouseX, mouseY); 
    PVector force = PVector.sub(mouse, mover.position);
    line(mover.position.x, mover.position.y, mouseX, mouseY); 
    mover.applyForce(force); 
    mover.display(); 
    mover.update(); 
  }
  
  
  
} 
*/
