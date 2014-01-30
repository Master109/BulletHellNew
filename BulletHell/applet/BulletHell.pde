final float BORDER_WIDTH = 25;

Player p;
boolean[] keys;
PImage img1;

void setup()
{
  size(700, 700);
  frameRate(60);
  smooth();
  imageMode(CENTER);
  p = new Player();
  img1 = loadImage("Girl1.png");
  img1.resize(int(2208 * .02), int(2402 * .02));
  keys = new boolean[4];
}

void draw()
{
  background(0);
  p.run();
  p.show();
}

void keyPressed()
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

void keyReleased()
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

  void show()
  {
    image(img1, loc.x, loc.y);
  }

  void run()
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

