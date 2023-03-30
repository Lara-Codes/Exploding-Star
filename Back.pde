//STARS animation
class Back{
  PVector origin; 
  float radius; 
  float x;
  float y; 
  
  Back(PVector o, float r){
    origin = o; 
    radius = r; 
  }

  void display(){
    for(int theta = 0; theta<1440; theta+=5){
      strokeWeight(.7); 
      stroke(255); 
        x = origin.x + cos(radians(theta))*radius; 
        y = origin.y + sin(radians(theta))*radius; 
        point(x + random(-50, 50), y + random(-50, 50)); 
     }
  }
  
  void update(){
    radius-=8; 
    display(); 
  }

}
