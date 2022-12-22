class KochLine { 
  // Swedish Mathematician Helge von Koch. 
  PVector start; 
  PVector end; 
  
  
  KochLine(PVector start_, PVector end_){ 
   start = start_.copy(); 
   end = end_.copy(); 
  
    
  }
  
  PVector kochA(){ 
   return start.copy();  
  }
  
  PVector kochB(){
    PVector v = PVector.sub(end, start); //length from start to end. 
    v.div(3); 
    v.add(start);
    return v; // length is one third of the distance from start to end. 
    
  }
  
  PVector kochC(int angle){
   PVector a = start.copy(); 
   PVector v = PVector.sub(end, start); 
   v.div(3); 
   a.add(v);   // this puts at at the same point as b. 
   
   v.rotate(radians(angle)); 
   a.add(v); 
  
   return a; 
    
  }
  
  
    PVector kochD(){
    PVector v = PVector.sub(end, start); //length from start to end. 
    v.mult(2/3.0); 
    v.add(start);
    return v; // length is two thirds of the distance from start to end. 
    
  }
  
  
  
  
  
  PVector kochE(){
   return end.copy();  
  }
  
  
  void display(){
   stroke(0); 
   line(start.x, start.y, end.x, end.y); 
   
  }
  
  
} 
