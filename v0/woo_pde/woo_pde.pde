int xGret = 50;
int yGret = 50;

int xHans = 30;
int yHans = 50;

float xspeed = 0;
float yspeed = 0;

float xaccel = 0;
float yaccel = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  ellipse(xGret, yGret, 30, 30); 
  ellipse(xHans, yHans, 30, 30);
  
  //background(255);
  stroke(0);
  //fill(175);
  
  xspeed += xaccel;
  yspeed += yaccel;
  
  xHans += xspeed;
  yHans += yspeed;
  
  if (xGret > xHans) {
    xaccel = 0.1;
  } else {
    xaccel = -0.1;
  }
  
  if ((yGret > yHans) && (abs(yGret - yHans) < 5)) {
    yaccel = 0.1;
  } else if ((abs(yGret - yHans) < 5)) {
    yaccel = 0;
  } else {
    yaccel = -0.1;
  }

  // If the ball touches the wall, reverse its direction.\
  /**
  if (x > width) {
    xspeed = -xspeed;
  } else if (x < 0) {
    xspeed = -xspeed;
  }

  if (y > height) {
    yspeed = -yspeed;
  } else if (y < 0) {
    yspeed = -yspeed;
  }
  **/
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      yGret -= 5;
    } else if (keyCode == DOWN) {
      yGret += 5;
    } else if (keyCode == LEFT) {
      xGret -= 5;
    } else if (keyCode == RIGHT) {
      xGret += 5; 
    }
  }
}
