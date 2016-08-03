float theta = 0;
float r = 15;
float offsetXG, offsetYG;
boolean rotateSwitch = false;

void setup() {
  size(800, 800);
  //background(0);
}

void draw() {
  if (rotateSwitch == false) {
    translate(width/2, height/2);
  } else {
    translate(width/2+offsetXG, height/2+offsetYG);
  }
  background(0);

  for (int i = -21; i<21; i++) {
    for (int j = -11; j<11; j++) {
      ellipseMode(CENTER);
      float offsetX = r*cos(radians(theta)+20*i);
      float offsetY = r*sin(radians(theta)+20*i);
      stroke(0);
      strokeWeight(1);
      ellipse(20+20*i+offsetX, 20+20*j+offsetY, 10, 10);
      offsetXG = 0.5*offsetX;
      offsetYG = 0.5*offsetY;
      stroke(255);
      strokeWeight(0.5);
      line(20+20*i+offsetX, 20+20*j+offsetY, 20+20*i+offsetX, 20+20*(j+1)+offsetY);
    }
  }
  theta += 3;
  println(rotateSwitch);
  //saveFrame("rendering/work####.png");
}

void keyPressed() {
  if (key =='r') {
    rotateSwitch = !rotateSwitch;
  }
}