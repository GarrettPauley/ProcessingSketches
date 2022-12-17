
class CA {

  int[] cells;     // An array of 0s and 1s 
  int generation;  // How many generations?

  int[] ruleset;     // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}

  int cellWidth = 5;
  String currentRuleset; 

  CA(int[] r) {
    ruleset = r;
    cells = new int[width/cellWidth];
    restart();
  }

  // Make a random ruleset
  void randomize() {

    for (int i = 0; i < 8; i++) {
      int nextBit = int(random(2)); 
      ruleset[i] = nextBit; 
      
    }  
  }
  
  void printRuleSet(){
   String ruleBitString = "" ;
   for(int i = 0; i < ruleset.length; i++){
    ruleBitString += ruleset[i];  
   }
   int rule = Integer.parseInt(ruleBitString,2);
   print("Visualizing " + ruleBitString + " " + rule + '\n');
   
  }

  // Reset to generation 0
  void restart() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;   
    generation = 0;
  }

 void saveImage(){
   String ruleBitString = "" ;
   for(int i = 0; i < ruleset.length; i++){
    ruleBitString += ruleset[i];  
   }
   int rule = Integer.parseInt(ruleBitString,2);
   
  String fileName =  rule + "_image.jpeg"; 
  save(fileName);

   
 }


  
  
  void generate(){
   int[] newCells = new int[cells.length]; 
      for(int i = 1; i < cells.length - 1; i++){
       int left = cells[i-1]; 
       int middle = cells[i]; 
       int right = cells[i+1]; 
       
       newCells[i] = rules(left, middle, right); 
       
      }
      cells = newCells; 
      generation++; 
     
  }

 
  
  
void display() {
    
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else               fill(255);
      noStroke();
      rect(i*cellWidth, generation*cellWidth, cellWidth, cellWidth);
    }
  }
  

 
  int rules (int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) return ruleset[0];
    if (a == 1 && b == 1 && c == 0) return ruleset[1];
    if (a == 1 && b == 0 && c == 1) return ruleset[2];
    if (a == 1 && b == 0 && c == 0) return ruleset[3];
    if (a == 0 && b == 1 && c == 1) return ruleset[4];
    if (a == 0 && b == 1 && c == 0) return ruleset[5];
    if (a == 0 && b == 0 && c == 1) return ruleset[6];
    if (a == 0 && b == 0 && c == 0) return ruleset[7];
    return 0;
  }

  // The CA is done if it reaches the bottom of the screen
  boolean finished() {
    if (generation > height/cellWidth) {
      return true;
    } 
    else {
      return false;
    }
  }
}
