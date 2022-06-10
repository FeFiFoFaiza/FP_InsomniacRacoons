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

String moveDescription = "";


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
  else if (playerTurn) {
    fill(255);
    moveDescription = "Press 1 to attack, 2 to defend, 3 to punch";
    if (key == '1') {
      println("1");
      playerMove = "attack";
      playerTurn = false;
      updEnemy();
      updPlayer(enemyMove());
      playerTurn = true;
      println("111");
    }
    if (key == '2') {
      println("2");
      playerMove = "defend";
      playerTurn = false;
      updEnemy();
      updPlayer(enemyMove());
      playerTurn = true;
      println("222");
    }
    if (key == '3') {
      println("3");
      playerMove = "punch";
      playerTurn = false;
      updEnemy();
      updPlayer(enemyMove());
      ultCounter++;
      playerTurn = true;
      println("333");
    }
    if (key == '4') {
      println("4");
      if (ultCounter >= 3) {
        playerMove = "breadcrumbs";
        playerTurn = false;
        updEnemy();
        updPlayer(enemyMove());
        playerTurn = true;
        println("444");
      }
    }
    if (key == '9') {
      playerMove = "flee";
      playerTurn = false;
      println("999");
    }
  }

}


void keyReleased() {
  up = false;
  down = false;
  left = false;
  right = false;
}

public void updEnemy() {
  int dmg = attackEnemy();
  int max = dmg + 3;
  int min = dmg - 3;
  int realDmg = (int)(Math.random()*(max-min+1) + min); 
  float randomNumber = random(6);
  if (randomNumber > 1) {
    enemy.setHp(enemy.getHp() - realDmg);
  } else {
    moveDescription = enemy.getName() + " dodged your attack!";
  }
  println(moveDescription);
  playerMove = "";
  //healthBar();
}
   
//damage done to enemy by player per turn
public int attackEnemy() {
  int dmg = 0;
  if (!(playerMove == null)) {
    if (playerMove.equals("attack")) {
      //attack
      dmg = strength;
      kidDefense = 15;
      moveDescription = "You kicked " + enemy.getName() + " for " + dmg + " hp, keeping your guard up.";
    }
    else if (playerMove.equals("defend")) {
      //defend
      dmg = (int)(strength * 0.3);
      kidDefense = kidDefense + (int)(kidDefense * 0.85);
      moveDescription = "You guarded yourself against " + enemy.getName() + " but delt " + dmg + " hp of damage!"; 
    }
    else if (playerMove.equals("punch")) {
      //punch
      dmg = (int)(strength * 1.85);
      kidDefense = 0;
      moveDescription = "You punched " + enemy.getName() + " with all you had for a whopping" + dmg + " hp, but leaving yourself vulnerable!"; 
    }
    else if (playerMove.equals("breadcrumbs")) {
      //ult
      kidDefense = 15;
      dmg = (int)(strength * 2.4);
      moveDescription = "You threw the mighty breadcrumbs at " + enemy.getName() + " for " + dmg + " hp of damage!";
   }
   else {
     return 0;
   }
   playerTurn = false;
   return dmg;
  }
  else {
    return 123;
  }
}

//damage done to player by enemy per turn
public int enemyMove() {
  enemyMoveFinder();
  int dmg = 0;
  dmg = enemy.attack(enemyNextMove);
  playerTurn = true;
  return dmg;
}

//updates queue of enemy moves
public void enemyMoveFinder() {
  Queue<String> enemyMoveList = enemy.moveList;
  String temp = enemyMoveList.peek();
  enemyMoveList.remove();
  enemyMoveList.add(temp);
  enemyNextMove = temp;
}

public void updPlayer(int dmg) {
  int max = dmg + 3;
  int min = dmg - 3;
  int realDmg = (int) (Math.random()*(max-min+1) + min);
  int randomNumber = (int) ((Math.random()*6) + 1);
  if (randomNumber > 1) {
    kid.setHealth((kidHp + kidDefense) - realDmg);
    text("You defended!", 50, 800);
  } else {
    text(enemy.getName() + " missed its attack because you successfully dodged!", 50, 800);
  }
  kidDefense = 1;
  //healthBar();
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
    //frameRate(1);
    if (battleWon){
      println("huzzah");
      peep.exitBScreen();
      inBattle = false;
      return true;
    } else {
      image(enemyImage, 1200, 40, 60, 60);
      text(moveDescription, 50, 800);
      if (playerMove.equals("flee")) {
        //frameRate(60);
        inBattle = false;
        peep.exitBScreen();
        playerMove = "";
        return true;
      }
      //playerMove();
      storyDialogue = false;
      return false;
    }
  }
  return false;
}

void playerMove(){
  fill(225);
  //text("Press 1 to attack, 2 to delay, 3 to punch", 50, 800);
  //text(moveDescription, 50, 800);
  if (playerMove.equals("attack")){
     battleMenu();
     updEnemy();
     //playerTurn = true;
     text(moveDescription, 50, 800);
     //delay(1000);
      //int counter = 0;
      //while (counter < 1000) {
      //  for (int i = 0; i < 100; i++) {
      //    println(i);
      //  }
      //  println(counter);
      //  counter++;
      //}
      //println("AAAAAAAAAA");
  }
  else if (playerMove.equals("defend")){
     battleMenu();
     text(moveDescription, 50, 800); 
  }
  else if (playerMove.equals("punch")){
     battleMenu();
     text(moveDescription, 50, 800); 
  }
  //playerMove = "";
}

void battleMenu(){
  background(peep.bgImage());
  image(enemyImage, 1200, 40, 60, 60);
}
