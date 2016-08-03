float a;
float space;
boolean [] power;
boolean scaleSwitch;
float scaleNum;
float [] d;
void setup() {
  background(0);
  size(800, 800);
  a = 0;
  power = new boolean [10];
  d = new float [10];
  scaleSwitch = false;
  scaleNum = 1;
  space = .4;
  for (int i = 0; i <10; i++) {
    power [i] = false;
    d[i] = -width/2;
  }
}

void draw() {

  translate(width/2, height/2);
  smooth();
  fill(255);
  noStroke();

  rotate(scaleNum);
  scale(1.3);
  scaleNum = scaleNum+0.5;
  //  if (d[9]>width/2) {
  //    scale = true;
  //    scale(2, 2);
  //  }
  //
  //  if (scale == true) {
  //    scale(2, 2);
  //  }

  for (int i = 0; i <10; i++) {

    if (frameCount % (8*(1+i)) ==0) {
      power[i] = true;
    }
    if (power[i] == true) {
      ellipse(d[i], (i-5)*80, 40, 40);
      d[i] = d[i] + space;
    }
  }
  for (int i = 0; i <10; i++) {

    if (frameCount % (8*(1+i)) ==0) {
      power[i] = true;
    }
    if (power[i] == true) {
      ellipse((i-5)*80, d[i], 40, 40);
      d[i] = d[i] + space;
    }
  }
  fill(0);

  for (int i = 0; i <10; i++) {

    if (frameCount % (8*(1+i)) ==0) {
      power[i] = true;
    }
    if (power[i] == true) {
      ellipse(d[i], (i-5)*80, 40, 40);
      d[i] = d[i] + space;
    }
  }
  for (int i = 0; i <10; i++) {

    if (frameCount % (8*(1+i)) ==0) {
      power[i] = true;
    }
    if (power[i] == true) {
      ellipse((i-5)*80, d[i], 40, 40);
      d[i] = d[i] +space;
    }



    //    scale(a, a);
    a = a + 0.0001;
    println(d[9]);
  }
  //saveFrame("rendering/artwork####.jpeg");
}