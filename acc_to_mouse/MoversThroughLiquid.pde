/* 

PVector position; 
PVector velocity; 
PVector acceleration; 

Liquid liquid; 
Mover[] movers = new Mover[20]; 
float DRAG_FORCE = 0.02; 




void setup() { 
  size(640,480); 
  for(int i = 0; i < movers.length; i++){ 
   movers[i] = new Mover(random(0.1,4), random(0, width),20);  
    
  }
   
  liquid = new Liquid(0,height/2, width, height/2, DRAG_FORCE);  
  
  
} 


void draw(){ 
  background(255);
  liquid.display(); 
  for (int i = 0; i < movers.length; i++){ 
     if (movers[i].isInsideLiquid(liquid)){ 
      movers[i].drag(liquid);  
       }
     float m = 0.1 * movers[i].mass;
     PVector gravity = new PVector(0,m);
     movers[i].applyForce(gravity); 
     movers[i].update(); 
     movers[i].display(); 
     movers[i].checkEdges(); 
 
  
  }
  
  
  
}
  
  */
  
  

  




   
   
 
