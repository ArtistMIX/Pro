TornadoSpline s = new TornadoSpline();
ArrayList<TornadoParticle> particles = new ArrayList<TornadoParticle>();


void setup() {
  size(1000, 1000, P3D);
  background(0);
  stroke(120);
  strokeWeight(2);
  noFill();

  blendMode(ADD);

  for (int i = 0; i<700; i++) {
    TornadoParticle p = new TornadoParticle(s);
    particles.add(p);
  }
}

void draw() {
  //background(0);
  camera(0, -150, 500, 0, 0, 0, 0, 1, 0);


  s.run();
  for (int i = 0; i<particles.size(); i++) {
    particles.get(i).run(s);
    if ( particles.get(i).isDead) {
      particles.remove(i);
    }
  }
}

void mousePressed() {
  saveFrame("rendering/work####.jpg");
  //for (int i = 0; i<1000; i++) {
  //  TornadoParticle p = new TornadoParticle(s);
  //  particles.add(p);
  //}
}

void keyPressed() {
  //s.ellipseDisplay = !s.ellipseDisplay;
}