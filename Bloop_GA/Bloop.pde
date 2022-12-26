class Bloopy { 
 float r; 
 PVector position;
 DNA dna; 
 float health; 
 float maxspeed;
 float xoff, yoff; 

 
 Bloopy(PVector pos, DNA dna_){
   position = pos; 
    xoff = random(1000);
    yoff = random(1000);
   health = 100; 
   dna = dna_; 
   maxspeed = map(dna.genes[0], 0,1, 15, 0); // speed and size are inherited from DNA
   r        = map(dna.genes[0], 0, 1, 0,50); //
 }
 
 


 
 void eat(Food food){
  float touchingDistance = r; 
  if( dist(position.x, position.y, food.position.x, food.position.y) <= touchingDistance){
    health += food.calories; 
  }
  
 }
 


 Bloopy reproduce(){
  if(random(1) < 0.01){
   // Make a baby bloop
   // Bloops reproduce asexually, so we will just copy the parent DNA. 
   DNA childDNA = dna.copy();
   childDNA.mutate(0.01); 
   return new Bloopy(position, childDNA); 
   
  }
  else{
   return null;  
  }
 }
 
 

 void run(){
  update(); 
  checkEdges(); 
  display(); 
 }
 
 void update(){
  //movement based on perlin noise. 
  float vx = map(noise(xoff), 0,1, -maxspeed, maxspeed);  //<>//
  float vy = map(noise(yoff), 0, 1, -maxspeed, maxspeed); 
  
  PVector velocity = new PVector(vx, vy); 
  position.add(velocity); 
  health -= 0.2; 
  
 }
 
  void checkEdges() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }
   
   
  void display(){
   stroke(0,health);
  fill(0,health);
  ellipse(position.x, position.y, r * 2, r * 2); 
   
 }
   boolean dead(){
  return health <= 0;  
 }
 
 }
  
