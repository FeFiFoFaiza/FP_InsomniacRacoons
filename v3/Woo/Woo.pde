PImage enemy;

PImage gretelImages [];
PImage hanselImages [];

int gretelFrames, hanselFrames;

boolean up, down, left, right;
boolean startG = true;
boolean tutorial = false;
boolean storyDialogue = false;
Dialogue dialogue;
String story;

Background peep;
Kid kid;
//Battle battle;

PFont font;
boolean inBattle; 

void setup() {
  kid = new Kid(100, 10);
  dialogue = new Dialogue();
  //battle = new Battle();
  
  size(1600, 960);
  //background(202, 158, 81);
  peep = new Background();
  
  gretelFrames = 12;
  hanselFrames = 12;
  gretelImages = new PImage[gretelFrames];
  hanselImages = new PImage[hanselFrames];
  
  
  font = createFont("pcsenior.ttf", 16);
  textFont(font);
  
  for (int i = 0; i < gretelFrames; i++) {
    gretelImages[i] = loadImage("Gretel/gret_" + i + ".png");
  }
  for (int i = 0; i < hanselFrames; i++) {
    hanselImages[i] = loadImage("Hansel/hans_" + i + ".png");
  }
  
  
  
  
  up = false;
  down = false;
  left = false;
  right = false;
  
  enemy = loadImage("Enemies/piggy.jpg"); //CHANGE TO PNG
}

void draw() {
  background(peep.bgImage());
  
  if (startG) {
    dialogue.startGame();
  }
  
  if (storyDialogue) {
    dialogue.writeDialogue(story);
  }
  
  if ( !inBattle && !startG) {
      kid.display();
      
      if ( !tutorial ) {
        kid.whoLeads();
        kid.walk();
      }
  }
  
  
  
  //text("cheese", 100, 500);
  //fill(0, 0, 0);
  //font = createFont("west-england.regular.ttf", 64);
  ////s = "i want cheesecake!";
  //textFont(font, 64);
  //textSize(50);
  ////dialogue(s);
  //stroke(0);
  
  
  if (tutorial) {
    dialogue.tutorial();
  }
  
  if (inBattle) {
    image(enemy, 700, 100);
    
  }
}

void keyPressed() {
  if ( !inBattle ) {
    if (keyCode == UP || key == 'w') {
      up = true;
      down = false;
      left = false;
      right = false;
    }
    if (keyCode == DOWN || key == 's') {
      down = true;
      up = false;
      left = false;
      right = false;
    }
    if (keyCode == LEFT || key == 'a') {
      left = true;
      up = false;
      down = false;
      right = false;
    }
    if (keyCode == RIGHT || key == 'd') {
      right = true;
      up = false;
      down = false;
      left = false;
    }
    if (key == 'x') {
      startG = false;
      tutorial = false;
    }
    if (key == 't') {
      startG = false;
      tutorial = true;
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
