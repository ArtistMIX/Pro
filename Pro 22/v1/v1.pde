int countInLine = 30;
PVector[] points = new PVector[900];
PVector center = new PVector(0, -100, -200);


void setup() {
  size(800, 800, P3D);
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();

  for (int i = 0; i<countInLine; i++) {
    for (int j = 0; j<countInLine; j++) {

      points[countInLine*i+j]= new PVector(25*i, 0, 25*j); 
      point(points[countInLine*i+j].x, 0, points[countInLine*i+j].z);
    }
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  //camera(0, 0, 0, 0, 0, 0, 0, 1, 0);
  camera(0, -100-650-200, 500+200, 0, 0, 0, 0, 1, 0);

  for (int i = countInLine-1; i>0; i--) {
    for (int j = countInLine-1; j>0; j--) {
      float dist = PVector.dist(points[countInLine*i+j], center);

      //float offsetY = map(dist,0,5,0,400)*sin(radians(frameCount));
      //if (dist<500) {
      float offsetY = -dist*0.3*sin(radians(frameCount*1.5+dist));
      points[countInLine*i+j]= new PVector(-600+40*i, offsetY, -700+40*j);
      //}
      //points[countInLine*i+j]= new PVector(-200+25*i, offsetY, 25*j); 
      //point(points[countInLine*i+j].x,200, points[countInLine*i+j].z);
      if (i!= countInLine-1) {
        line(points[countInLine*i+j].x, points[countInLine*i+j].y, points[countInLine*i+j].z, 
          points[countInLine*(i+1)+j].x, points[countInLine*(i+1)+j].y, points[countInLine*(i+1)+j].z);
      }

      if (j != countInLine-1) {
        line(points[countInLine*i+j].x, points[countInLine*i+j].y, points[countInLine*i+j].z, 
          points[countInLine*i+j+1].x, points[countInLine*i+j+1].y, points[countInLine*i+j+1].z);
      }
    }
  }

  //center.x = 10*cos(radians(frameCount));
  //center.z = -200+100*sin(radians(frameCount));
  point(center.x, center.y, center.z);
  //saveFrame("work/render####.jpg");
}