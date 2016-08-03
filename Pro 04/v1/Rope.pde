class Rope {

  boolean scalePower;
  float space;
  boolean [] power;
  float [] d;
  int count;
  float wipeD ;
  int t = 0;
  boolean refresh;

  Rope() {
    power = new boolean [10];
    d = new float [10];
    space = 4;
    count = 0;
    wipeD = 0;
    refresh = false;
    for (int i = 0; i <10; i++) {
      power [i] = false;
      d[i] = -width/2;
      boolean scalePower = false;
    }
  }


  void display(int displayColor1, int displayColor2, int frameCounter) {
    fill(displayColor1);
    for (int i = 0; i <10; i++) {

      if (frameCounter % (8*(1+i)) ==0) {
        power[i] = true;
      }
      if (power[i] == true) {
        ellipse(d[i], (i-5)*80, 40, 40);
        d[i] = d[i] + space;
      }
    }
    for (int i = 0; i <10; i++) {

      if (frameCounter % (8*(1+i)) ==0) {
        power[i] = true;
      }
      if (power[i] == true) {
        ellipse((i-5)*80+40, d[i], 40, 40);
        d[i] = d[i] + space;
      }
    }
    fill(displayColor2);

    for (int i = 0; i <10; i++) {

      if (frameCounter % (8*(1+i)) ==0) {
        power[i] = true;
      }
      if (power[i] == true) {
        ellipse(d[i], (i-5)*80, 40, 40);
        d[i] = d[i] + space;
      }
    }
    for (int i = 0; i <10; i++) {

      if (frameCounter % (8*(1+i)) ==0) {
        power[i] = true;
      }
      if (power[i] == true) {
        ellipse((i-5)*80+40, d[i], 40, 40);
        d[i] = d[i] +space;
      }
    }
    println(count, d[9]);
  }

  void deter() {
    if (d[9]>width/2+100) {
      scalePower = true;
      refresh = true;
      count ++;
    }
  }


  void refresh() {
    if (refresh==true) {
      //      display(255, 255, t);
      for (int x = 0; x <22; x++) {
        t++;
        ellipse(-width/2+wipeD, -height/2+x*40, 44, 44);
        ellipse( -height/2+x*40, -width/2+wipeD, 44, 44);
        wipeD = wipeD+ 1;
      }
    }
  }


  void rotateScale() {
    if (scalePower == true) {
      rotate(count*90);
      scale(1+count);
    }
  }
}

