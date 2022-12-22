import peasy.*;
PeasyCam cam; 
//ArrayList<KochLine> lines; 
//ArrayList<PVector> c_locations; 
SierpinskiTri tri; 
ArrayList<SierpinskiTri> triangles; 


void setup(){ 
size(1000,1000);
PVector a = new PVector (500,100); 
PVector b = new PVector (200,500); 
PVector c = new PVector (800,500);

triangles = new ArrayList<SierpinskiTri>(); 
tri = new SierpinskiTri(a,b,c); 
triangles.add(tri);
SierpinskiTri tri2 = tri.nextTriangleVertices(); 
triangles.add(tri2);




 

/*
lines = new ArrayList<KochLine>(); 
c_locations = new ArrayList<PVector>(); 
PVector start = new PVector(100,200);
PVector end = new PVector(500, 200);
lines.add(new KochLine(end, start));
for(int i = 0; i < 5; i++){
 generate(60);  
 
}
*/






} 


void draw(){
  
  for(SierpinskiTri s: triangles){
    s.display(); 
    
  }
  
  
  
  
  /*
  for(KochLine k: lines){
   k.display();  
  }
  
  //Uncomment to add ellipses to the tip of each triangle, just for fun
  //for(PVector c_ : c_locations){
  //ellipse(c_.x, c_.y, 30,30);  
  //}
  
  
  */
  
  
 
  //cantor(0,20, width);
  
  
}

/*


void generate(int angle){
 ArrayList next = new ArrayList<KochLine>();  
 
 for (KochLine l : lines){
   PVector a = l.kochA(); 
   PVector b = l.kochB(); 
   PVector c = l.kochC(angle);
   PVector d = l.kochD(); 
   PVector e = l.kochE(); 
  c_locations.add(c); // used to draw ellipses at each c location, just for fun. 
  next.add(new KochLine(a,b));  
  next.add(new KochLine(b,c));
  next.add(new KochLine(c,d)); 
  next.add(new KochLine(d,e)); 
  
 }
 

 lines = next; 
  
}



void drawCircle(float x, float y, float radius){
 stroke(0); 
 noFill(); 
 ellipse(x,y,radius, radius); 
 if(radius > 10){
  drawCircle(x + radius / 2, y, radius/2); 
  drawCircle(x - radius / 2, y, radius/2);
  drawCircle(x, y + radius/2, radius/2); 
  drawCircle(x, y - radius/2, radius/2);
 }
}
 
 
 void cantor(float x, float y, float len){
  if(len >= 2){
  line(x,y, x+len, y); 
  
  y += 20; 
  
  cantor(x,y, len/3); 
  cantor(x+len*2/3, y, len/3); 
  } 
 }
  
  */
  
