
/*
float startAngle = 0; 
float angleVel = 0.2;
void setup(){ 
  size(2400, 720);
 
  
  
} 

void draw(){ 
   background(255);
   startAngle += 0.015; 
   float angle = startAngle; 
   
  

  for(int x = 0; x <= width; x += 15){  // Every 24 pixels
    pushMatrix(); 
    float y = map(cos(angle), -1,1, 0,height);     // map the output of sine to some value between 0 and height. 
     fill(255, 0, 0 ); 
     ellipse(x,y, 70,70); 
    popMatrix();  
    
    pushMatrix(); 
    float y2 = map(sin(angle), -1,1, 0,height);     // map the output of sine to some value between 0 and height. 
     fill(0, 0, 255 ); 
     ellipse(x,y2, 70,70); 
    popMatrix();
     
     angle += angleVel;
    
  }
  
  
}



*/
