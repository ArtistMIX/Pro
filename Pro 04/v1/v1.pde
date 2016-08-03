
Rope r;
float rotateN, rotateN2;
int t;

void setup() {
  background(0);
  size(800, 800);
  r = new Rope();
  t = 0;
}

void draw() {

  translate(width/2, height/2);
  smooth();

  noStroke();
  r.display(255, 0, frameCount);
  r.deter();
  r.refresh();

  //  r.rotateScale();
  t++;

  saveFrame("rendering/artwork####.jpeg");
  println(frameCount);
}

