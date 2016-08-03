import com.leapmotion.leap.Controller;
import com.leapmotion.leap.processing.LeapMotion;
import com.leapmotion.leap.Frame;
import com.leapmotion.leap.Finger;
import com.leapmotion.leap.Bone;
import com.leapmotion.leap.Hand;
//import com.leapmotion.leap.HandList;
import com.leapmotion.leap.Vector;
import com.leapmotion.leap.Gesture;
import com.leapmotion.leap.GestureList;
//import com.leapmotion.leap.Pointable;
//import com.leapmotion.leap.Tool;
//import com.leapmotion.leap.ToolList;

PGraphics a;

LeapMotion leapMotion;
Controller controller;
Frame frame ;
Hand hand ;

boolean backgroundSwitch = false;
boolean drawSwitch = false;


void setup()
{
  fullScreen(P3D);
  //size(1920, 1080, P3D);
  //size(1280, 720, P3D);
  background(255);
  frameRate(30);
  a = createGraphics(width, height, P3D);
  leapMotion = new LeapMotion(this);
  controller = new Controller();
  frame = controller.frame();
  controller.enableGesture(Gesture.Type.TYPE_CIRCLE);
}

void draw()
{


  translate(width/2, height/2);

  controller = new Controller();
  frame = controller.frame();
  hand = frame.hands().frontmost();
  float strength = hand.grabStrength();
  println(strength);
  if (backgroundSwitch==true) {
    background(255);
  } else {
    if ( strength > 0.7) {
      background(255);
    }
  }
  for (Finger finger : frame.fingers()) {
    Vector p = finger.tipPosition();

    float px = map(p.getX(), 0, 360, -400, 400)+400;
    float py =  map(p.getY(), 360, 0, -400, 400);
    noStroke();
    //println(px, py);

    for (Bone.Type boneType : Bone.Type.values()) {
      Bone bone = finger.bone(boneType);
      Vector boneStart = bone.prevJoint();
      Vector boneEnd = bone.nextJoint();

      float boneStartX = map(boneStart.getX(), 0, 360, -500, 500)+400;
      float boneEndX = map(boneEnd.getX(), 0, 360, -500, 500)+400;
      float boneStarY =  map(boneStart.getY(), 360, 0, -500, 500);
      float boneEndY = map(boneEnd.getY(), 360, 0, -500, 500);

      fill(#ff0000);
      strokeWeight(15);
      stroke(#ff0000);
      point(boneStartX, boneStarY, boneStart.getZ());
      point(boneEndX, boneEndY, boneEnd.getZ());
      //background(255);

      //println("boneStart", boneStart, "boneEnd ", boneEnd, boneStartX, boneEndX);

      //a.beginDraw();
      //a.background(255);
      fill(0);
      stroke(0);
      strokeWeight(8);
      line(boneStartX, boneStarY, boneStart.getZ(), boneEndX, boneEndY, boneEnd.getZ());
      //a.endDraw();

      //for (Gesture gesture : frame.gestures()) {
      //  if ("TYPE_CIRCLE".equals(gesture.type().toString()) && "STATE_START".equals(gesture.state().toString())) {
      //    background(random(255), random(255), random(255));
      //  }
      //  int gestureToFind = gesture.id();
      //  GestureList manyGestures = frame.gestures(frame);
      //  for (Gesture gestureObject : manyGestures)
      //  {
      //    if (gestureObject.id() == gestureToFind) {
      //      //Process it...
      //    }
      //  }
      //}
    }
  }
  //image(a, -width/2, -height/2);
  if (drawSwitch==true) {
    background(255);
  }
  saveFrame("work/rendering####.targa");
}

void mousePressed() {
  drawSwitch = !drawSwitch;
  //backgroundSwitch = !backgroundSwitch;
}

void keyPressed() {
  drawSwitch = !drawSwitch;
}