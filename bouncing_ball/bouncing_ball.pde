
Mover m; 
void setup(){ 
  size(640,480); 
  background(255); 
  m = new Mover(); 
  
   
} 


void draw(){ 
  background(0);
  m.update(); 
  m.checkEdges(); 
  m.display(); 

  
  
  }
