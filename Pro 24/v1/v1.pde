PVector [] point = new PVector[200];
PVector [] pointClone = new PVector[200];
int counter = 0;

void setup() {
  size(800, 800);
  background(0);
  smooth();

  for (int i = 0; i<200; i++) {
    point[i]= new PVector(5*i, height/2);
    pointClone [i] = new PVector();

    if (i==0) {
      point[0].y = height/2+100*sin(radians(frameCount*2));
    } else {
      line(point[i-1].x, point[i-1].y, point[i].x, point[i].y);
    }
  }
}

void draw() {
  background(0);
  translate(width/2, 0);
  float strokeColor = sin(radians(5*frameCount));
  stroke(150+50*strokeColor, 150-100*strokeColor, 150+40*strokeColor);

  for (int i = 199; i>-1; i--) {
    point[i]= new PVector(2*i, height/2);

    if (i==0) {
      //point[0].y = height/2+100*sin(radians(5*frameCount))+random(10);
      point[0].y = height/2+200*sin(radians(5*frameCount));
      line(point[i+1].x, point[i+1].y, point[i].x, point[i].y);
    } else if (i==199) {
    } else
    {
      float ampConter = 295+5*sin(radians(2*frameCount));
      point[i].y = point[i-1].y;
      point[i].y *=1.1*sin(radians( ampConter));
      println(mouseX);
      line(point[i+1].x, point[i+1].y, point[i].x, point[i].y);
    }
  }

  for (int i = 199; i>-1; i--) {
    pointClone[i] = point[i];
    pointClone[i].x *= -1;
    if (i != 0 && i != 199) {
      line( pointClone[i+1].x, pointClone[i+1].y, pointClone[i].x, pointClone[i].y);
    }
  }

  fill(150-50*strokeColor, 150+100*strokeColor, 150-40*strokeColor);
  ellipse(0, point[0].y, 20, 20);

  if (frameCount%5==0) {
    counter ++;
  }

  //saveFrame("render/work####.jpg");
}