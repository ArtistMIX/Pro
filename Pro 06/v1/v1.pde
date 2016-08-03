int number = 50;
Sweeper [] sweepers = new Sweeper [number];
float x, y;


void setup() {
  size(800, 800);
  background(255);
  smooth();
  stroke(0);
  strokeWeight(5);
  translate(width/2, height/2);
  for (int i =0; i<number; i++) {

    sweepers[i] = new Sweeper(0, 0, random(-2, 2), random(-2, 2));
  }
}


void draw() {
  translate(width/2, height/2);
  //  background(255);

  for (int i = 0; i<number; i++ ) {
    if (i % 2 == 0 ) {
      x = 30*sin(0.005*frameCount)+20;
      stroke(0, x);
    } else {
      y = 40*sin(0.008*frameCount+30)+60;
      stroke(255, y);
    }
    sweepers[i].display();

    if (x < 0) {
      int number2 = 500;
      Sweeper [] s = new Sweeper [ number2];
      fill(255, 100);
      for (int j =0; j<number; j++) {
        sweepers[j] = new Sweeper(random(-width/2, width/2), random(-200, 200)
          , random(-2, 2), random(-2, 2));
      }
    }
  }
  println(x);
  //saveFrame("rendering/artwork####.jpeg");
}