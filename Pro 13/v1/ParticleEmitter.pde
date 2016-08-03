class ParticleEmitter {
  PVector location;
  ArrayList<Particle> particles;
  int numberThreshold =200;
  float driverX, driverY;


  ParticleEmitter(float x, float y) {
    location = new PVector(x, y);
    particles = new ArrayList<Particle>();
  }

  void run(float _driverX, float _driverY) {
    generator();
    update();
    driverX = _driverX;
    driverY = _driverY;
  }

  void generator() {
    if (particles.size()<numberThreshold) {
      Particle p1 = new Particle(location.x, location.y);
      particles.add(p1);
    }
  }


  void update() {

    location = new PVector(driverX, driverY);
    for (int i = 0; i< particles.size(); i++) {
      particles.get(i).run(mouseX, mouseY);
      if ( particles.get(i).isDead()== true) {
        particles.remove(i);
      }
    }
  }
}