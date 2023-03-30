class haze{
  
  PVector origin; 
  float radius; 
  float randValue; 
  float alpha; 
  float angle; 

  haze(PVector origin, float r, float alpha){
    this.origin = origin; 
    radius = r;
    randValue = 30;
   this.alpha = alpha; 
   angle = 0.0; 
  }
  
  void update(){
    angle+=.1; 
  }
  
 void drawHaze(){
    noStroke(); 
    fill(#FAAC00, alpha);
    
    pushMatrix(); 
      translate(width/2, height/2);
        beginShape(); 
         for(float theta = 0; theta<=360; theta++){
            curveVertex(radius*cos(theta) + random(-randValue, randValue), radius*sin(theta) + random(-randValue, randValue));
            curveVertex(radius*cos(theta), radius*sin(theta));
         }
       endShape(CLOSE);    
     popMatrix(); 
 }


}
