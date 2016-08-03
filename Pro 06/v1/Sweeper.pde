class Sweeper {
  float [] px = new float [3];
  float [] py = new float [3];
  float [] aX = new float [3];
  float [] aY = new float [3];

  Sweeper(float a, float b, float c, float d) {
    for (int i = 0; i< 3; i++) {
      px [i] = a;
      py [i] = b;
      aX [i] = c;
      aY [i] = d;
    }
  }


  void display() {

    for (int i = 0; i< 3; i++) {
      //      point(px[i], py[i]);

      if (px[i] > width/2 || px[i] < -width/2) {
        aX[i] *= -1;
      }

      if (py[i] > 200 || py[i] < -200) {
        aY[i] *= -1;
      }

      if (i % 3 == 0) {
        noFill();
        beginShape();
        curveVertex(-width/2, height/2);
        curveVertex(0, height/2);
        curveVertex(px[i], py[i]);
        curveVertex(px[i+1], py[i+1]);
        curveVertex(px[i+2], py[i+2]);
        curveVertex(0, -height/2);
        curveVertex(width/2, -height/2);
        endShape();
      }
      px[i] += aX[i];
      py[i] += aY[i];
    }
  }
}

