// Sun rays 
class Rays{
  
  PVector origin; 
  float radius; 
  float count; 
  float rand; 
  float alpha; 
  float innerRadius; 
  
  
  Rays(PVector o, float r, float ir){
    origin = o.copy(); 
    radius = r; 
    rand = 90;
    alpha = 80; 
    
    innerRadius = ir; 
    
  }
 
  void drawRays(){
    stroke(#FEFF61, alpha);
    strokeWeight(.5);
    for(int theta = 0; theta<1080; theta++){
       line(origin.x + innerRadius*cos(theta), origin.y + innerRadius*sin(theta), origin.x + cos(theta)*radius + random(-rand, rand), origin.y + sin(theta)*radius + random(-rand, rand)); 
      if(theta%360==0){
        alpha-=10; 
      }  
    }
  }
}
