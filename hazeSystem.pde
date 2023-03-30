class hazeSystem{
  ArrayList<haze> h; 
  PVector origin; 
  float alpha; 
  float radius;
  
  
  hazeSystem(PVector o, float initAlpha, float initRadius){
    origin = o.copy(); 
    radius = initRadius; 
    alpha = initAlpha; 
    h = new ArrayList<haze>(); 
    
  }
  
  void display(){
    for(int i = 0; i<h.size(); i++){
      h.get(i).drawHaze();
    }
  }
  
  void update(){
    for(int i = 0; i<h.size(); i++){
      h.get(i).randValue+=15; 
    }
  }
  
  void populateHaze(){
    for(int i = 0; i<20; i++){
      addHaze(alpha, radius); 
      alpha-=8; 
      radius+=30; 
    }
  }
  
  void setRandValue(float rand){
    for(int i = 0; i<h.size(); i++){
      h.get(i).randValue += rand; 
    }
  }
  
  void addHaze(float alpha, float radius){
    h.add(new haze(new PVector(width/2, height/2), radius, alpha));
  }


}
