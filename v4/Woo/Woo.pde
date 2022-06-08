PImage enemy;

PImage gretelImages [];
PImage hanselImages [];

int gretelFrames, hanselFrames;

boolean up, down, left, right;
boolean startG = true;
boolean tutorial = false;
boolean storyDialogue = false;
Dialogue dialogue;
Queue<String> story;

Background peep;
Kid kid;
//Battle battle;
boolean playerTurn = false;

PFont font;
boolean inBattle;
Imp imp;
Battle battle;

int counter = 0;
int command = 0;

void setup() {
  kid = new Kid(100, 10);
  dialogue = new Dialogue();
  story = new LinkedList<String>();
  //imp = new Imp();
  //battle = new Battle(imp);
  //battle = new Battle();
  
  size(1600, 960);
  //background(202, 158, 81);
  peep = new Background();
  
  gretelFrames = 12;
  hanselFrames = 12;
  gretelImages = new PImage[gretelFrames];
  hanselImages = new PImage[hanselFrames];
  
  /**
  font = createFont("pcsenior.ttf", 16);
  textFont(font);
  **/
  
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
  
  if ( !inBattle && !startG) {
      kid.display();
      
      if ( !tutorial ) {
        kid.whoLeads();
        kid.walk();
      }
  }  
  
  if (tutorial) {
    dialogue.tutorial();
  }
  
  if (inBattle) {
    peep.battleMenu();
    image(enemy, 700, 100);
    
    peep.battleTurn();
    dialogue.writeDialogue();
    //delay(2000);
  }
  
   if (inBattle && playerTurn) {
    if (keyCode == 49) {
        command = 1;
        println("command 1");
     }
     if (keyCode == 50) {
        command = 2;
        println("command 2");
     }
     if (keyCode == 51) {
        command = 3;
        println("command 3");
     }
     if (keyCode == 52) {
        command = 4;
        println("command 4");
     }
  }
  
  if (storyDialogue) {
    if (counter == 0) {
      peep.battleMenu();
      counter++;
    }
    dialogue.writeDialogue();
    delay(2000);
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
  
  if (inBattle && playerTurn) {
    battle.keyPressed();
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
