PImage hansel;
PImage gretel;

PImage gretelImages [];
PImage hanselImages [];
//PImage enemyImages [];

int gretelFrames;
int hanselFrames;
//int enemyFrames;

int currentFrame = 0;
int loopFrames = 3;
int offset = 0;
int delay = 0;

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
  
  gretelFrames = 12;
  hanselFrames = 12;
  //enemyFrames = 12;
  gretelImages = new PImage[gretelFrames];
  hanselImages = new PImage[hanselFrames];
  for (int i = 0; i < gretelFrames; i++) {
    gretelImages[i] = loadImage("Gretel/gret_" + i + ".png");
  }
  for (int i = 0; i < hanselFrames; i++) {
    hanselImages[i] = loadImage("Hansel/hans_" + i + ".png");
  }
}

void draw() {
  background(255);
  image(gretelImages[currentFrame + offset], xGret-35, yGret-35, 70, 100); 
  image(hanselImages[currentFrame + offset], xHans-35, yHans-35, 70, 100);
  stroke(0);

  if (gretLeads) {
    xHspeed = 0.03*(xGret - xHans);
    yHspeed = 0.03*(yGret - yHans);
    
    println(xHspeed + " " + yHspeed);
    
    xHans += xHspeed;
    yHans += yHspeed;
  }
  
  else if (hansLeads) {    
    xGspeed = -0.03*(xGret - xHans);
    yGspeed = -0.03*(yGret - yHans);
    
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
      offset = 6;
    }
    else if (keyCode == DOWN) {
      yHans += 5;
      hansLeads = true;
      gretLeads = false;
      offset = 0;
    }
    else if (keyCode == LEFT) {
      xHans -= 5;
      hansLeads = true;
      gretLeads = false;
      offset = 3;
    }
    else if (keyCode == RIGHT) {
      xGret += 5; 
      gretLeads = true;
      hansLeads = false;
      offset = 9;
    }
  }
  if (delay == 0) {
    currentFrame = (currentFrame + 1) % loopFrames;
  }
  delay = (delay + 1) % 5;
}
