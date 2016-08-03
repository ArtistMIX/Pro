float r ;
float theta, phi;
float turning = 0;
void setup() {
  size(1920, 1280, P3D);
}

void draw() {
  background(0);

  translate(width/2, height/2);
  camera(width/2, height/2-300-260, 0, 0, 0, 0, 0, - 1, 0);
  println(mouseX, mouseY);
  //rotateY(turning);
  for (int j = 0; j<6; j++) {
    pushMatrix();
    rotateY(j*60);

    float times = 1.3;
    for (int i = 0; i<1080; i++) {
      r = 200-0.35*i*1*0.5;
      theta = 2*(0.5*i+1);
      phi = 1*(0.5*i+1);
      float px =  times*r*cos(radians(theta));
      float py =  times*0.5*i-height/2+300;
      float pz =  times*r*sin(radians(theta));

      r = 200-0.35*(0.5*i-1);
      float thetaTemp = 2*(0.5*i-100);
      float phiTemp = 1*(0.5*i-100);
      float pxTemp =  times*r*cos(radians(thetaTemp));
      float pyTemp =  times*(0.5*i-101)-height/2+300;
      float pzTemp =  times*r*sin(radians(thetaTemp));
      stroke(255);
      strokeWeight(1);
      //scale(1.003, 1, 1.003);
      //scale(1.001, 1, 1.001);
      blendMode(ADD);
      stroke(215);
      point(px, py, pz);
      point(pxTemp, pyTemp, pzTemp);
      strokeWeight(0.3);
      line(px, py, pz, pxTemp, pyTemp, pzTemp);
    }
    popMatrix();
  }  
  //scale(4);

  for (int k = 0; k<250; k++) {
    float px = random(-width/2, width/2);
    float py = random(-height/2, height/2);
    float pz = random(-500, 200);
    blendMode(NORMAL);
    stroke(255);
    strokeWeight(random(3));
    //fill(255);
    point(px, py, pz);
  }
  turning += 0.1;
}


void keyPressed() {
  //saveFrame("work/rendering.tga");
}