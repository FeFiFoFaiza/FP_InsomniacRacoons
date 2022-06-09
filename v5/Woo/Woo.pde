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
Imp imp;
Battle battle;

int counter = 0;
int command = 0;


//setup
   Monsters enemy;

   boolean won;
   boolean playerTurn = false;
   boolean status; //game over
  
  //stats
   int enemyHp;
   int kidHp = 0;
   int strength;
   int kidDefense = 5;
  
  //moves
  int ultCounter; //checks if player punched enough times to access ult
  String playerMove;
  
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
     turn();
     setBattleUp(imp);
     while (playerMove == null) {
       println(playerMove);
       
       playerMove(playerMove);
     }
     battleMenu();
   }
}

void battleMenu() {
  if ((enemy.isAlive()) && (kidHp > 0)) {
    turn1();
  }
  else if ((!enemy.isAlive()) && (kidHp > 0)) {
    turn2();
  }
  else if ((enemy.isAlive()) && (kidHp <= 0)) {
    turn3();
  }
  else {
    println("error");
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
  
}


void keyReleased() {
  up = false;
  down = false;
  left = false;
  right = false;
}






void setBattleUp(Monsters type) {
  inBattle = true;
  playerTurn = true;
  storyDialogue = true;
  enemy = type;
  enemyHp = enemy.getHp();
  kidHp = kid.getHealth();
  strength = kid.getStrength();
  enemyImage = loadImage("Enemies/piggy.jpg");
}


void turn1() {
  //inBattle = true;
  //playerTurn = true;
  //storyDialogue = true;
  
  System.out.println("HELP1 " + kidHp);
  
  updEnemy(playerMove(playerMove)); 
  updPlayer(enemyMove());
}

void turn2() {
  System.out.println("HELP2 " + kidHp);
  won = true;
  story.add("You defeated" + enemy.getName() + ".");
  status = true;
  updateBaseStats(enemy.name);
}

void turn3() {
  System.out.println("HELP3 " + kidHp);
  story.add("Game over.");
  status = true;
}

public void turn() {
  bg = loadImage("WorldPics/black.png");
  story.add("You have 15 seconds to make your move!");
  story.add("Press 1 to attack, Press 2 to defend, Press 3 to punch, Press 4 to use breadcrumbs.");
}


public void updPlayer(int dmg) {
  int max = dmg + 3;
  int min = dmg - 3;
  int realDmg = (int) (Math.random()*(max-min+1) + min);
  int randomNumber = (int) ((Math.random()*6) + 1);
  if (randomNumber > 1) {
    kid.setHealth((kidHp + kidDefense) - realDmg);
    story.add("You defended!");
  } else {
    story.add(enemy.getName() + " missed its attack because you successfully dodged!");
  }
  kidDefense = 1;
  //healthBar();
}

public void updEnemy(int dmg) {
  int max = dmg + 3;
  int min = dmg - 3;
  int realDmg = (int) (Math.random()*(max-min+1) + min); 
  int randomNumber = (int) ((Math.random()*6) + 1);
  if (randomNumber > 1) {
    enemy.setHp(enemy.getHp() - realDmg);
  } else {
    story.add(enemy.getName() + " dodged your attack!");
  }
  //healthBar();

 }

//after winning battle
public void updateBaseStats(String enemyType) {
  if (enemyType.equals("Wolf") ) {
    kid.setStrength((int) (strength * 1.5));
    kid.setHealth((int) (kidHp + 30));
    story.add("Your health increased by 30HP. Your strength increased by 50%.");
  } else { 
    kid.setStrength((int) (strength * 1.05));
    kid.setHealth((int) (kidHp + 5));
    story.add("Your health increased by 10HP. Your strength increased by 5%.");
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

//damage done to enemy by player per turn
public int playerMove(String pM) {
  int dmg = 0;
  if (!(pM == null)) {
    if (pM.equals("attack")) {
      //attack
      dmg = strength;
      kidDefense = 15;
      story.add("You kicked " + enemy.getName() + " for " + dmg + " hp, keeping your guard up.");
    }
    else if (pM.equals("defend")) {
      //defend
      dmg = (int)(strength * 0.3);
      kidDefense = kidDefense + (int)(kidDefense * 0.85);
      story.add("You guarded yourself against " + enemy.getName() + " but delt " + dmg + " hp of damage!"); 
    }
    else if (pM.equals("punch")) {
      //punch
      dmg = (int)(strength * 1.85);
      kidDefense = 0;
      story.add("You punched " + enemy.getName() + " with all you had for a whopping" + dmg + " hp, but leaving yourself vulnerable!"); 
    }
    else if (pM.equals("breadcrumbs")) {
      //ult
      kidDefense = 15;
      dmg = (int)(strength * 2.4);
      story.add("You threw the mighty breadcrumbs at " + enemy.getName() + " for " + dmg + " hp of damage!");
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
