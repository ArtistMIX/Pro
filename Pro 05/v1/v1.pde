float [] x = new float [7];
float [] y = new float [7];
float timer = 0;

void setup() {
  size(1920, 1080, P2D);
  background(0);
  ellipseMode(CENTER);
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  //  background(0);
  fill(255, 50);
  for (int i = 0; i <7; i++) {

    if (i %2 == 0) {
      fill(128+128*(-sin(timer)), 30);
      x[i] = cos((i+0.5)*timer)*(1+i)*40;
      y[i] = sin((i+0.5)*timer)*(1+i)*40;
      ellipse(x[i], y[i], (i+1)*40, (i+1)*40);
    }

    if (i%2 ==1) {
      fill(128+128*sin(timer), 30);
      x[i] = cos((i+0.5)*timer)*(1+i)*40;
      y[i] = sin((i+0.5)*timer)*(1+i)*40;
      ellipse(x[i], y[i], (i+1)*40, (i+1)*40);
    }

    timer = timer+ 0.002;
    //saveFrame("rendering/artwork####.jpeg");
    //    println(x[0], x[5], x[4], timer);
  }
}