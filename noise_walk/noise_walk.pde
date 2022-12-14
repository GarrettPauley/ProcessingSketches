// Perlin Noise walker. 

float t = 0; 
void setup(){ 
  size(640, 480); 
  background(255); 
  
} 


void draw(){
  stroke(0); 
  fill(175); 
  
  float n = noise(t);
  float n2 = noise(t+100); 
  float x = map(n,0,1,0,width); 
  float y = map(n2,0,1,0,height); 
  ellipse(x, y, 20,20); 
  
  
  
  t += 0.01;
  
} 
