import de.voidplus.leapmotion.*;

LeapMotion leap;


boolean takenSwitch;
boolean messLive;
boolean rebornSwitch;
float thetaX, thetaY, thetaZ, translateX, translateY, handTempX, handTempY;

void setup() {
  size(1920, 1000, P3D);
  leap = new LeapMotion(this);

  takenSwitch = false;
  messLive = true;
  rebornSwitch = false;
  thetaX = random(360);
  thetaY = random(360);
  thetaZ = random(360);
  translateX = width/2;
  translateY = height/2;
  handTempX = 0;
  handTempY = 0;
}

void draw() {
  background(255);
  stroke(0);
  line(width/2-520, 0, width/2-520, height);
  line(width/2+520, 0, width/2+520, height);
  if (translateX > 1600) {
    messLive = false;
  }
  if (messLive == true) {
    for (int i = 0; i<50; i++) {
      pushMatrix();
      translate(translateX, translateY);
      rotateX( thetaX+3*i);
      rotateY( thetaY+4*i);
      rotateZ( thetaZ+2*1);
      noFill();
      stroke(0);
      strokeWeight(2.5-0.04*i);
      ellipse(0, 0, 40+5*i, 40+5*i);
      translate(width, height);
      popMatrix();
    }
  }


  for (Hand hand : leap.getHands ()) {
    if (rebornSwitch == false) {
      hand.draw();
    }
    float   hand_pinch       = hand.getPinchStrength();
    PVector hand_position = hand.getPosition();
    println(hand_pinch);

    for (Finger finger : hand.getFingers ()) {
      if (rebornSwitch == false) {
        finger.draw();
      }
    }

    //taken judgement
    float distance = dist(hand_position.x, hand_position.y, width/2, height/2);
    if (hand_pinch > 0.7 && distance<200) {
      takenSwitch = true;
      handTempX = hand_position.x;
      handTempY = hand_position.y;
    }

    if (takenSwitch == true) {
      translateX = hand_position.x-handTempX+width/2;
      translateY = hand_position.y-handTempY+height/2;
    }

    //reborn judgement
    float hand_grab = hand.getGrabStrength();
    if (messLive == false && hand_grab ==1) {
      setup();
      rebornSwitch = true;
    }
    println(hand_position.x, hand_position.y, distance, hand_grab);
  }
  thetaX += 0.01;
  thetaY += 0.02;
  thetaZ += 0.05;

  println(takenSwitch);
//  saveFrame("rendering/work####.tga");
}

