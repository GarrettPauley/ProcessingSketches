


class World{
  ArrayList<Bloopy> bloops; 
  ArrayList<Food> food; 
  
  World(int num){ 
    bloops = new ArrayList<Bloopy>(); 
    food = new ArrayList<Food>(); 
    
    for(int i = 0; i < num; i++){
      //Add food at random location
     
     food.add(new Food()); 
     
     //Add Bloop at random location
     DNA dna = new DNA();
     PVector randomBloopLoc = new PVector(random(width), random(height));
     bloops.add(new Bloopy(randomBloopLoc, dna)); 
    }
  
  }
  
  void run(){
   displayFood(); 
   
   Iterator<Bloopy> it = bloops.iterator(); 
   while(it.hasNext()){
    Bloopy b = it.next();
    
    b.run(); 
    b.eat(food); 
    
    if(b.dead()){
      // remove the bloop and add food in it's place
     it.remove(); 
     food.add(new Food(5,5, b.position)); 
    }
    
    Bloop child = b.reproduce();
    if(child != null) bloops.add(child);
   }
    
  }
  
  
  
  void displayFood(){
   Iterator<Food> it = food.iterator();
    while(it.hasNext()){
      Food f = it.next(); 
      f.display(); 
    if(bloopy.touchingFood(f)){
      bloopy.health += f.calories; 
      it.remove();
    }
    
  }
}

}
  
  
  
  
  
  

   
