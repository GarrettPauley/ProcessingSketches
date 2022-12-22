
float angle; 
float len; 
void setup(){
size(800,640);
angle = 20; 
len = 50; 
frameRate(30);
}
 

void draw(){ 
  strokeWeight(2); 
  background(255); 
  fill(0); 
   
  textSize(35); 
  translate(width/2, height); 
  //float angle = map(mouseX, 0, width, 0, 360); // control the angle with the mouse. 
  //text(round(angle), 0, - height + 40); 
  //angle += 0.1; 
  //len += 0.5; 
  
  
  
  branch(150, 30); 
  

  
  
} 

void branch(float len, float angle){
   //strokeWeight(weight);
   line(0,0,0 ,-len); 
   translate(0,-len); // move to the end of the line 
   
   len*= 0.60; //reduce the length of the next branches
   //weight *= 0.60;
   
   if (len > 2){ 
   pushMatrix(); 
   rotate(radians(angle)); 
   branch(len, angle); 
   popMatrix();
   
   pushMatrix(); 
   rotate(radians(-angle)); 
   branch(len, angle);
   popMatrix(); 
   
     pushMatrix(); 
   rotate(radians(2 * angle)); 
   branch(len, angle); 
   popMatrix(); 
   
   pushMatrix(); 
   rotate(radians(- 2 * angle)); 
   branch(len, angle);
   popMatrix(); 
   
   }
} 
