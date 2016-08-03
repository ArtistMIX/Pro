int circleCount =20;
int inlineCount = 10;
float r;
float ellipseSize = 100;
float timer;

void setup() {
  size(1000, 1000);
  background(#E8A4A4);
  translate(width/2, height/2);
  colorMode(HSB, 100);
  fill(150);
  blendMode( ADD );
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(frameCount*0.02);
  timer = frameCount*0.5;
  r = 200*sin(radians(frameCount));

  for (int i = 0; i<circleCount; i++) {

    for (int j =0; j<inlineCount; j++) {
      float x = cos(radians(((5*j)+i*360*sin(radians(timer*0.5)))/circleCount));
      float y = sin(radians(((5*j)+i*360*sin(radians(timer*0.5)))/circleCount));

      //stroke(i*100/circleCount, j*100/inlineCount, 100);
      fill((circleCount-i)*100/circleCount, j*100/inlineCount, 3);

      float rInline = 20*j*sin(radians(timer)); 
      ellipseSize = 5*j*j*sin(radians(timer));
      ellipse(rInline*x, rInline*y, ellipseSize, ellipseSize);
    }
  }

  for (int i = 0; i<circleCount; i++) {

    for (int j = 0; j<inlineCount; j++) {
      float x = cos(radians(((5*j)+i*360*sin(radians(timer*0.5))+30*sin(radians(timer*0.5)))/circleCount));
      float y = sin(radians(((5*j)+i*360*sin(radians(timer*0.5))+30*sin(radians(timer*0.5)))/circleCount));

      //stroke(i*100/circleCount, j*100/inlineCount, 100);
      fill((circleCount-i)*100/circleCount, j*100/inlineCount, 3);

      float rInline = 20*j*sin(radians(timer)); 
      ellipseSize = 100+j*j*sin(radians(timer));
      ellipse(rInline*x, rInline*y, ellipseSize, ellipseSize);
    }
  }
  //saveFrame("rendering/pro####.jpg");
}