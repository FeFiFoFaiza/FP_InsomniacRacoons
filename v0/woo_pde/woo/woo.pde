PImage hansel;
PImage gretel;

int xGret = 200;
int yGret = 200;
float xGspeed = 0;
float yGspeed = 0;


int xHans = 170;
int yHans = 200;
float xHspeed = 0;
float yHspeed = 0;

boolean gretLeads;
boolean hansLeads;

void setup() {
  size(600, 600);
  hansel = loadImage("pixil-frame-0.png");
  gretel = loadImage("pixil-frame-0(1).png");
}

void draw() {
  background(0);
  image(gretel, xGret, yGret, 30, 30); 
  image(hansel, xHans, yHans, 30, 30);
  
  //background(255);
  stroke(0);
  //fill(175);

  
  if (gretLeads) {
    if (xGret > xHans + 30) {
      xHspeed = 1;
    } else {
      xHspeed = -1;
    }
  
    if (yGret > yHans) {
      yHspeed = 1;
    } else {
      yHspeed = -1;
    }
    
    xHans += xHspeed;
    yHans += yHspeed;
  } else if (hansLeads) {
    
    if (xGret + 30 < xHans) {
      xGspeed = 1;
    } else {
      xGspeed = -1;
    }
  
    if (yGret < yHans) {
      yGspeed = 1;
    } else {
      yGspeed = -1;
    }
    
    xGret += xGspeed;
    yGret += yGspeed;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      yGret -= 5;
      gretLeads = true;
      hansLeads = false;
    } else if (keyCode == DOWN) {
      yHans += 5;
      hansLeads = true;
      gretLeads = false;
    } else if (keyCode == LEFT) {
      xHans -= 5;
      hansLeads = true;
      gretLeads = false;
    } else if (keyCode == RIGHT) {
      xGret += 5; 
      gretLeads = true;
      hansLeads = false;
    }
  }
}
