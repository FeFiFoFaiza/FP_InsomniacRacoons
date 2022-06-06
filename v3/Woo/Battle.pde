//Do dialogue(), displayMenu(), display() pics, Kid cords

import java.util.*;

class Battle {
  
  //setup
  private Monsters enemy;
  
  //private String dialogue;
  private boolean won;
  private boolean playerTurn = true;
  private boolean status; //game over
  
  //stats
  private int enemyHp;
  
  private int kidHp = 0;
  private int strength;
  private int kidDefense = 15;
  
  //moves
  private int ultCounter; //checks if player punched enough times to access ult
  private String playerMove;
  
  private String enemyNextMove;
  //String story;
  
  //setup
  public Battle(Monsters type) {
    enemy = type;
    enemyHp = enemy.getHp();
    //println(kid);
    kidHp = kid.getHealth();
    println(kidHp);
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
  
  
  
  public void turn() {
    System.out.println("HELP " + kidHp);
    System.out.println(enemy.isAlive());
    println((kid.getHealth()));
    if ( (enemy.isAlive()) && (kidHp > 0) ) {
      inBattle = true;
      System.out.println("HELP1 " + kidHp);
      story = "Press 1 to attack, Press 2 to defend, Press 3 to punch, Press 4 to use breadcrumbs.";
      storyDialogue = true;
      //player turn
      keyPressed();
      updEnemy(playerMove()); 
      //enemy turn
      updPlayer(enemyMove());
    }
    else if ( (!enemy.isAlive()) && (kidHp > 0) ) {
      System.out.println("HELP2 " + kidHp);
      won = true;
      story = "You defeated" + enemy + " .";
      status = true;
      dialogue.writeDialogue(story);
      updateBaseStats(enemy.name);
      //dialogue.writeDialogue(story);
    }
    else if ( (enemy.isAlive()) && (kidHp <= 0) ) {
      System.out.println("HELP3 " + kidHp);
      story = "Game over.";
      dialogue.writeDialogue(story);
      status = true;
    } 
    else {
      println("error");
    }
  }
  
  
  public void updPlayer(int dmg) {
    int max = dmg + 3;
    int min = dmg - 3;
    int realDmg = (int) (Math.random()*(max-min+1) + min);
    int randomNumber = (int) ((Math.random()*6) + 1);
    if (randomNumber > 1) {
      kid.setHealth((kidHp + kidDefense) - realDmg);
      //dialogue.writeDialogue(story);
    } else {
      story = enemy + " missed its attack because you successfully dodged! ";
      dialogue.writeDialogue(story);
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
      //dialogue.writeDialogue(story);
    } else {
      story = enemy.name + " dodged your attack! ";
      dialogue.writeDialogue(story);
    }
    //healthBar();
  
   }
  
  //after winning battle
  public void updateBaseStats(String enemyType) {
    if (enemyType.equals("Wolf") ) {
      kid.setStrength((int) (strength * 1.5));
      kid.setHealth((int) (kidHp + 30));
      story = "Your health increased by 30HP. Your strength increased by 50%.";
    } else { 
      kid.setStrength((int) (strength * 1.05));
      kid.setHealth((int) (kidHp + 5));
      story = "Your health increased by 10HP. Your strength increased by 5%.";
    }
  }
  
  //damage done to player by enemy per turn
  public int enemyMove() {
    enemyMoveFinder();
    int dmg = 0;
    dmg = enemy.attack(enemyNextMove);
    story = enemy.getDialogue();
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
    if (!(playerMove == null)) {
      if (playerMove.equals("attack")) {
        //attack
        dmg = strength;
        kidDefense = 15;
        story = "You kicked " +enemy+ " for " +dmg+ " hp, keeping your guard up.";
      } else if (playerMove.equals("defend")) {
        //defend
        dmg = (int)(strength * 0.3);
        kidDefense = kidDefense + (int)(kidDefense * 0.85);
        story = "You guarded yourself against " +enemy+ " but delt " +dmg+ " hp of damage!"; 
      } else if (playerMove.equals("punch")) {
        //punch
        dmg = (int)(strength * 1.85);
        kidDefense = 0;
        
        story = "You punched " +enemy+ " with all you had for a whopping" +dmg+ " hp, but leaving yourself vulnerable!"; 
      } else if (playerMove.equals("breadcrumbs")) {
        //ult
        kidDefense = 15;
        dmg = (int)(strength * 2.4);
        story = "You threw the mighty breadcrumbs at " +enemy+ " for " +dmg+ " hp of damage!";
     } else {
       return 0;
     }
     playerTurn = false;
     return dmg;
    }
    else {
      return 123;
    }
  }
  
  //choosing player's move
  void keyPressed() { //playerMoves  
     if (key == CODED && playerTurn == true) {
      if (keyCode == 1) {
        playerMove = "attack"; //no changes
        println(playerMove);
      }
      if (keyCode == 2) {
        playerMove = "defend"; //lower dmg done on en, lower dmg done on player
        println(playerMove);
      }
      if (keyCode == 3) {
        playerMove = "punch"; // higher dmg done on en, higher on player
        println(playerMove);
        ultCounter++;
      }
      if ( (keyCode == 4) &&  (ultCounter >= 3) ) {
        playerMove = "breadcrumbs"; //higher dmg done on en
        println(playerMove);
        ultCounter = 0;
      }
    }
    playerTurn = false;
  }
  
  
}
