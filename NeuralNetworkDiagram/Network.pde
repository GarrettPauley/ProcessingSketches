class Network{
 ArrayList<Neuron> neurons; 
 PVector position; 
 ArrayList<Connection> connections; 
 
 Network(float x, float y){
   position = new PVector(x,y) ;
   neurons = new ArrayList<Neuron>(); 
    connections = new ArrayList<Connection>();
 }
 
 void addNeuron(Neuron n){
  neurons.add(n);  
 }
 
 void connect(Neuron a, Neuron b, float weight){
   Connection c = new Connection(a,b,weight); 
   a.addConnection(c); 
   connections.add(c); 
  }
  
 
 void display(){
    pushMatrix(); 
    translate(position.x, position.y); 
    for(Neuron n: neurons){
     n.display();  
    }
    
    for(Connection c: connections){
     c.display();  
    }
    
    popMatrix(); 
   
 }
 
 void feedforward(float input){
  Neuron start = neurons.get(0); 
  start.feedforward(input); 
 }
 
 void update(){
  for(Connection c: connections){
   c.update();  
  }
 }
 
 
  
}
