import geomerative.*;

RShape grp;
RPoint[][] pointPaths;

float xmag, ymag, newYmag, newXmag = 0;
float z = 0;

boolean ignoringStyles = false;

void setup() {
  size(800, 800, P3D);

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  RG.ignoreStyles(ignoringStyles);

  RG.setPolygonizer(RG.ADAPTATIVE);

  grp = RG.loadShape("monkey6.svg");
  grp.centerIn(g, 100, 1, 1);

  pointPaths = grp.getPointsInPaths();
  background(0);
}

void draw() {
  translate(width/2, height/2+30);

  //newXmag = mouseX/float(width) * TWO_PI;
  //newYmag = mouseY/float(height) * TWO_PI;

  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0;
  }

  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0;
  }

  rotateX(-ymag); 
  rotateY(-xmag); 

  background(0);
  stroke(180);
  strokeWeight(2);
  //noFill();
  fill(0);
  //blendMode(ADD);
  z =8 * sin( frameCount/40.0 * PI)+4;

  for (int i = 0; i<pointPaths.length; i++) {
    translate(0, 0, z-4);

    if (pointPaths[i] != null) {
      beginShape();
      for (int j = 0; j<pointPaths[i].length; j++) {
        vertex(pointPaths[i][j].x, pointPaths[i][j].y);
      }
      endShape();
    }
  }
  //saveFrame("rendering/work####.jpg");
}

void mousePressed() {
  ignoringStyles = !ignoringStyles;
  RG.ignoreStyles(ignoringStyles);
}