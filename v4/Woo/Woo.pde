//PImage enemy;

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
Button move1, move2, move3, move4;

void setup() {
  move1 = new Button();
  //move1 = new Button(100, 100, 100, 50, "Move 1", 0, 200, 200);
  kid = new Kid(100, 10);
  dialogue = new Dialogue();
  story = new LinkedList<String>();
  imp = new Imp();
  battle = new Battle(imp);
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
  
  //enemy = loadImage("Enemies/piggy.jpg"); //CHANGE TO PNG
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
     println("What");
     peep.battleMenu();
     battle.draw();
   }
}

//void detectButton() {
//      //if (move1.isClicked()) {
//      //  println("pain");
//      //}
//      move1.render();
//     move1.update();
////     move1.render();
//  }

void keyPressed() {
  //battle.keyPressed();
  
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
