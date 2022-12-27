class Connection{
 Neuron a; 
 Neuron b; 
 float weight; 
 Boolean sending = false; 
 PVector sender; 
 float output; 
  
  
  Connection(Neuron to, Neuron from, float w){
    weight = w; 
    a = from; 
    b = to; 
  }
  
  void display(){
   stroke(0); 
   strokeWeight(1 + weight * 4); 
   line(a.position.x, a.position.y, b.position.x, b.position.y); 
   
   if(sending){
    fill(0); 
    strokeWeight(1); 
    ellipse(sender.x, sender.y, 16,16); 
   }
    
  }
  
  void feedforward(float value){
   output = value * weight; 
   sender = a.position.copy(); 
   sending = true; 
  }
  
  void update(){
   if(sending){
    sender.x = lerp(sender.x, b.position.x, 0.1);  
    sender.y = lerp(sender.y, b.position.y, 0.1);  
    
    float d = PVector.dist(sender, b.position); 
    
    if(d < 1){
     b.feedforward(output); 
     sending = false; 
    }
   }
  }
}
