import java.util.Iterator;
import processing.sound.*;
//Initializing background haze, "sun" rays, and back (stars). Also the haze system - 
// The overlapping colors of the background haze. 
haze h;
Rays r; 
Back b; 
hazeSystem hs; 

//The inner circle of the sun radius. The value of this variable triggers the explosion.
float innerRayRadius; 

//Activated tells us if the explosion has been initiated. I only want to add 1 
// explosion animation, so making sure this is set to "true" avoids infinite adding of 
// the explosion to the "systems" arraylist. 
boolean activated; 

//This is for the explosion - the particle system that defines the system 
ArrayList<ParticleSystem> systems; 

//Aftermath defines the weird background-colored circle that empties the screen to make it look 
//like the initial animation is disappating into space 
Aftermath a; 

SoundFile file; 
SoundFile ambience; 

//Used to disable mouse click after explosion 
boolean explosionDone; 

void setup(){
  size(1440, 810);
  background(#140006); 
  smooth();
  
  file = new SoundFile(this, "mi_explosion_03_hpx.mp3");
  ambience = new SoundFile(this, "space.mp3");
  ambience.play(); 
  
  //Create new haze system 
  hs = new hazeSystem(new PVector(width/2, height/2), 60, 150); 
  
  //Populating haze with overlapping colors
  hs.populateHaze(); 
  
  //Setting initial value for inner radius of sun 
  innerRayRadius = 50;   
  
  fill(#B76F00);
  noStroke(); 

  //FOR EXPLOSION - greater explanation in initialization of variables above 
  activated = false;
  systems = new ArrayList<ParticleSystem>();   
  
  //FOR ENDSCREEN -greater explanation in initialization of variables above 
  a = new Aftermath(); 
  
  explosionDone = false; 
}

void draw(){  
  //background 
  background(#140006); 
 
 //Only do this if the inner radius of the sun is greater than 1 
 if(innerRayRadius>=1 && a.size<=900){
   // Rays and background star generation 
    r = new Rays((new PVector(width/2, height/2)), 250, innerRayRadius);  
    b = new Back(new PVector(width/2, height/2), 700); 
    
    //Displaying stars and haze system  
    b.display(); 
    hs.display(); 
  
    //Populates whole screen with stars - decreases radius of 
    // circle of stars by 8 every time to get 
    while(b.radius>=400){
      b.update(); 
    }  
    //Draws the rays 
    r.drawRays();  
} else if(a.size<=900){
  
  innerRayRadius-=20; 
  hs.setRandValue(15); 
   // Rays and background star generation 
    r = new Rays((new PVector(width/2, height/2)), 250, innerRayRadius);  
    b = new Back(new PVector(width/2, height/2), 700); 
    
    //Displaying stars and haze system  
    b.display(); 
    hs.display(); 
  
    //Populates whole screen with stars - decreases radius of 
    // circle of stars by 8 every time to get 
    updateB(); 
    
    //Draws the rays 
    r.drawRays();  
    if(innerRayRadius<=-40){
      explosion(); 
      b = new Back(new PVector(width/2, height/2), 700); 
      a.display(); 
      b.display();
      updateB(); 
      a.update(); 
    }    
  } else{   
      frameRate(2); 
      b = new Back(new PVector(width/2, height/2), 700); 
      b.display(); 
      updateB(); 
  }  
}

void updateB(){
  while(b.radius>=50){
      b.update(); 
    } 
}


void mousePressed(){
  if(explosionDone == false){
    hs.update(); 
    innerRayRadius-=5; 
    if(innerRayRadius<1){
      systems.add(new ParticleSystem(new PVector(width/2, height/2)));   
      activated = true; 
    }
  }
}

void explosion(){
      file.play(); 
      Iterator<ParticleSystem> it = systems.iterator(); 
        while(it.hasNext()){
          ParticleSystem ps = it.next();       
          if(ps.particles.size()<25.0){
            ps.run(); 
            ps.addParticle();  
          }else{
            ps.run();
            if(ps.isDead()){
              it.remove(); 
            }
          }
       }   
     explosionDone = true; 
}
