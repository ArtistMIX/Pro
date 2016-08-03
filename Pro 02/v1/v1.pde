float x1, x2, y1, y2, d;
float a, b, count;
int bound;
boolean trigger1, trigger2;

void setup() {
  size(720, 720);
  background(255);
  bound = 360;
  x1 = -width/2-bound;
  y1 = 0;
  x2 = width/2+bound;
  y2 = 0;
  d = 5;
  count = 0;
  trigger1 = true;
  trigger2 = false;
  blendMode(DIFFERENCE);
}

void draw() {
  translate(width/2, height/2);

  background(255);
  noStroke();
  noFill();
  rect(width/2, height/2, 50, 50);

  //  rotate(radians(90*count));


  fill(255, 0, 0);
  ellipse(x1, y1, 50, 50);
  ellipse(x2, y2, 50, 50);
  ellipse(y1, x1, 50, 50);
  ellipse(y2, x2, 50, 50);

  noStroke();
  //  noFill();
  rectMode(CORNERS);

  // Horizon
  if (trigger1 == true) {
    for (int i = 0; i <50; i++) {
      float[] a = new float [50];
      a[i] = map(dist(x1, 0, -width/2+20*i, 0), 0, 100, 0, 100);
      rect(-width/2+20*i, -25, -width/2+20*(i+1), -a[i] );
    }
    fill(0, 255, 0);
    for (int i = 49; i >= 0; i--) {
      float[] a = new float [50];
      a[i] = map(dist(x2, 0, -width/2+20*i, 0), 0, 100, 0, 100);
      rect(-width/2+20*i, 25, -width/2+20*(i+1), a[i]);
    }
  }

  //Verticle
  if (trigger2 == true) {
    //    rotate(radians(90));

    fill(0, 0, 255);
    noStroke();
    for (int i = 0; i <50; i++) {
      float[] a = new float [50];
      a[i] = map(dist(0, x1, 0, -width/2+20*i), 0, 100, 0, 100);
      rect(-25, -width/2+20*i, -a[i], -width/2+20*(i+1) );
    }
    fill(150);
    for (int i = 49; i >= 0; i--) {
      float[] a = new float [50];
      a[i] = map(dist(0, x2, 0, -width/2+20*i), 0, 100, 0, 100);
      rect(25, -width/2+20*i, a[i], -width/2+20*(i+1) );
    }
  }
  if (x1 == x2) {
    trigger1 =true;
    trigger2 =true;
    //    count++;
    //    trigger1 =! trigger1;
    //    trigger2 =! trigger2;
  }

  if (x1 == width/2+bound) {
    x1 = -width/2-bound;
    x2 = width/2+bound;
  }

  x1 = x1 + d;
  x2 = x2 - d;

  //saveFrame("rendering/artwork####.png");
  println(x1, x2);
}