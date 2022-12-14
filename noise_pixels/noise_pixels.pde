

float seed = 0.0; 

void setup(){
 size(640,480);
 createStatic(0.01); 
 
 
}

void createStatic(float seed) {

loadPixels(); 
float xoff = 0.0; 
for(int x=0; x < width; x++) {
  float yoff = 0.0; 
  for(int y=0; y < height; y++){ 
    //float bright = random(255); //random brightness
    float bright = map(noise(xoff, yoff), 0,1, 0,255); 
    
    pixels[x+y*width] = color(bright); 
    yoff += seed;
  }
  
  xoff += seed;
  
}
updatePixels(); 

 

}

void anotherStaticFunction(){ 
 loadPixels(); 
 for(int x = 0; x < pixels.length; x++){ 
  float bright = random(255); 
  pixels[x] = color(bright); 
 }
  
  updatePixels(); 
}


void draw(){
  
   seed += 0.0001; 
  createStatic(seed); 

  
  
 
}

  

  
  




 
