import processing.sound.*;

PImage gretelImages [];
PImage hanselImages [];

int gretelFrames, hanselFrames;

boolean up, down, left, right;
boolean startG = true;
boolean tutorial = false;
boolean storyDialogue = false;

int currIndex; //map

Dialogue dialogue;
Queue<String> story;

Background peep;
Kid kid;
//Battle battle;
//boolean playerTurn = false;

PFont font;
boolean inBattle;
boolean battleWon;

int command = 0;
int counter = 0;
boolean readingSpeed = false;

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

String moveDescription = "Press 1 to attack, 2 to defend, 3 to punch.";

PImage[] forest = new PImage[20];

SoundFile music;


void setup() {
  music = new SoundFile(this, "Music/JourneyBegins.mp3");
  music.amp(0.01);
  music.loop();
  smooth();
  for (int i = 0; i < 20; i++) {
    forest[i] = loadImage("Forest/forest_" + i + ".gif");
  }
  kid = new Kid(100, 10);
  dialogue = new Dialogue();
  story = new LinkedList<String>();
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
  
}

void draw() {
   background(peep.bgImage());
  
   if (startG) {
     image(forest[(frameCount/15)%20], 0, 0);
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

   battle();
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
      if (battleWon) { battleWon = false;} 
    }
    if (key == 't') {
      startG = false;
      tutorial = true;
    }
  }
  else if (playerTurn) {
    if (key == '1') {
      println("1");
      playerMove = "attack";
      playerTurn = false;
      updEnemy();
      updPlayer(enemyMove());
      playerTurn = true;
      
    }
    if (key == '2') {
      println("2");
      playerMove = "defend";
      playerTurn = false;
      updEnemy();
      updPlayer(enemyMove());
      playerTurn = true;
      
    }
    if (key == '3') {
      println("3");
      playerMove = "punch";
      playerTurn = false;
      updEnemy();
      updPlayer(enemyMove());
      ultCounter++;
      playerTurn = true;
      
    }
    if (key == '4') {
      println("4");
      if (ultCounter >= 3) {
        playerMove = "breadcrumbs";
        playerTurn = false;
        updEnemy();
        updPlayer(enemyMove());
        playerTurn = true;
         
        ultCounter -= 3;
      }
    }
    if (key == '9') {
      playerMove = "flee";
      playerTurn = false;
       
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
  //fill(0);
  //rect(0, 780, 2000, 1000, 1);
  int dmg = attackEnemy();
  int max = dmg + 3;
  int min = dmg - 3;
  int realDmg = (int)(Math.random()*(max-min+1) + min); 
  float randomNumber = random(6);
  if (randomNumber > 1) {
    enemy.setHp(enemy.getHp() - realDmg);
    if (enemy.getHp() <= 0 && kid.getHealth() > 0) { 
     // story.add("You defeated " +enemy.name+ " !. You gained HP and Strength");
      updateBaseStats(enemy.name);
      battleWon = true;
    }
    if (kid.getHealth() <= 0 && enemy.getHp() >= 0) {
      //peep.battleScreenOver();
      peep.exitBScreen();
      exit();
    }
    enemyHp = enemy.getHp();
  } else {
    //story.add(enemy.getName() + " dodged your attack!");
  }
  println(moveDescription);
  playerMove = "";
  
}
   
//damage done to enemy by player per turn
public int attackEnemy() {
  int dmg = 0;
  if (!(playerMove == null)) {
    if (playerMove.equals("attack")) {
      //attack
      dmg = strength;
      kidDefense = 0;
      story.add("You kicked " + enemy.getName() + " for " + dmg + " hp, keeping your guard up.");
      readingSpeed = true;
    }
    else if (playerMove.equals("defend")) {
      //defend
      dmg = (int)(strength * 0.3);
      kidDefense = kidDefense + (int)(kidDefense * 0.85);
      story.add("You guarded yourself against " + enemy.getName() + " but delt " + dmg + " hp of damage!"); 
      readingSpeed = true;
    }
    else if (playerMove.equals("punch")) {
      //punch
      dmg = (int)(strength * 1.85);
      kidDefense = 0;
      story.add("You punched " + enemy.getName() + " with all you had \n for a whopping " + dmg + " hp, but leaving yourself vulnerable!"); 
      readingSpeed = true;   
    }
    else if (playerMove.equals("breadcrumbs")) {
      //ult
      kidDefense = 15;
      dmg = (int)(strength * 2.4);
      story.add("You threw the mighty breadcrumbs at " + enemy.getName() + "\n for " + dmg + " hp of damage!");
      readingSpeed = true;
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
  if (battleWon) {
    dmg = 0;
  } else {
  int max = dmg + 3;
  int min = dmg - 3;
  int realDmg = (int) (Math.random()*(max-min+1) + min);
  int randomNumber = (int) ((Math.random()*6) + 1);
  if (randomNumber > 0) {
    kid.setHealth((kidHp + kidDefense) - realDmg);
    if (kid.getHealth() < 0) {
      kid.setHealth(0);
      story.add("GAME OVER");
      attackEnemy();
    }
    story.add(enemy.getAttack());
  } else {
    story.add(enemy.getName() + " missed its attack because you successfully dodged!");
  }
  kidDefense = 1;
  }
}

//after winning battle
  public void updateBaseStats(String enemyType) {
    if (enemyType.equals("Wolf") ) {
      kid.setStrength((int) (strength * 1.5));
      kid.setHealth((int) (kidHp + 30));
      story.add("Your health increased by 30HP. Your strength increased by 50%.");
    } else { 
      kid.setStrength((int) (strength * 1.1));
      kid.setHealth((int) (kidHp + 10));
      story.add("Your health increased by 10HP. Your strength increased by 5%.");
    }
  }
  
void setBattleUp(String type) {
  story = new LinkedList<String>();
  enemy = new Monsters();
  inBattle = true;
  playerTurn = true;
  battleWon = false;
  checkMonster(type);
  enemyHp = enemy.getHp();
  kidHp = kid.getHealth();
  strength = kid.getStrength();
  peep.battleScreen();
  background(peep.bgImage());
  moveDescription = "Press 1 for attack, 2 for defense, 3 for punch";
}

void checkMonster(String type) {
  if (type.equals("Imp")) {
    enemy = new Imp();
    enemyImage = loadImage("Enemies/ImpBattle.png");
  } else if (type.equals("Snake")) {
    enemy = new Snake();
    enemyImage = loadImage("Enemies/SnakeBattle.png");
  } else if (type.equals("Siren")) {
    enemy = new Siren();
    enemyImage = loadImage("Enemies/SirenBattle.png");
  } else if (type.equals("Wolf")) {
    enemy = new Wolf();
    enemyImage = loadImage("Enemies/WolfBattle.png");
  } else if (type.equals("Witch")) {
    enemy = new Witch();
    enemyImage = loadImage("Enemies/WitchBattle.png");
  }
}

boolean battle(){
  if (readingSpeed){
    counter++;
    playerTurn = false;
    moveDescription = story.peek();
  }
  if (inBattle){
    if (battleWon){
      println("huzzah");
      
      peep.exitBScreen();
      inBattle = false;
      readingSpeed = false;
      return true;
    } else {
      fill(255);
      image(enemyImage, 0, 0, 1600, 960);
      text("Player: " + kidHp, 40, 40);
      text(enemy.name + ": " + enemyHp, 40, 85);
      text(moveDescription, 50, 800);
      if (counter == 200){
        story.remove();
        //moveDescription = story.peek();
        kidHp = kid.getHealth();
      }
      if (counter == 400){
        story.remove();
        if (enemy.getHp() <= 0) {
          moveDescription = "GAME OVER";
        }
        moveDescription = "Press 1 for attack, 2 for defense, 3 for punch";
        if (ultCounter >= 3){
         moveDescription += "\n You can now press 4 for the ultimate attack of throwing breadcrumbs.";
        }
        playerTurn = true;
        readingSpeed = false;
        counter = 0;
      }
      
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
