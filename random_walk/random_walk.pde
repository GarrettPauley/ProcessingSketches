class Walker {
  PVector pos; 
 

  Walker() {
    pos = new PVector(width/2, height/2); 
  }

  void render() {
    int c = int(random(255));
    stroke(0);
    fill(c);
    rectMode(CENTER);
    circle(pos.x,pos.y,80);
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    
     PVector vel = new PVector(random(-7,7), random(-7,7)); 
     pos.add(vel);
     
    //stay on the screen.  
    pos.x = constrain(pos.x,0,width-1);
    pos.y = constrain(pos.y,0,height-1);
  


  
  
  }
}
