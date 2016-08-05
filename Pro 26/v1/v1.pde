PImage pic;

//Controller
int countColumn =40;
int countRow = 60; //countColumn * 2.85

//Generator in Class
color[] textColor = new color[countColumn*countRow];
float[] sign = new float[countColumn*countRow];
float[] bright = new float[countColumn*countRow];
boolean[] textDisplay = new boolean[countColumn*countRow];
float[] displaySizeHorizon = new float[countColumn*countRow];
//float[] displaySizeVerticle =  new float[countColumn*countRow];
int spaceHorizon = 37;
int spaceVerticle = 10;

//int[] index = new int[countColumn*countRow];

//Generator
PFont textFont;


String[] text = {"Olympic","Olympic", "Rio", "2016", "2016", "Taiwan", "Hsieh", "Taiwan"};



void setup() {
  size(1169, 800); //pic6
  background(255);
  fill(255);
  stroke(0);
  textFont =  createFont("Impact.TTF", 16);
  textFont(textFont);
  //blendMode(OVERLAY);

  //noStroke();

  pic =  loadImage("pic7.jpg");
  pic.loadPixels();
  image(pic, 0, 0);
  //print(pixels[200]);

  for (int i = 0; i<countRow; i++) {   //Y Axis
    for (int j = 0; j<countColumn; j++) {   //X Axis

      //text(text, i*width/countColumn, j*height/countRow, 70, 80);
      textColor[countColumn*i+j] = pic.get((int)j*width/countColumn+spaceHorizon*j, (int)i*height/countRow+spaceVerticle*i);
      bright[countColumn*i+j] = 0.3 * red(textColor[countColumn*i+j])/255 + 0.6 * green(textColor[countColumn*i+j])/255 + 0.1*blue(textColor[countColumn*i+j])/255;
      sign[countColumn*i+j] = bright[countColumn*i+j];
      textDisplay[countColumn*i+j] = false;
      displaySizeHorizon[countColumn*i+j] = 1;
    }
  }
}


void draw() {
  //background(255);
  //image(pic, 0, 0);





  //ellipse(i*width/countColumn, j*height/countRow, 50*bright, 50*bright);


  //saveFrame("rendering/Rendering####.jpg");
}

void detect() {
  image(pic, 0, 0);
  blendMode(MULTIPLY);

  //Detect
  for (int i = 0; i<countRow; i++) {
    for (int j = 0; j<countColumn; j++) {
      for (int k = -20; k<20; k++) {

        if (countRow*i+j> 20 && bright[countColumn*i+j] > sign[countColumn*i+j+k] ) {
          if (abs(bright [countColumn*i+j] -bright[countColumn*i+j+k]) < 0.6) {

            textDisplay[countColumn*i+j+k] = false;
            displaySizeHorizon[countColumn*i+j] += 0.2;
          } else {
            k =20;
          }
        } else {
          k = 20;
        }
      }
    }
  }
  blendMode(NORMAL);
}

void textDisplay() {
  image(pic, 0, 0);
  blendMode(OVERLAY);
  //blendMode(SCREEN);
  //blendMode(BLEND);
  for (int i = 0; i<countRow; i++) {
    for (int j = 0; j<countColumn; j++) {

      //fill(textColor[countColumn*i+j]);
      fill(255);

      if (bright[countColumn*i+j] >= sign[countColumn*i+j]) {
        sign [countColumn*i+j] = bright [countColumn*i+j] ;
        textDisplay[countColumn*i+j] = true;
      }

      //bright = map(bright, 0.1, 1.2, 0.5, 2);    
      //print(bright+",");


      //Draw
      if (sign[countColumn*i+j] > 0.02 && textDisplay[countColumn*i+j]) {
        textSize(10+displaySizeHorizon[countColumn*i+j]);

        text(text[(int)random(1, 8)], j*width/countColumn+spaceHorizon*j-40, i*height/countRow+spaceVerticle*i);
      }
    }
  }
  blendMode(NORMAL);
}

void mousePressed() {
  //detect();
  //text(text, temp.x, temp.y, 70, 80);
  saveFrame("rendering/rendering####.jpg");
}

void keyPressed() {
  if (key == 'a') {
    textDisplay();
  } else if (key == 'b') {
    detect();
  }
}