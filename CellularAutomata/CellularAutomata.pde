CA ca; 

void setup(){ 
  size(600,400);
   int[] ruleset = {0,1,0,1,1,0,1,0};
  ca = new CA(ruleset); 
  ca.printRuleSet();
    

} 

void draw(){ 
  
    ca.display(); 
    ca.generate();
    

    
    if(ca.finished()){
      ca.saveImage();
     ca.restart();
     ca.randomize();
     ca.printRuleSet();
     ca.saveImage();
    }
    
  

  
}
