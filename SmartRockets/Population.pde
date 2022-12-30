class Population { 
  
  PVector target; 
  float mutationRate; 
  Rocket[] population; 
  ArrayList<Rocket> matingPool; 
  int generations; 

  
  Population( float mutationRate_, int size){
   
    mutationRate = mutationRate_; 
    population = new Rocket[size]; 
    for(int i = 0; i < population.length; i++){
      PVector position = new PVector(width/2, height + 20); 
     population[i] = new Rocket(position, new DNA(), target);  
    }
   
  }
  
  void live(){
   for(int i = 0; i < population.length; i++){
    population[i].run();  
   }
  }
  
  
  void calcFitness(){
    for(int i = 0; i < population.length; i++){
   population[i].fitness(target);  
    }
  }
  
  void naturalSelection(){
   matingPool.clear(); 
   float maxFitness = 0; 
   for(int i = 0; i < population.length; i++){
    if(population[i].fitness > maxFitness){
     maxFitness = population[i].fitness;  
    }
   }
   
   // Add genes to the mating pool based on fitness. 
   // more fit means we will add more of those genes to the pool. 
   for(int i = 0; i < population.length;  i++){
    float fitness = map(population[i].fitness, 0,maxFitness, 0,1); 
    int n = int(fitness * 100); 
    for(int j = 0; j < n; j++){
     matingPool.add(population[i]);  
    }
      
    
   }
   
  }
  
  //Create a new generation. 
  void generate(){
    for(int i = 0; i < population.length; i++){
     int a = int(random(matingPool.size()));
     int b = int(random(matingPool.size()));
     
     DNA partnerA = matingPool.get(a); 
     DNA partnerB = matingPool.get(b);
     DNA child = partnerA.crossover(partnerB); 
     child.mutate(mutationRate); 
     population[i] = child; 
     
    }
    
    generations++; 
    
  }
  
  String getBest(){
   float record = 0.0; // low record that will always be matched or beaten. 
   int index = 0; 
   for(int i = 0; i < population.length; i++){
     if(population[i].fitness > record){
        index = i; 
        record = population[i].fitness; 
     }
   }
   if(record == perfectScore){
    finished = true;  
   }
   return population[index].getPhrase(); 
   
  }
  
  boolean finished(){
   return finished;  
  }
  
  int getGenerations(){
   return generations;  
  }
  
  String allPhrases(){
   String everything = ""; 
   
   int displayLimit = min(population.length, 50); 
   
   for(int i = 0; i < displayLimit; i++){
    everything += population[i].getPhrase() + "\n";   
   }
   return everything; 
   
  }
  
  float getAverageFitness(){
   float sum = 0; 
   for(int i = 0; i < population.length; i++){
     sum += population[i].fitness; 

   }
   
   return sum / population.length ;  
  }
  
  
}
