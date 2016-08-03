float[] a;
float s;


void setup() {
  size(800, 800);
  background(255);
  rectMode(CENTER);
  a = new float [4];
  //  blendMode(DIFFERENCE);
  s = 0;

  for (int i = 0; i < 4; i++) {
    a[i] = 30*i;
  }
}

void draw() {
  smooth();
  background(255);
  float f = frameCount % 4;
  translate(width/2, height/2);
  s = s+0.008;
  rotate(s);

  for (int i = 0; i < 4; i++) {
    a[i] = a[i] + 0.4;
    if (a[i] > 105) {
      a[i]=0;
    }
    noFill();
    stroke(0);
    strokeWeight(50);
    rect(0, 0, 12*a[i], 12*a[i]);

    rotate(-1*s);
    noFill();
    stroke(255);
    strokeWeight(48);
    rect(0, 0, 12*a[i], 12*a[i]);
  }
  //saveFrame("rendering/artwork####.png");
  println(frameCount, s, a[0], a[1], a[2]);
}

//void keyPressed() {
//  if (key =='d') {
//  }
//}