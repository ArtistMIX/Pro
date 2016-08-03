int count =500;
PVector[] circle = new PVector[count];
float [] theta = new float[count];
float strokeWeight;
float strokeColor;

void setup() {
  size(800, 800);
  background(0);
  ellipseMode(CENTER);
  fill(0);
  stroke(150);

  for (int i=99; i>-1; i--) {
    theta[i] = i*15;
    circle[i] = new PVector(10*(i+1)*cos(radians(theta[i])), 10*(i+1)*sin(radians(theta[i])));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2-100);

  for (int i=count-1; i>-1; i--) {
    strokeWeight = abs(50-0.20*i);
    strokeColor = abs(255-0.5*i);
    strokeWeight(1);
    if (i==0) {
      float a = 10*sin(radians(frameCount*5+35));
      theta[0] += a;
      strokeWeight(strokeWeight);
      stroke(strokeColor);
      line(2*(i+1)*cos(radians(theta[i])), 2*(i+1)*sin(radians(theta[i])), 
        2*(i+1)*cos(radians(theta[i+1])), 2*(i+1)*sin(radians(theta[i+1])));

      circle[i] = new PVector(50*(i+1)*cos(radians(theta[i])), 50*(i+1)*sin(radians(theta[i])));
      fill(255);
      strokeColor = abs(0);
    } else if (i==count-1) {
      theta[i] = theta[i-1];
      fill(0);

      strokeColor = abs(255-0.5*i);
    } else {
      theta[i] = theta[i-1];
      strokeWeight(strokeWeight);
      stroke(strokeColor);
      line(2*(i+1)*cos(radians(theta[i])), 2*(i+1)*sin(radians(theta[i])), 
        2*(i+1)*cos(radians(theta[i+1])), 2*(i+1)*sin(radians(theta[i+1])));

      circle[i] = circle[i-1];
      fill(0);
      strokeColor = abs(255-0.5*i);
    }

    strokeWeight(0.8);
    stroke(0);
    ellipse(2*(i+1)*cos(radians(theta[i])), 2*(i+1)*sin(radians(theta[i])), 50-0.2*i, 50-0.2*i);
  }
  //saveFrame("rendering/pro####.jpg");
}