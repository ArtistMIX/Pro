//Map
PShape mapAll; 
PShape[] map = new PShape[5];
PVector[][] mapVertices = new PVector[5][];
PVector mapOffset = new PVector(-110, 0);
PVector[] continentCenter = new PVector[5];

//Circle
PVector[][] circle = new PVector[5][];
float circleR = 110;
PVector[] circleOffset = new PVector[5];
color[] circleColor = {#F3C301, #009E3D, #000000, #0085C8, #E00024};

PVector[][] vertices = new PVector[5][];
int[] vertexCount = new int[5];
boolean state = false;
float timer = 0;

float strokeCurrent = 5;
float strokeMap = 3;
float strokeCircle = 16;

PImage oly;

void setup() {

  size(800, 800);
  oly = loadImage("oly.jpg");
  mapAll = loadShape("Continents Map.svg");

  map[0] = mapAll.getChild("Asia");
  map[1] = mapAll.getChild("Oceania");
  map[2] = mapAll.getChild("Africa");
  map[3] = mapAll.getChild("Europe");
  map[4] = mapAll.getChild("America");

  //Circle Display
  float stepX = 126;
  float stepY = 130;
  circleOffset[3] = new PVector(-55, 130); //Europe
  circleOffset[2] = new PVector(-55+stepX*2, 130); //Africa
  circleOffset[4] = new PVector(-55+stepX*4, 130); //America
  circleOffset[0] = new PVector(-55+stepX*1, 130+stepY); //Asia
  circleOffset[1] = new PVector(-55+stepX*3, 130+stepY); //Oceania


  for (int i = 0; i < 5; i++) {

    vertexCount[i] = map[i].getVertexCount();

    vertices[i]= new PVector[vertexCount[i]];
    mapVertices[i] = new PVector[vertexCount[i]];
    circle[i] = new PVector[vertexCount[i]];

    //Get Continent Center
    PVector centerTemp = new PVector(0, 0);

    for (int j = 0; j < vertexCount[i]; j++) {
      PVector verticleVec = map[i].getVertex(j);

      mapVertices[i][j] = verticleVec;
      mapVertices[i][j].add(mapOffset);
      vertices[i][j] =  mapVertices[i][j];

      //Circle Vector
      circle[i][j] = PVector.fromAngle(radians(j*360/vertexCount[i]));
      circle[i][j].mult(circleR);
      circle[i][j].add(circleOffset[i]);

      //Caculate Continent Center
      centerTemp.add(mapVertices[i][j]);
      if (j == vertexCount[i]-1) {
        continentCenter [i] = PVector.div(centerTemp, vertexCount[i]);
      }
    }
  }
}


void draw() {
  background(255);
  translate(200, 200);
  //image(oly, -200, -86, 800, 565);

  for (int i = 0; i < 5; i++) {

    for (int j = 0; j < vertexCount[i]; j++) {

      PVector start = new PVector();
      PVector end = new PVector();

      if (state) {
        start = circle[i][j];
        end = mapVertices[i][j];

        strokeCurrent = lerp(strokeCircle, strokeMap, timer);
        strokeWeight(strokeCurrent);

        PVector temp = PVector.sub(vertices[i][j], continentCenter[i]);
        PVector temp2 = PVector.mult(temp, timer-0.1);
        temp.mult(timer);

        strokeWeight(1);
        line(continentCenter[i].x+temp2.x, continentCenter[i].y+temp2.y, 
          continentCenter[i].x+temp.x, continentCenter[i].y+temp.y);

        strokeWeight(strokeCurrent);
      } else {
        start = mapVertices[i][j];
        end = circle[i][j];

        strokeCurrent = lerp( strokeMap, strokeCircle, timer);
        strokeWeight(strokeCurrent);
      }

      vertices[i][j] = PVector.lerp(start, end, timer);

      fill(circleColor[i]);
      stroke(circleColor[i]);
      point(vertices[i][j].x, vertices[i][j].y);
    }
  }

  if (timer > 0.998 ) {
    state = !state;
    timer = 0;
  }

  timer += 0.04*(1-timer);

  //saveFrame("rendering/rendering####.jpg");
}