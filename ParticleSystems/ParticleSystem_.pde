
import java.util.Iterator; 

class ParticleSystem{ 
  
 ArrayList<Particle> particles; 
 PVector origin; 
 PImage img; 
 
 ParticleSystem(PVector location){
  origin = location.copy(); 
  particles = new ArrayList();  
 }
 
 ParticleSystem(PVector location, PImage img_){
  origin = location.copy(); 
  particles = new ArrayList(); 
  img = img_; 
 }
 
 void addParticle(){ 
   
   particles.add(new Particle(origin)); 
   
   }
   
  
 void applyForce(PVector f){ 
  for(Particle p: particles){ 
   p.applyForce(f); 
  }
 }
 
 void applyRepeller(Repeller r){ 
   for (Particle p: particles){
    PVector force = r.repel(p); 
    p.applyForce(force); 
   }
  }
  
  void applyAttractor(Attractor a){
   for(Particle p : particles){ 
    PVector force = a.attract(p);
    p.applyForce(force); 
   }
  }
  
 void run(){ 
  Iterator<Particle> it = particles.iterator(); 
  
  while(it.hasNext()){
     Particle p = it.next(); 
     p.run(); 
     if (p.isDead()){ 
        it.remove();  
      }
   } 
   
 }
 
}
