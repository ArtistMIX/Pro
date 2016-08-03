class circle {

  float px;
  float py;
  float r;
  float theta;
  int count;
  float r2;


  circle(float _theta, float _r, int _count) {
    //px = _px;
    //py = _py;
    theta = _theta;
    r = _r;
    count = _count;
    r2 = _r;
  }

  void update() {
    r += 0.5;
    r2 += 2;
    theta += 3 ;
    px = r*cos(radians(theta));
    py = r*sin(radians(theta));
  }

  void display() {
    if (count % 2 ==0) {
      fill(255);
    } else {
      fill(0);
    }
    ellipse(px, py, r2, r2);
  }
}