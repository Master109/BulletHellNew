final float BORDER_WIDTH = 25;
final int RIGHT_BOUND = 600;

Player p;
boolean[] keys;
PImage img1;
String[] data, data2;
int currentLevel = 1;

void setup()
{
  size(900, 800);
  frameRate(60);
  smooth();
  imageMode(CENTER);
  p = new Player();
  img1 = loadImage("Girl1.png");
  img1.resize(int(2208 * .02), int(2402 * .02));
  keys = new boolean[4];
  data = loadStrings("Other Data.txt");
  if (data[1].equals("true"))
  {
    data2 = new String[10];
    data2[0] = "Level 1 Highscore";
    saveStrings("Save Data.txt", data2);
  }
}

void draw()
{
  background(255);
  p.run();
  p.show();
  stroke(0);
  strokeWeight(1);
  line(BORDER_WIDTH, BORDER_WIDTH, BORDER_WIDTH, height - BORDER_WIDTH);
  line(RIGHT_BOUND - BORDER_WIDTH, BORDER_WIDTH, RIGHT_BOUND - BORDER_WIDTH, height - BORDER_WIDTH);
  line(BORDER_WIDTH, height - BORDER_WIDTH, RIGHT_BOUND - BORDER_WIDTH, height - BORDER_WIDTH);
  line(BORDER_WIDTH, BORDER_WIDTH, RIGHT_BOUND - BORDER_WIDTH, BORDER_WIDTH);
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
  int speed, lives, bomb;

  Player()
  {
    loc = new PVector(RIGHT_BOUND / 2 + BORDER_WIDTH / 2, height - BORDER_WIDTH);
    speed = 4;
  }

  void show()
  {
    image(img1, loc.x, loc.y);
    stroke(#08BCBB);
    strokeWeight(5);
    point(loc.x, loc.y);
  }

  void run()
  {
    vel = new PVector();
    if (keys[0])
      vel.x = -(speed / sqrt(2));
    else if (keys[1])
      vel.x = speed / sqrt(2);
    if (keys[2])
      vel.y = -(speed / sqrt(2));
    else if (keys[3])
      vel.y = speed / sqrt(2);
    if (vel.equals(new PVector(speed / sqrt(2), 0)))
      vel.x = speed;
    else if (vel.equals(new PVector(-(speed / sqrt(2)), 0)))
      vel.x = -speed;
    else if (vel.equals(new PVector(0, speed / sqrt(2))))
      vel.y = speed;
    else if (vel.equals(new PVector(0, -(speed / sqrt(2)))))
      vel.y = -speed;
    if (loc.x + vel.x > BORDER_WIDTH && loc.x + vel.x < RIGHT_BOUND - BORDER_WIDTH && loc.y + vel.y > BORDER_WIDTH && loc.y + vel.y < height - BORDER_WIDTH)
      loc.add(vel);
  }
}


