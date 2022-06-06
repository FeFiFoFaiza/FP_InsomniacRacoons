//Do dialogue(), displayMenu(), display() pics, Kid cords

import java.util.*;

class Battle {
  
  //setup
  private Monsters enemy;
  
  private String dialogue;
  private boolean won;
  private boolean playerTurn = true;
  private boolean status; //game over
  
  //stats
  private int enemyHp;
  
  private int kidHp;
  private int strength;
  private int kidDefense = 15;
  
  //moves
  private int ultCounter; //checks if player punched enough times to access ult
  private String playerMove;
  
  private String enemyNextMove;
  
  //setup
  public Battle(Monsters type) {
    enemy = type;
    enemyHp = enemy.getHp();
    //kidHp = kid.getHealth();
    strength = 5;//FIX L8R
  }
  
  //void draw() {
  //  //?????
  //  enemy.display(); 
  //  if ( (enemy.getX() == Kid.getX() ) && (enemy.getY() == Kid.getY())  ) { 
  //    while (!status ) {
  //      displayMenu();  
  //      turn();
  //    }
  //  }
  //}
  
  public void displayMenu() { 
    //choose 1 2 3 4 when its player turn
    // watch dialogue if not (enemy turn)
  }
  
  //displays health bar
  public void healthBar() {
  }
  
  //updating dialogue
  public void dialogue() {
    textSize(25);
    text(dialogue, 500, 800);
    
  }
  
  public void turn() {
    if ( (enemy.isAlive()) && (kidHp > 0) ) {   
      dialogue = "Press 1 to attack, Press 2 to defend, Press 3 to punch, Press 4 to use breadcrumbs." ;
      dialogue();
      //player turn
      keyPressed();
      updEnemy(playerMove()); 
      //enemy turn
      updPlayer(enemyMove());
    } else if ( (!enemy.isAlive()) && (kidHp > 0) ) {
      won = true;
      dialogue = "You defeated" +enemy+ " .";
      status = true;
      dialogue();
      updateBaseStats(enemy.name);
      dialogue();
    } else if ( kid.getHealth() <= 0 ) {
      System.out.println("HELP " + kidHp);
      dialogue = "Game over.";
      dialogue();
      status = true;
    } 
  }
  
  
  public void updPlayer(int dmg) {
    int max = dmg + 3;
    int min = dmg - 3;
    int realDmg = (int) (Math.random()*(max-min+1) + min);
    int randomNumber = (int) ((Math.random()*6) + 1);
    if (randomNumber > 1) {
      kidHp = (kidHp + kidDefense) - realDmg;
      dialogue();
    } else {
      dialogue = enemy+ " missed its attack because you successfully dodged! ";
      dialogue();
    }
    kidDefense = 15;
    //healthBar();
  }
  
  public void updEnemy(int dmg) {
    int max = dmg + 3;
    int min = dmg - 3;
    int realDmg = (int) (Math.random()*(max-min+1) + min); 
    int randomNumber = (int) ((Math.random()*6) + 1);
    if (randomNumber > 1) {
      enemy.setHp(enemy.getHp() - realDmg);
      dialogue();
    } else {
      dialogue = enemy.name + " dodged your attack! ";
      dialogue();
    }
    //healthBar();
  
   }
  
  //after winning battle
  public void updateBaseStats(String enemyType) {
    if (enemyType.equals("Wolf") ) {
      kid.setStrength((int) (strength * 1.5));
      kid.setHealth((int) (kidHp + 30));
      dialogue = "Your health increased by 30HP. Your strength increased by 50%.";
    } else { 
      kid.setStrength((int) (strength * 1.05));
      kid.setHealth((int) (kidHp + 5));
      dialogue = "Your health increased by 10HP. Your strength increased by 5%.";
    }
  }
  
  //damage done to player by enemy per turn
  public int enemyMove() {
    enemyMoveFinder();
    int dmg = 0;
    dmg = enemy.attack(enemyNextMove);
    dialogue = enemy.getDialogue();
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
  public int playerMove() {
    int dmg = 0;
    
    if (playerMove.equals("attack")) {
      //attack
      dmg = strength;
      kidDefense = 15;
      dialogue = "You kicked " +enemy+ " for " +dmg+ " hp, keeping your guard up.";
    } else if (playerMove.equals("defend")) {
      //defend
      dmg = (int)(strength * 0.3);
      kidDefense = kidDefense + (int)(kidDefense * 0.85);
      dialogue = "You guarded yourself against " +enemy+ " but delt " +dmg+ " hp of damage!"; 
    } else if (playerMove.equals("punch")) {
      //punch
      dmg = (int)(strength * 1.85);
      kidDefense = 0;
      
      dialogue = "You punched " +enemy+ " with all you had for a whopping" +dmg+ " hp, but leaving yourself vulnerable!"; 
    } else if (playerMove.equals("breadcrumbs")) {
      //ult
      kidDefense = 15;
      dmg = (int)(strength * 2.4);
      dialogue = "You threw the mighty breadcrumbs at " +enemy+ " for " +dmg+ " hp of damage!";
   } else {
     return 0;
   }
   playerTurn = false;
   return dmg;
   
  }
  
  //choosing player's move
  void keyPressed() { //playerMoves  
     if (key == CODED && playerTurn == true) {
      if (keyCode == 1) {
        playerMove = "attack"; //no changes
      }
      if (keyCode == 2) {
        playerMove = "defend"; //lower dmg done on en, lower dmg done on player
      }
      if (keyCode == 3) {
        playerMove = "punch"; // higher dmg done on en, higher on player
        ultCounter++;
      }
      if ( (keyCode == 4) &&  (ultCounter >= 3) ) {
        playerMove = "breadcrumbs"; //higher dmg done on en
        ultCounter = 0;
      }
    }
    playerTurn = false;
  }
  
  
}
