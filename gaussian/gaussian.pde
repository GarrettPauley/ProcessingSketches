void setup () { 
 size(640, 400);
 background(255); 
}

void draw(){ 

  float xloc = randomGaussian(); 
  float sd = 100; 
  float mean = width/2;
  
  xloc = (xloc * sd);
  
  fill(0,10);
  noStroke(); 
  ellipse(xloc, height/2, 16, 16);
  
}
