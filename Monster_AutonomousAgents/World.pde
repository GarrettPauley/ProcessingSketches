

class World{ 
  ArrayList<Agent> agents; 
  ArrayList<Monster> monsters; 
  boolean gameActive = true; 
  PVector middle = new PVector (width/2, height/2); 
  
  World(int num_agents, int num_monsters){
    agents = new ArrayList<Agent>(); 
   monsters = new ArrayList<Monster>(); 
   for(int i = 0; i < num_monsters; i++){
     PVector randPos = new PVector(random(width - 10), random(height - 10)); 
     monsters.add(new Monster(randPos)); 
   }
   
   for(int i = 0; i < num_agents; i++){
     PVector randPos = new PVector(random(width - 10), random(height - 10)); 
     agents.add(new Agent(randPos)); 
   }
   
   getWanderingSpace();
    
  }
  
  void getWanderingSpace(){
     for(Monster m: monsters){
     m.locations = m.wanderingSpace(m); 
   }
  }
  
  void run(){
    
    for(Monster m: monsters){
     m.wander(m.locations); 
     //m.checkEdges(); 
     checkCollision();
     m.update(); 
     m.display(); 
   }
   
    for(Agent a: agents){
     
     a.avoid(monsters);  
     a.checkEdges();
     a.update(); 
     a.display(); 
   }
   
   
  
  }
  
  void checkCollision(){
      for(Monster m: monsters){
        if((mouseX > m.position.x && mouseX < (m.position.x + m.w)) && 
            (mouseY > m.position.y && mouseY < (m.position.y + m.h))){
             gameActive = false; 
            }
          
   }
  
  
  
  
  }
  
}
