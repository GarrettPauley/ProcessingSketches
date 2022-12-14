Walker w; 
void setup(){ 
  size(1000,1000);
  background(255);
    w = new Walker();  
   
}

void draw(){ 
  w.step(); 
  w.render(); 
}
