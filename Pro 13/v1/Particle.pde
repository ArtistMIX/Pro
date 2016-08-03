class Particle {
  PVector location;
  PVector velocity;
  PVector target;

  Particle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(random(-2, 2), random(0.5, 1));
  }

  void run(float targetX, float targetY) {
    target = new PVector(targetX, targetY);
    update();
    display();
  }

  void update() {
    velocity = PVector.sub(target, location);
    velocity.mult(0.01);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(location.x, location.y, 10, 10);
  }

  boolean isDead() {
    float distance = target.dist(location);
    if (distance < 20) {
      return true;
    } else {
      return false;
    }
  }
}