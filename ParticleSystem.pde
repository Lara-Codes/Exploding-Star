// Collection of explosion squiggles - modification of Daniel Shiffman's particle system code
class ParticleSystem{
  
  ArrayList<Particle> particles; 
  PVector origin; 
  float lifespan; 
  int arrCount; 
  
  ParticleSystem(PVector location){
    origin = location.copy(); 
    particles = new ArrayList<Particle>(); 
  }
  
  
  void addParticle(){
    particles.add(new Particle(origin)); 
        particles.add(new Particle(origin)); 
  }
  
  void run(){
    Iterator<Particle> it = particles.iterator();
    while(it.hasNext()) {
      Particle p = it.next();
      p.run();
    }
  }
  
  boolean isDead(){
    Iterator<Particle> it = particles.iterator(); 
    while(it.hasNext()){
      Particle p = it.next(); 
      if(!p.isDead()){
        return false; 
      }
    }
    return true; 
  }

}
