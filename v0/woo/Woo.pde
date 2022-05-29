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

PFont f;
String s = "";
float x = 70;

void setup() {
  //size(600, 600);
  fullScreen();
  
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
  fill(0, 0, 0);
  f = loadFont("yoster.ttf");
  s = "i want cheesecake!";
  textFont(f);
  textSize(40);
  dialogue(s);
}

void draw() {
  //background(255);
  
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
      offset = 6;
      yGret -= 5;
      gretLeads = true;
      hansLeads = false;
    }
    else if (keyCode == DOWN) {
      offset = 0;
      yHans += 5;
      hansLeads = true;
      gretLeads = false;
    }
    else if (keyCode == LEFT) {
      offset = 3;
      xHans -= 5;
      hansLeads = true;
      gretLeads = false;
    }
    else if (keyCode == RIGHT) {
      offset = 9;
      xGret += 5; 
      gretLeads = true;
      hansLeads = false;
    }
  }
  if (delay == 0) {
    currentFrame = (currentFrame + 1) % loopFrames;
  }
  delay = (delay + 1) % 5;
}

void dialogue(String sentence) {
  for (int i = 0; i < sentence.length(); i++) {
    text(sentence.charAt(i), x, 800);
    x = x + 25;
  }
}
