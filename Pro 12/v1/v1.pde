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
  rotate(radians(45));
  track();
  rotate(radians(-90));
  track();

  theta += 7;
  println(rotateSwitch);
  //saveFrame("rendering3/work####.png");
}

void keyPressed() {
  if (key =='r') {
    rotateSwitch = !rotateSwitch;
  }
}

void track () {
  for (int i = -41; i<41; i++) {
    for (int j = -11; j<11; j++) {
      ellipseMode(CENTER);
      float offsetX = r*cos(radians(theta)+20*i);
      float offsetY = r*sin(radians(theta)+20*i);
      stroke(0);
      //stroke(255);
      strokeWeight(0.1);
      fill(0);
      //blendMode(ADD);
      ellipse(20+10*i+offsetX, 20+10*j+offsetY, 5, 5);
      offsetXG = 0.5*offsetX;
      offsetYG = 0.5*offsetY;
      stroke(255);
      strokeWeight(1.5);
      line(20+10*i+offsetX, 20+10*j+offsetY, 20+10*i+offsetX, 20+10*(j+1)+offsetY);
    }
  }
}