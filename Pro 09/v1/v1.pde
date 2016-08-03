ArrayList yns;
float angle;
color [] palette ={#4F2C81, #768314, #9B2727, #207144 };
int colorCheck;

void setup() {
  size(1920, 1080, P3D); 
  background(0);
  yns =  new ArrayList();
  //fill(#4F2C81, 220);
  colorCheck = 0;
  stroke(0);
}

void draw() {

  //if (startAngle != endAngle+360) {
  //  startAngle += 10;
  //  yns.add(new YinYang(mouseX, mouseY, random(50, 100), random(360)));
  //} 

  blendMode(ADD);

  for (int i = 0; i< yns.size(); i++) {
    ((YinYang)yns.get(i)).update();
    ((YinYang)yns.get(i)).drawing();
    if (((YinYang)yns.get(i)).r>0.5) {
      yns.add(new YinYang(((YinYang)yns.get(i)).x, ((YinYang)yns.get(i)).y, ((YinYang)yns.get(i)).r*0.55, ((YinYang)yns.get(i)).angle*1.9));
    }
  }
  for (int i=0; i <yns.size(); i++) {
    if (((YinYang)yns.get(i)).r<2) {
      yns.remove(i);
    }
  }
  println( yns. size());
}

void mousePressed() {
  fill(palette[colorCheck]);
  yns.add(new YinYang(mouseX, mouseY, random(58, 60), angle));
  angle += 90;
  colorCheck ++;
  if (colorCheck ==4) {
    colorCheck = 0;
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("rendering/work.png");
  }
}