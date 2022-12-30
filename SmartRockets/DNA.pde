class DNA { 
 PVector[] genes; 
 float fitness; 
 float maxForce  =0.1; 
 

 
 DNA(){
   genes = new PVector[size]; 
  for(int i = 0; i < genes.length; i++){
   genes[i] = PVector.random2D();
   genes[i].mult(random(0, maxForce)); 
  }
 }
 
 
 
 DNA crossover(DNA partner){
   DNA child = new DNA(genes.length); 
   
   // midpoint method - pick a random index in the gene as the midpoint. 
   
   int midpoint = int(random(genes.length)); 
   for(int i = 0; i < genes.length; i++){
      if( i < midpoint){
       child.genes[i] = genes[i];  
      }
      else{
       child.genes[i] = partner.genes[i];  
      }
   }
   
   return child; 
   
 }
 
 
 void mutate(float mutationRate){
   for(int i = 0; i < genes.length; i++){
    if(random(1) < mutationRate){
     genes[i] =  (char) random(32,128); 
    }
   }
   
 }
 
 
 String getPhrase(){
  return new String(genes);  
 }
 
 
  
}
