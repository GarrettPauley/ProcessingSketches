// gaussian painting 
import java.util.Random;

Random gen; 
void setup (){ 
  size(640,480); 
  background(255); 
  gen = new Random(); 
}

void draw(){ 
  
  float xrand = (float) gen.nextGaussian(); 
  float yrand = (float) gen.nextGaussian(); 
  
    int r = (int) gen.nextGaussian() * 255; 
    int g = (int) gen.nextGaussian()* 255; 
    int b = (int) gen.nextGaussian()* 255; 
    
      
   
 
  float sd = 100; 
  float mean = 320;
  
  float x = (xrand * sd) + mean; 
  float y = (yrand * sd) + mean; 
  
  x = constrain(x, 0, width - 10);
  y = constrain(y, 0, height - 10);
  
  noStroke(); 
  fill(r,g,b);
  ellipse(x,y,20,20);
  
  
} 
