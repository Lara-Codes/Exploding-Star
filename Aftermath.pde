// Reveals empty space after explosion 
class Aftermath{
  
  float size; 
  double count; 
  
  Aftermath(){
    size = 1; 
    count = 1; 
  }
  
  void update(){
    size+=exp(count);  
    count+=.2; 
  }
  
 void display(){
    noStroke(); 
    fill(#140006);
    beginShape(); 
      for(int theta = 0; theta<360; theta++){
        vertex(width/2 + size*cos(theta) + random(-10, 10), height/2 + size*sin(theta) + random(-10, 10));
      }
    endShape(); 
  }  
  
 double exp(double x){
   return Math.pow(x, 2.0); 
 }
}
