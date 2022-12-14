Mover[] movers = new Mover[50]; 
Attractor a; 

void setup(){ 
  size(640,480); 
  for(int i = 0; i < movers.length; i++){ 
   movers[i] = new Mover(random(0.5,1), random(width), random(height)); 
  }
  a = new Attractor(); 
} 


void draw(){ 
  background(255); 
  a.display(); 
  
  for(int i = 0; i < movers.length; i++) { 
   PVector force = a.attract(movers[i]); 
   movers[i].applyForce(force);
   movers[i].update();
   movers[i].checkEdges(); 
   movers[i].display();
     
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
  
  
