
import java.util.Iterator; 

ArrayList<Particle> particles; 
ArrayList<ParticleSystem> systems; 


//Repeller repeller; 
Attractor attractor; 
int totalParticles; 
PVector origin; 

void setup() {
  size(640, 480);
  textSize(40); 
  textAlign(CENTER);
  systems = new ArrayList<ParticleSystem>(); 
  //repeller = new Repeller(width/2 -20, height/2);
  attractor = new Attractor(30, new PVector(width/2, height/2)); 
 

}




void draw() {

background(255); 
PVector gravity = new PVector(0,0.1); 
for(ParticleSystem ps : systems){
  ps.applyForce(gravity); 
  ps.run(); 
  ps.addParticle();
  //ps.applyRepeller(repeller);  // a function to apply a force from the repeller. 
  //repeller.display();
  ps.applyAttractor(attractor); 
  attractor.display(); 
  
  
}
  
  }

void mousePressed(){ 
 systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));  
}
