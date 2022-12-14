/*
Mover[] movers = new Mover[10]; 
Attractor a; 
Repel r; 

void setup(){ 
  size(640,480); 
  for(int i = 0; i < movers.length; i++){ 
   movers[i] = new Mover(random(0.5,1), random(width), random(height)); 
  }
  a = new Attractor(); 
  r = new Repel(); 
  
} 


void draw(){ 
  //background(255);
  a.display(); 
  
  for(int i = 0; i < movers.length; i++) { 
   PVector force = a.attract(movers[i]); 
   movers[i].applyForce(force);
   movers[i].aAcceleration = movers[i].acceleration.x; 
   movers[i].checkEdges(); 
   movers[i].update();
   movers[i].display();
  
   if(mousePressed){ 
     PVector repel = r.repel(movers[i]); 
     movers[i].applyForce(repel); 
     movers[i].checkEdges(); 
     movers[i].update(); 
     movers[i].display();
   }
     
  }
 
    
  for(int i=0; i < movers.length; i++){ 
     for( int j=0; j < movers.length; j++){
      if(i != j){
      PVector force = a.attract(movers[i]); 
      movers[i].applyForce(force); 
        }
     }
     
  }
  
  
}
  
 */
  
