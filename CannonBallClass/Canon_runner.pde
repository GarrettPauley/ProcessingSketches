
/*
float angle = -PI/4; 
PVector position = new PVector(50,300); 
boolean shot = false; 
CannonBall ball; 


ArrayList<CannonBall>  cannonBalls = new ArrayList(); 

void setup(){ 
  size(640,360); 
  ball = new CannonBall(position.x, position.y, 5); 
  cannonBalls.add(ball); 
   
 
} 

void draw(){ 
  
  background(255); 
  pushMatrix(); 
  translate(position.x, position.y); 
  rotate(angle); 
  rect(0,-5,50,10); 
  popMatrix(); 
  
  if(shot){ 
   PVector gravity = new PVector(0,0.2); 
   cannonBalls.get(indexOfLastFiredCannonBall).applyForce(gravity); 
   cannonBalls.get(indexOfLastFiredCannonBall).update(); 
    
  }
  cannonBalls.get(indexOfLastFiredCannonBall).display(); 
  
  
  
}

void keyPressed(){ 
 if (keyPressed && key == ' ' ){ 
   ball = new CannonBall(position.x, position.y, 5); 
   cannonBalls.add(ball); 
   shot = true; 
   PVector force = PVector.fromAngle(angle); 
   force.mult(40); 
   cannonBalls.get(indexOfLastFiredCannonBall).applyForce(force);
   
 } 
 else if (keyPressed && keyCode == RIGHT){ 
   angle -= 0.1; 
   
 }
 
 else if (keyPressed && keyCode == LEFT){ 
  angle += 0.1;  
 }
}
*/
