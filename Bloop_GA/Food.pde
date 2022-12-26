class Food{ 
 float size; 
 float calories; 
 PVector position; 
 
 Food(float size_, float c, PVector position_){
  size = size_; 
  calories = c; 
  position = position_; 
 }
 
  Food(){
  size = 5; 
  calories = 5; 
  position = new PVector(random(width), random(height)); 
 }
 
 
 
void display(){
  fill(175);
  stroke(0); 
  rectMode(CENTER); 
  rect(position.x, position.y, size, size); 
   
 }
  
  
  
}
