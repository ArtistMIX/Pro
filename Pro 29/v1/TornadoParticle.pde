class TornadoParticle {

  int currentPointIndex;
  float x;
  float y;
  float z;
  float ySpeed;
  float ySpeedMax = 0.15;
  float ySpeedMin = 0.01;
  float offsetMax = 23;
  PVector velocity;

  boolean isDead = false;

  //Display
  float strokeMax = 200;
  float strokeMin = 10;
  float strokeWeightMax = 3.5;
  float strokeWeightMin = 1.2;

  TornadoParticle(TornadoSpline master) {

    currentPointIndex = (int)random(0, master.pointCount);

    x = master.point[currentPointIndex].x;
    y = master.point[currentPointIndex].y;
    z = master.point[currentPointIndex].z;

    //speed
    ySpeed = random(ySpeedMin, ySpeedMax);

    //Velocity
    velocity = new PVector(random(-offsetMax, offsetMax), random(-offsetMax, offsetMax), random(-offsetMax, offsetMax));
  }

  void run(TornadoSpline master) {
    update(master);
    display(master);
  }

  void update(TornadoSpline master) {

    y -= ySpeed;

    if (master.pointCount-currentPointIndex>1) {
      float lerpAmt = map(y, master.point[currentPointIndex].y, master.point[currentPointIndex+1].y, 1, 0);
      x = lerp(master.point[currentPointIndex+1].x, master.point[currentPointIndex].x, lerpAmt);
      z = lerp(master.point[currentPointIndex+1].z, master.point[currentPointIndex].z, lerpAmt);

      if (lerpAmt < 0.01) {
        currentPointIndex += 1;   //Add Jump Rate
      }
    } else {
      isDead = true;
    }
  }

  void display(TornadoSpline master) {
    float dist = sqrt(sq(x)+sq(z));
    float strokeWeight = map(dist, master.twistRadiusMin, master.twistRadiusMax, strokeWeightMax, strokeWeightMin);
    float strokePre = map(dist, master.twistRadiusMin, master.twistRadiusMax, strokeMin, strokeMax);
    float zDetect = map(z, -master.twistRadiusMax, master.twistRadiusMax, strokeMin, strokeMax);
    float stroke = (strokePre + zDetect)/2;

    stroke(stroke);
    strokeWeight(strokeWeight);
    point(x+velocity.x, y+velocity.y, z+velocity.z);
  }
}