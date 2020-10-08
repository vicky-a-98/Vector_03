PVector pos = new PVector();
PVector dir = new PVector();
float speed = 0.08;
float size = 60;

//Size of window, position of ball before "game" starts 
void setup() {
  size(600, 500);
  rectMode(CENTER);
  pos.x = width/2;
  pos.y = height/2;
  
}

void draw() {
  background(300, 200, 300, 100);

//Position, color and shape of the object
  pos.add(dir);
  stroke(500, 100, 200, 200);
  fill(300, 500, 200, 200);
  ellipse(pos.x, pos.y, 50, 50);
  
//If mouse is pressed, then ellipse will get ready to move, creates line
  if (mousePressed == true) {
    line(pos.x, pos.y, mouseX, mouseY);
  }
//make ball bounce
  bounce();
}

void bounce()
{
  //Recreate/change balls direction when it touch the walls
  if (pos.x <= 0 || pos.x >= width) {
    dir.x = dir.x * -1;
  }
  if (pos.y <= 0 || pos.y >= height) {
    dir.y = dir.y * -1;
  }
}
//if you press the mouse during movement, it stops the ball
void mousePressed()
{
  pos.x = mouseX;
  pos.y = mouseY;
  dir.x = 0;
  dir.y = 0;
}

//Where you relese the line, decides the direction for the ball
void mouseReleased() {
  PVector input = new PVector(mouseX, mouseY);
  dir = input.sub(pos);
  dir = dir.mult(speed);
}
