class Neuron{ 
  PVector position; 
  Connection con; 
  ArrayList<Connection> connections; 
  int sum = 0; 
  float r = 32; 
  
  
  Neuron(float x, float y){
   position = new PVector(x, y);  
   connections = new ArrayList<Connection>(); 
  }
  

  void display() {
    stroke(0);
    strokeWeight(1);
    // Brightness is mapped to sum
    float b = map(sum,0,1,255,0);
    fill(b);
    ellipse(position.x, position.y, r, r);
    // Size shrinks down back to original dimensions
    r = lerp(r,32,0.1);
  }

  
  void addConnection(Connection c){
    connections.add(c); 
    
  }
  
  void feedforward(float input){
   sum += input;  
   if(sum > 1) {
    fire(); 
    sum = 0; 
   }
  }
  
  void fire(){
    r = 60; 
   for(Connection c: connections){
    c.feedforward(sum);  
   }
  }
}
