float tornadoHeight = 500;
float tornadoOffsetY = -230;
int splineVertex = 220;
float twistRadiusMax = 60;
float twistRadiusMin = 10;
int helixAngle = 1200;
float circleRadiusMax = 60;
PVector[] spline = new PVector[splineVertex];

//Timer
float timer = 0;
float speed = 3;


void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 100);
  strokeWeight(1.8);
  noFill();

  for (int i = 0; i<splineVertex; i++) {
    float splineRadius =  twistRadiusMin + twistRadiusMax - map(i, 0, splineVertex, 0, twistRadiusMax);
    float x = splineRadius* cos(radians(timer+i*helixAngle/splineVertex));
    float y = tornadoOffsetY + i*tornadoHeight/splineVertex;
    float z = splineRadius* sin(radians(timer+i*helixAngle/splineVertex));

    spline[i] = new PVector(x, y, z);
  }
}

void draw() {
  background(#326273);
  camera(0, -150, 400, 0, 0, 0, 0, 1, 0);


  strokeWeight(1.8);

  for (int i = 0; i<splineVertex; i++) {

    float hue = map(0.01*(i-splineVertex/2)+187, 0, 360, 0, 100);
    stroke(hue, 41, 94);

    float splineRadius =  twistRadiusMin + map(i, 0, splineVertex, twistRadiusMax, 0);
    float x = splineRadius* cos(radians(timer+i*helixAngle/splineVertex));
    float y = tornadoOffsetY + i*tornadoHeight/splineVertex;
    float z = splineRadius* sin(radians(timer+i*helixAngle/splineVertex));

    spline[i] = new PVector(x, y, z);
    pushMatrix();
    translate(0, y, 0);
    rotateX(radians(90));
    float r = circleRadiusMax-i*circleRadiusMax/splineVertex+10;
    ellipse(x, z, r, r);
    popMatrix();
  }

  timer += speed;
}