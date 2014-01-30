import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class BulletHell extends PApplet {

final float BORDER_WIDTH = 25;

Player p;
boolean[] keys;
PImage img1;

public void setup()
{
  size(700, 700);
  frameRate(60);
  smooth();
  imageMode(CENTER);
  p = new Player();
  img1 = loadImage("Girl1.png");
  img1.resize(PApplet.parseInt(2208 * .02f), PApplet.parseInt(2402 * .02f));
  keys = new boolean[4];
}

public void draw()
{
  background(0);
  p.run();
  p.show();
}

public void keyPressed()
{
  if (keyCode == LEFT)
    keys[0] = true;
  else if (keyCode == RIGHT)
    keys[1] = true;
  else if (keyCode == UP)
    keys[2] = true;
  else if (keyCode == DOWN)
    keys[3] = true;
}

public void keyReleased()
{
  if (keyCode == LEFT)
    keys[0] = false;
  else if (keyCode == RIGHT)
    keys[1] = false;
  else if (keyCode == UP)
    keys[2] = false;
  else if (keyCode == DOWN)
    keys[3] = false;
}

class Player
{
  PVector loc, vel;
  int speed;

  Player()
  {
    loc = new PVector(width / 2, height - BORDER_WIDTH);
    speed = 4;
  }

  public void show()
  {
    image(img1, loc.x, loc.y);
  }

  public void run()
  {
    vel = new PVector();
    if (keys[0])
      vel.x = -speed;
    else if (keys[1])
      vel.x = speed;
    if (keys[2])
      vel.y = -speed;
    else if (keys[3])
      vel.y = speed;
    vel.setMag(speed);
    loc.add(vel);
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "BulletHell" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
