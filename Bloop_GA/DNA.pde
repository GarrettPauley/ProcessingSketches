class DNA { 
 float[] genes; 
 
 DNA(){
  genes = new float[1]; 
  for(int i = 0; i < genes.length; i++){
   genes[i] = random(0,1);  
  }
 }
 
 DNA(float[] genes_){
  genes = genes_;  
  }
 
 
 
 
 DNA copy(){
  float[] newGenes = new float[genes.length]; 
  arrayCopy(genes,newGenes); // copy the contents of the genes array to the newGenes array; 
  return new DNA(newGenes); 
 }
  
  
 void mutate(float rate){
  if(random(1) < rate){
     for(int i = 0; i < genes.length; i++){
      genes[i] = random(1);  
     }
  }
 }
 
}
