//class for a single particle - used for explosion scribbles. Modification of Daniel Shiffman's particle code. 
class Particle{
  PVector location; 
  PVector velocity; 
  PVector acceleration; 
  float lifespan; 
  float size; 
  float baseR; 
  float baseG; 
  float baseB; 
  float shadeDistance; 
  
  Particle(PVector l){
    location = l.copy(); 
   // acceleration = new PVector(0, 0.05); //assigning a constant acceleration in the y direction  
    velocity = new PVector(random(-20,20),random(-20,20)); //Random velocity in the x and y directions 
    lifespan = 200.0; 
    size = 50; 
    
    baseR = 250; 
    baseG = 172; 
    baseB = 0; 
    shadeDistance = 35; 
  }
  
  void run(){ //Sometimes useful to have a run function that calls he other functions that we need 
    update(); 
    display(); 
  }
  
  void update(){
    location.add(velocity); 
    lifespan -= .2; 
    size+=random(0, 3); 
  }
  
  void display(){
    noFill(); 
    stroke(chooseR()-80, chooseG()-80, chooseB(), lifespan);
   // noFill(); 
    beginShape(); 
      for(int theta = 0; theta<360; theta++){
        vertex(location.x + size*cos(theta) + random(-20, 20), location.y + size*sin(theta) + random(-20, 20));
      }
    endShape(); 
  }
  
  boolean isDead(){
    if(lifespan < 0.0){
      return true; 
    }else{
      return false; 
    }
  }
  
  float chooseR(){
    return baseR + random(-shadeDistance, shadeDistance);
  }   
  
  float chooseG(){  
    return baseG + random(-shadeDistance, shadeDistance);  
  }
  
  float chooseB(){
    return baseB + random(-shadeDistance, shadeDistance);
  }
  
}
