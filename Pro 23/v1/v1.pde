int circleCount =36;
int inlineCount = 10;
float r = 100;
float ellipseSize = 100;
float strokeWeightMin = 0.05;

void setup() {
  size(900, 900);
  background(0);
  translate(width/2, height/2);
  colorMode(HSB, 100);
  fill(120);
  //noFill();
  //blendMode(ADD);

  for (int i = 0; i<circleCount; i++) {

    float x = cos(radians(i*360/circleCount));
    float y = sin(radians(i*360/circleCount));
    //strokeWeight(strokeWeightMin-0.1*i);

    for (int j =0; j<inlineCount; j++) {
      float rInline = r-5*j;

      ellipseSize = 100-5*j;
      ellipse(rInline*x, rInline*y, ellipseSize, ellipseSize);
    }
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  r = 300*sin(radians(frameCount));
  float r2 = 350*sin(radians(frameCount+270));

  for (int i = 0; i<circleCount; i++) {
    float x = cos(radians(i*360/circleCount));
    float y = sin(radians(i*360/circleCount));

    for (int j =0; j<inlineCount; j++) {
      stroke(i*100/circleCount, j*100/inlineCount, 100);
      strokeWeight(strokeWeightMin+1*j);

      float rInline = r-20*j*sin(radians(frameCount)); 
      float rInline2 = r2-20*j*sin(radians(frameCount)); 
      ellipseSize = 100-5*j;
      ellipse(rInline*x, rInline*y, ellipseSize, ellipseSize);

      //rotate(radians(3.5));
      //rotate(radians(18));
      //rotate(radians(0.5));
      strokeWeight(0.5);
      line(rInline*x, rInline*y, rInline2*x, rInline2*y);
      strokeWeight(strokeWeightMin+1*j);
      ellipse(rInline2*x, rInline2*y, ellipseSize, ellipseSize);

      //if (j==0) {
      //  strokeWeight(3);
      //  stroke(i*100/circleCount, j*100/inlineCount, 100);
      //line(rInline*x, rInline*y, (r+300)*x, (r+300)*y);
      //ellipse(100*cos(radians(i*360/circleCount)),100*sin(radians(i*360/circleCount)), 30, 30);
      //}
    }
  }

  //saveFrame("rendering/pro20####.jpg");
}