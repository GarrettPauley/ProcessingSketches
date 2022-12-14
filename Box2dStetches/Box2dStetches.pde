import processing.core.*;

import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.DistanceJointDef;

import java.util.*;

Box2DProcessing box2d; 
Box box; 
Boundary boundary;
Boundary boundary2; 
Boundary boundary3; 
Boundary boundary4; 

void setup(){ 
  size(640, 480); 
  box2d = new Box2DProcessing(this);
  box2d.createWorld(); 
  box = new Box(width/2, height/2, 20,20);
  
  rectMode(CENTER);
  boundary = new Boundary(width/2, height - 50, 500, 10);
  boundary2 = new Boundary(width/2, height - 300, 500, 10); 
  boundary3 = new Boundary(width/2 - 200, height - 50, 10, 500);
  boundary4 = new Boundary(width/2 + 200, height - 50, 10, 500);
   
  textSize(25); 
  
} 


void draw(){ 
  background(255); 
  fill(175);
  box2d.step();
  box.display();
  boundary.display(); 
  boundary2.display();
  boundary3.display(); 
  boundary4.display(); 
  
  
  
  
  
} 
