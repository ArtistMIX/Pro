int count = 10;

void setup() {
  size(650, 650);
  background(0);
}

void draw() {
  translate(width/2, height/2);
  rotate(radians(90));
  background(0);
  for (int i = 0; i<8; i++) {
    spring(i);
  }
  //println(frameRate);
  //saveFrame("Render/render####.jpg");
}

void spring(int offset) {
  for (int i = 0; i<count; i++) {
    fill(0);
    stroke(255);
    strokeWeight(1.5);
    if (i%2==0) {
      fill(0);
    } else {
      fill(255);
    }
    //ellipse(0, -i*20*sin(radians(2*frameCount+offset*10)), 20+60*sqrt(sq(sin(radians(2*frameCount+offset*10+30*sin(radians(i*10))))))
    //  , 20+50*sqrt(sq(sin(radians(2*frameCount+offset*100+offset*10+30*sin(radians(i*120)))))));
    ellipse(0, -i*20*sin(radians(2*frameCount+offset*10)), 
      20+50*sqrt(sq(1/(0.1+sqrt(sq(tan(radians(frameCount+offset*10+5*sin(radians(i*2))))))))), 
      20+50*sqrt(sq(atan(radians(2*frameCount+offset*100+offset*10+30*sin(radians(i*120)))))));
  }
}