int[] randomCounts; 

void setup() { 
 size(640,240); 
 background(255); 
 randomCounts = new int[20];
}

void draw(){ 
  int index = int(random(randomCounts.length));  // get a random index
  randomCounts[index]++; // increments the value of that array element
  stroke(0); 
  fill(175); 
  int w = width/randomCounts.length;  // total space / number of rectangles
  
  for (int x =0; x < randomCounts.length; x++){ 
    
   rect(x*w, height-randomCounts[x], w-1, randomCounts[x]);  // (x cord, y cord, width, height) 
   
   // x*w distributes the rectangles evenly. when x = 0 the upper left corner of the rectangle is at the far left (like the origin)
      // when w=1 the upper left corner of the rectangle is one width away from the origin, etc. 
   // height - randomCounts[x] is calculating the y cord. 
   // randomCounts[x] represents the height of the rectangle. 
   
  }
  
}
