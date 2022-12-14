class FlowField{
 PVector[][] field; 
 int cols, rows; 
 int resolution; // we don't need a vector per pixel. 

 
 FlowField(){
  resolution = 20; 
  cols = width/resolution; 
  rows = height/resolution; 
  field = new PVector[cols][rows]; 
  init();
  
  
 }
 
 void init(){
   
  float xoff = 0;
  for(int i = 0; i < cols; i++){
   float yoff = random(0,1); 
   for(int j = 0; j < rows; j++){
    float theta = map(noise(xoff,yoff), 0, 1, 0, TWO_PI); // perlin noise vector field; 
    field[i][j] = new PVector(cos(theta), sin(theta));
    
     yoff +=0.1;
   }
   xoff += 0.1;
  } 
 }
 
 void display(){
  for(int i = 0; i < cols; i++){
   for(int j = 0; j < rows; j++){
    drawVector(field[i][j], i * resolution, j*resolution, resolution - 2);  
   }
  }
 }
 
 void drawVector(PVector v, float x, float y, float scale){
  pushMatrix(); 
  translate(x,y);
  strokeWeight(1);
  stroke(255,0,0); 
  rotate(v.heading()); 
  float len = v.mag() * scale; 
  line(0,0, len, 0); 
  line(len,0,len-2, 1); 
  line(len,0, len-2, -1);
  
  popMatrix();
 }
 
 PVector lookup(PVector lookup){
  int column = int(constrain(lookup.x/resolution, 0, cols-1));
  int row = int(constrain(lookup.y/resolution, 0, rows-1)); 
  
  return field[column][row];
 }

 
 
  
}
