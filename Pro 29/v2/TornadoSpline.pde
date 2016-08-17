class TornadoSpline {

  //Tornado Main
  float splineHeight = 500;
  float offsetY = 300;
  int pointCount = 400;

  float twistRadiusMax = 80;
  float twistRadiusMin = 10;
  int helixAngle = 3500;
  float circleRadiusMax = 60;
  PVector[] point = new PVector[pointCount];
  boolean ellipseDisplay = false;

  //Radius Velocity
  float radiusVelocityMax = 3;
  float[] radiusVelocity = new float[pointCount];

  //Timer
  float timer = 0;
  float speed = 1;

  TornadoSpline() {
    for (int i = 0; i<pointCount; i++) {

      if (i != 0) {
        float velocity = random(-radiusVelocityMax, radiusVelocityMax);
        radiusVelocity[i] = velocity+ radiusVelocity[i-1];
      }

      float splineRadius =  twistRadiusMin + map(i, 0, pointCount, 0, twistRadiusMax)+radiusVelocity[i];
      float x = splineRadius* cos(radians(timer+i*helixAngle/pointCount));
      float y = offsetY - i*splineHeight/pointCount;
      float z = splineRadius* sin(radians(timer+i*helixAngle/pointCount));

      point[i] = new PVector(x, y, z);
    }
  }

  void run() {
    for (int i = 0; i<pointCount; i++) {
      if (i != 0) {
        float velocity = random(-radiusVelocityMax, radiusVelocityMax);
        radiusVelocity[i] = velocity+ radiusVelocity[i];
      }
      float splineRadius =  twistRadiusMin + map(i, 0, pointCount, 0, twistRadiusMax)+radiusVelocity[i];
      float x = splineRadius* cos(radians(timer+i*helixAngle/pointCount));
      float y = offsetY - i*splineHeight/pointCount;
      float z = splineRadius* sin(radians(timer+i*helixAngle/pointCount));

      //Draw
      point[i] = new PVector(x, y, z);
      pushMatrix();
      translate(0, y, 0);
      rotateX(radians(90));
      if (ellipseDisplay) {
        strokeWeight(3);
        float r = circleRadiusMax + i*circleRadiusMax/pointCount+10;
        ellipse(x, z, r, r);
      }

      popMatrix();
    }

    timer += speed;
  }

  void keyPressed() {
    ellipseDisplay = !ellipseDisplay;
  }
}