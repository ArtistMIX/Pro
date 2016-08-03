class YinYang {
  float x, y, r, angle;

  YinYang(float px, float py, float pr, float _angle) {
    r =  pr;
    angle =  _angle;
    x =  px;
    y =  py;
  }

  void update() {
  }

  void drawing() {

    for (int i = 0; i < 3; i++) {

      //fill(255, 0, 0);
      ellipse(x, y, r, r );
      angle += 9 * i;
      r = r*(30-i)/30;
      x = x + r*cos(radians(angle));
      y = y + r*sin(radians(angle));
    }
  }
}