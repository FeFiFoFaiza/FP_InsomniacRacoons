PImage hansel, gretel, bg;

PImage gretelImages [];
PImage hanselImages [];

int gretelFrames, hanselFrames;

boolean up, down, left, right;
boolean startG = true;
Dialogue dialogue;

Background peep;
Kid kid;

void setup() {
  size(1600, 960);
  background(202, 158, 81);
  peep = new Background();
  gretelFrames = 12;
  hanselFrames = 12;
  
  //gretelImages = new PImage[gretelFrames];
  //hanselImages = new PImage[hanselFrames];
  //for (int i = 0; i < gretelFrames; i++) {
  //  gretelImages[i] = loadImage("Gretel/gret_" + i + ".png");
  //}
  //for (int i = 0; i < hanselFrames; i++) {
  //  hanselImages[i] = loadImage("Hansel/hans_" + i + ".png");
  //}
  
  dialogue = new Dialogue();
  kid = new Kid();
  
  up = false;
  down = false;
  left = false;
  right = false;
}

void draw() {
  //background(peep.bgImage());
  
  //kid.whoLeads();
  //kid.walk();
  //kid.display();
  
  //text("cheese", 100, 500);
  //fill(0, 0, 0);
  //font = createFont("west-england.regular.ttf", 64);
  //s = "i want cheesecake!";
  //textFont(font, 64);
  //textSize(50);
  //dialogue(s);
  //stroke(0);
  
  //if (startG) {
  //  dialogue.startGame();
  //}
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      up = true;
      down = false;
      left = false;
      right = false;
    }
    if (keyCode == DOWN) {
      down = true;
      up = false;
      left = false;
      right = false;
    }
    if (keyCode == LEFT) {
      left = true;
      up = false;
      down = false;
      right = false;
    }
    if (keyCode == RIGHT) {
      right = true;
      up = false;
      down = false;
      left = false;
    }
  }
}

void keyReleased() {
  up = false;
  down = false;
  left = false;
  right = false;
}


//void dialogue(String sentence) {
//  for (int i = 0; i < sentence.length(); i++) {
//    text(sentence.charAt(i), x, 800);
//    x = x + 30;
//  }
//}
