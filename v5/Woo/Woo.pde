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
//boolean playerTurn = false;

PFont font;
boolean inBattle;
boolean battleWon;
Imp imp;

int counter = 0;
int command = 0;


//setup
   Monsters enemy;

   boolean won;
   boolean playerTurn = false;

  
  //stats
   int enemyHp;
   int kidHp = 0;
   int strength;
   int kidDefense = 5;
  
  //moves
  int ultCounter; //checks if player punched enough times to access ult
  String playerMove = "";
  
   String enemyNextMove;

  PImage enemyImage;
  PImage bg;


void setup() {
  kid = new Kid(100, 10);
  dialogue = new Dialogue();
  story = new LinkedList<String>();
  imp = new Imp();
  
  size(1600, 960);
  //background(202, 158, 81);
  peep = new Background();
  
  gretelFrames = 12;
  hanselFrames = 12;
  gretelImages = new PImage[gretelFrames];
  hanselImages = new PImage[hanselFrames];
  
  enemyImage = loadImage("Enemies/piggy.jpg");
  
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
   

   if (battle()) {
    enemyImage = loadImage("Enemies/piggy.jpg");
    
    //  println("What");
    //  turn();
    //  setBattleUp(imp);
    //  playerTurn = true;
    //  //while (playerMove == null || playerMove != null) {
    //  //  println(playerMove);
       
    //  //  playerMove(playerMove);
    //  //}
    //  println(playerMove);
    //  battleMenu();
   }
}

// void battleMenu() {
//   if ((enemy.isAlive()) && (kidHp > 0)) {
//     turn1();
//   }
//   else if ((!enemy.isAlive()) && (kidHp > 0)) {
//     turn2();
//   }
//   else if ((enemy.isAlive()) && (kidHp <= 0)) {
//     turn3();
//   }
//   else {
//     println("error");
//   }
// }

void keyPressed() {
  
  if ( !inBattle ) {
    if (keyCode == UP || key == 'w') {
      up = true;
      down = false;
      left = false;
      right = false;
      println("weee");
    }
    if (keyCode == DOWN || key == 's') {
      down = true;
      up = false;
      left = false;
      right = false;
      println("wooo");
    }
    if (keyCode == LEFT || key == 'a') {
      left = true;
      up = false;
      down = false;
      right = false;
      println("deee");
    }
    if (keyCode == RIGHT || key == 'd') {
      right = true;
      up = false;
      down = false;
      left = false;
      println("doooo");
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
    if (key == '1') {
    println("1");
    if (inBattle && playerTurn) {
      playerMove = "attack";
      println("111");
    }
  }
  if (key == '2') {
    println("2");
    if (inBattle && playerTurn) {
      playerMove = "defend";
      println("222");
    }
  }
  if (key == '3') {
    println("3");
    if (inBattle && playerTurn) {
      playerMove = "punch";
      println("333");
    }
  }
  if (key == '4') {
    println("4");
    if (inBattle && playerTurn && (ultCounter >= 3)) {
      playerMove = "breadcrumbs";
      println("444");
    }
  }
  if (key == '9') {
    if (inBattle && playerTurn) {
      playerMove = "flee";
      println("333");
    }
  }
  
  
  
}


void keyReleased() {
  up = false;
  down = false;
  left = false;
  right = false;
}


void setBattleUp() {
  inBattle = true;
  playerTurn = true;
  battleWon = false;
  enemy = new Imp();
  enemyHp = enemy.getHp();
  kidHp = kid.getHealth();
  strength = kid.getStrength();
  peep.battleScreen();
  background(peep.bgImage());
}

boolean battle(){
  if (inBattle){
    if (battleWon){
      println("huzzah");
      peep.exitBScreen();
      inBattle = false;
      return true;
    } else {
      image(enemyImage, 1200, 40, 60, 60);
      if (playerMove.equals("flee")) {
        inBattle = false;
        peep.exitBScreen();
        playerMove = "";
        return true;
      }
      playerMove();
      storyDialogue = false;
      return false;
    }
  }
  return false;
}

void playerMove(){
  fill(225);
  text("Press 1 to attack, 2 to delay, 3 to punch", 50, 800); 
  if (playerMove.equals("attack")){
     battleMenu();
     text("you've attacked!", 50, 800);
  } else if (playerMove.equals("defend")){
     battleMenu();
     text("you've defended!", 50, 800); 
  } else if (playerMove.equals("punch")){
     battleMenu();
     text("you've punched!", 50, 800); 
  }
  playerMove = "";
}

void battleMenu(){
   background(peep.bgImage());
   image(enemyImage, 1200, 40, 60, 60);
}
