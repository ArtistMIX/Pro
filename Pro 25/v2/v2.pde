PImage pic;
//Controller
float scaleTimes = 80;
int painterCount = 20000;
float speedMax = 10;
int drawVertexRange = 150;
float drawVertexDist = 30;

//Generator
PVector[] painter = new PVector[painterCount]; 
PVector[] velocity = new PVector[painterCount];
color[] originColor = new color[painterCount];
boolean[] polySwitch = new boolean[painterCount];
float speed;


void setup() {
  //size(800, 785); //pic2
  size(667, 667); //pic6
  background(255);
  strokeWeight(0.5);
  noStroke();

  pic =  loadImage("pic6.jpg");
  for (int i = 0; i<painterCount; i++) {
    painter[i] = new PVector(random(width), random(height));
    speed = random(-speedMax, speedMax);
    velocity[i] = new PVector(-speed, speed);
    polySwitch[i] = false;

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

    float bright = 0.3 * red(c)/255 + 0.6 * green(c)/255 + 0.1*blue(c)/255;
    float shapeSizeOffset = map(bright, 1, 4, 5, -5);
    print(bright+",");    
    //bright = map(bright, 1, 5, 2, 0.1);

    if (abs(colorSum1-colorSum2)>50) {

      speed = random(speedMax, -speedMax);
      velocity[i] = new PVector(random(- speedMax, speedMax), random(- speedMax, speedMax));
      polySwitch[i] = true;
    } else {
      strokeWeight(map(bright, 0, 1, 1.5, 0.1));
      fill(c);
      stroke(c);
      //stroke(255);
      //stroke(c-30);
      //strokeWeight(0.5);

      if (bright < 0.6) {
        line(temp.x, temp.y, painter[i].x, painter[i].y);
      }


      int v1 = 0;
      int v2 = 0;
      boolean drawShape = false;
      if ( polySwitch[i] && painterCount-i > drawVertexRange) {

        for (int k=1; k<20; k++) {

          if (PVector.dist(temp, painter[i+k]) < drawVertexDist+shapeSizeOffset) {
            if (v1==0) {
              v1 = k;
            } else {
              v2 = k;
              drawShape = true;
              k = 20;
            }
          }
        }

        if (drawShape) {
          noStroke();
          //strokeWeight(0.1);
          //stroke(0);
          beginShape(TRIANGLES);
          vertex(temp.x, temp.y);
          vertex(painter[i+v1].x, painter[i+v1].y);
          vertex(painter[i+v2].x, painter[i+v2].y);
          endShape();
          polySwitch[i] = false;
          drawShape = false;
        }
      }

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