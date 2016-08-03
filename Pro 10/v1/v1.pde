float theta, phi;
float r = 0;
float g = 0;

void setup() {
  size(800, 800, P2D); 
  background(0);
  theta = 0;
  phi = 0;

  stroke(255);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  //ellipse(0, 0, 20, 20);
  camera(0, 0, -500, 0, 0, 0, 0, -1, 0);

  for (int k = 0; k<3; k++) {


    for (int i =0; i<50; i++) {
      for (int j = 0; j<10; j++) {
        pushMatrix();
        rotate(120*k);
        r = 120*tan(radians(theta+7.2*i))-200;
        float px = r*cos(radians(phi+7.2*i));
        float px2 = r*cos(radians(phi+7.2*(i-1)));
        float py = r*sin(radians(phi+7.2*i));
        float py2 = r*cos(radians(phi+7.2*(i-1)));
        float pz = 0;
        strokeWeight(.5);
        line(px, py, px2, py2);
        fill(255);
        strokeWeight(5);
        point (px, py, pz);

        popMatrix();
      }
    }
  }
  /*for (int i = 0; i<20; i++) {
   for (int j =0; j<20; j++) {
   //pushMatrix();
   float px = r*cos(radians(phi+18*j));
   float py = r*sin(radians(theta+18*i));
   float pz = r*sin(radians(phi+18*j));
   //translate(px, py, pz);
   
   //sphere(20);
   //popMatrix();
   }
   }*/
  r++;
  theta += .5;
  //phi += .5;
  //saveFrame("rendering/work####.jpeg");
}