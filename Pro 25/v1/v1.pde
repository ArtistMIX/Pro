PImage pic;
//Controller
float scaleTimes = 80;
int painterCount =5000;
float speedMax =1;

//Generator
PVector[] painter = new PVector[painterCount]; 
PVector[] velocity = new PVector[painterCount];
color[] originColor = new color[painterCount]; 


void setup() {
  size(667,667);
  background(255);
  strokeWeight(0.5);

  pic =  loadImage("pic6.jpg");
  for (int i = 0; i<painterCount; i++) {
    painter[i] = new PVector(random(width), random(height));
    velocity[i] = new PVector(random(- speedMax, speedMax), random(- speedMax, speedMax));

    originColor[i] = pic.get((int)painter[i].x, (int)painter[i].y);
  }
}


void draw() {
  //background(0);
  //image(pic, 0, 0);

  for (int i = 0; i<painterCount; i++) {

    PVector temp = new PVector(painter[i].x, painter[i].y);
    temp.add(velocity[i]);

    color c = pic.get((int)temp.x, (int)temp.y);
    float colorSum1 = red(originColor[i])+green(originColor[i])+blue(originColor[i]);
    float colorSum2 = red(c)+green(c)+blue(c);

    if (abs(colorSum1-colorSum2)>50) {

      velocity[i] = new PVector(random(- speedMax, speedMax), random(- speedMax, speedMax));
    } else {
      fill(c);
      stroke(c);
      //stroke(255);
      line(temp.x, temp.y, painter[i].x, painter[i].y);

      painter[i] = temp;
    }

    //Border Detect
    if ( painter[i].x > width) {
      painter[i].x = 0;
    } else if (painter[i].x < 0) {
      painter[i].x = width;
    } else if (painter[i].y > height ) {
      painter[i].y = 0;
    } else if (painter[i].y <0 ) {
      painter[i].y = height;
    }
  }
}

void mousePressed() {
  saveFrame("rendering/rendering####.jpg");
}