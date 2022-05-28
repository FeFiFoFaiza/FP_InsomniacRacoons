PImage hansel;
PImage gretel;

PImage playerImages [];
PImage ememyImages [];
int playerFrames;
int enemyFrames;
int currentFrame = 0;
float x, y;


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
  hansel = loadImage("Hansel/hans_front_1.png");
  gretel = loadImage("Gretel/gret_1.png");
  
  playerFrames = 12;
  enemyFrames = 12;
  playerImages = new PImage[playerFrames];
  for (int i = 1; i < playerFrames; i++) {
    playerImages[i] = loadImage("Gretel/gret_" + i + ".png");
  }
}

void draw() {
  background(255);
  image(gretel, xGret-35, yGret-35, 70, 70); 
  image(hansel, xHans-35, yHans-35, 70, 70);
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
    }
    else if (keyCode == DOWN) {
      yHans += 5;
      hansLeads = true;
      gretLeads = false;
    }
    else if (keyCode == LEFT) {
      xHans -= 5;
      hansLeads = true;
      gretLeads = false;
    }
    else if (keyCode == RIGHT) {
      xGret += 5; 
      gretLeads = true;
      hansLeads = false;
    }
    
    currentFrame++;
    if (currentFrame == playerFrames) {
      currentFrame = 0;
    }
  }
}
  
void display() {
  image(playerImages[currentFrame], x, y);
}
