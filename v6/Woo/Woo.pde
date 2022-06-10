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

String moveDescription = "Press 1 to attack, 2 to defend, 3 to punch";


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
        ultCounter -= 3;
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
    enemyHp = enemy.getHp();
  } else {
    //story.add(enemy.getName() + " dodged your attack!");
    println("bro wtf");
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
      story.add("You punched " + enemy.getName() + " with all you had \n for a whopping" + dmg + " hp, but leaving yourself vulnerable!"); 
      readingSpeed = true;   
    }
    else if (playerMove.equals("breadcrumbs")) {
      //ult
      kidDefense = 15;
      dmg = (int)(strength * 2.4);
      story.add("You threw the mighty breadcrumbs at " + enemy.getName() + "\n for " + dmg + " hp of damage!");
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
  if (randomNumber > 0) {
    kid.setHealth((kidHp + kidDefense) - realDmg);
    story.add(enemy.getAttack());
  } else {
    story.add(enemy.getName() + " missed its attack because you successfully dodged!");
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
      return true;
    } else {
      fill(255);
      image(enemyImage, 1200, 40, 60, 60);
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
        
        moveDescription = "Press 1 for attack, 2 for defense, 3 for punch";
        if (ultCounter >= 3){
         moveDescription += "\n You can now press 4 for the ultimate attack.";
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
