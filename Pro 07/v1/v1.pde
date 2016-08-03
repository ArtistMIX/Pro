float x ;
int disThreshold = 1800;
float offset = 0;


void setup() {
  size(800, 800);
  x= -width/2-disThreshold;
  rectMode(CENTER);
}

void draw() {
  background(255, 100);
  translate(width/2, height/2);

  if (x> height/2+disThreshold) {
    x=-width/2-disThreshold;
  }

  fill(0);
  noStroke();
  for (int i = 0; i<99; i++) {

    float rectDis =sqrt(sq(x-(-250+5*i)));
    float rectSize;


    for (int j = 0; j<99; j++) {

      if (rectDis >500) {
        rectSize = 2;
      } else {
        rectSize = map(rectDis, 0, 500, 9, 2);
      }

      //      stroke(0);
      //      strokeWeight(3);
      //      fill(255);
      //      rect(200, 0, 20, height);
      //      noStroke();

      //offset
      if (-250+5*j < 0)
      { 
        offset =0.005*map(rectDis, 0, 100, 100, 0);
        fill(0);
      } else if 
        (-250+5*j == 0) {
        noFill();
        offset = 0;
      } else if 
        (-250+5*j > 0) {
        fill(0);
        offset = 0.005* map(rectDis, 0, 100, 100, 0);
      }

      rect(-width/2+8*i, -height/2+8*j+offset*j, rectSize, rectSize);
    }
  }

  //  ellipse(x, 100, 20, 20);

  x=x+4;
//  saveFrame("work/rendering####.png");
}

