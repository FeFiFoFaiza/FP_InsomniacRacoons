//Do dialogue(), displayMenu(), display() pics, Kid cords

import java.util.*;

public class Battle {
  
  //setup
  private Monsters enemy;

  private boolean won;
  public boolean playerTurn = false;
  private boolean status; //game over
  
  //stats
  private int enemyHp;
  private int kidHp = 0;
  private int strength;
  private int kidDefense = 5;
  
  //moves
  int ultCounter; //checks if player punched enough times to access ult
  String playerMove;
  
  private String enemyNextMove;

  PImage enemyImage;

  
  ////setup
  //public Battle(Monsters type) {
  //  //move1 = new Button();
  //  //move1 = new Button(100, 100, 100, 50, "Move 1", 0, 200, 200);
  //  //move2 = new Button(100, 100, 100, 50, "Move 2", 0, 200, 200);
  //  //move3 = new Button(100, 100, 100, 50, "Move 3", 0, 200, 200);
  //  //move4 = new Button(100, 100, 100, 50, "Move 4", 0, 200, 200);
  //  enemy = type;
  //  enemyHp = enemy.getHp();
  //  kidHp = kid.getHealth();
  //  strength = kid.getStrength();
  //  enemyImage = loadImage("Enemies/piggy.jpg");
  //}
  
  //public void displayMenu() { 
  //  //choose 1 2 3 4 when its player turn
  //  // watch dialogue if not (enemy turn)
  //}
  
  ////displays health bar
  //public void healthBar() {
  //}
  
  //void draw() {
  //  println("ko");
  // // background = loadImage("WorldPics/black.png");
  //  image(enemyImage, 700, 100);
  //  move1.draw();
  //  //move1.update();
  //  //move1.render();
  //  turn();
  //}
  
  

  //public void turn() {
  //  System.out.println("HELP " + kidHp);
    
  //  if ( (enemy.isAlive()) && (kidHp > 0) ) {
  //    inBattle = true;
  //    playerTurn = true;
  //    System.out.println("HELP1 " + kidHp);
  //    storyDialogue = true;

  //    story.add("You have 15 seconds to make your move!");
  //    story.add("Press 1 to attack, Press 2 to defend, Press 3 to punch, Press 4 to use breadcrumbs.");

  //    //player turn
  //    if (playerTurn && inBattle) {
  //      //println("im tired" + playerTurn);
  //      //move1.render();
  //      //delay(2000);
  //      while (playerTurn) {
  //        //move1.render();
  //        //move1.update();
      
  //          //move1.update();
  //         // println("ack" + move1.isClicked());
  //          //println("why" + playerTurn);
  //          if (command == 1) {
  //            println("fff");
  //              playerMove = "attack"; //no changes
  //              println(playerMove);
  //              playerTurn = false;
  //              //break;
  //           }
  //           if (command == 2) {
  //              playerMove = "defend"; //lower dmg done on en, lower dmg done on player
  //              println(playerMove);
  //              playerTurn = false;
  //              //break;
  //           }
  //           if (command == 3) {
  //              playerMove = "punch"; // higher dmg done on en, higher on player
  //              println(playerMove);
  //              ultCounter++;
  //              playerTurn = false;
  //              //break;
  //           }
  //           if ((command == 4) && (ultCounter >= 3)) {
  //              playerMove = "breadcrumbs"; //higher dmg done on en
  //              println(playerMove);
  //              ultCounter = 0;
  //              playerTurn = false;
  //              //break;
  //           }
  //           //else {
  //           //  println(command);
  //           //  println(key);
  //           //  println("dying");
  //           //  delay(1000);
  //           //}
          
  //      }
  //      //println("ataaack");
  //      //playerMove = "attack"; //no changes
  //      //println(playerMove);
  //      //playerTurn = false;
  //    }
  //    playerTurn = false;
  //    updEnemy(playerMove()); 
  //    //enemy turn
  //    updPlayer(enemyMove());
  //  }
  //  else if ( (!enemy.isAlive()) && (kidHp > 0) ) {
  //    System.out.println("HELP2 " + kidHp);
  //    won = true;
  //    story.add("You defeated" + enemy.getName() + ".");
  //    status = true;
  //    updateBaseStats(enemy.name);
  //  }
  //  else if ( (enemy.isAlive()) && (kidHp <= 0) ) {
  //    System.out.println("HELP3 " + kidHp);
  //    story.add("Game over.");
  //    status = true;
  //  } 
  //  else {
  //    println("error");
  //  }
  //}
  
  
  //public void updPlayer(int dmg) {
  //  int max = dmg + 3;
  //  int min = dmg - 3;
  //  int realDmg = (int) (Math.random()*(max-min+1) + min);
  //  int randomNumber = (int) ((Math.random()*6) + 1);
  //  if (randomNumber > 1) {
  //    kid.setHealth((kidHp + kidDefense) - realDmg);
  //    story.add("You defended!");
  //  } else {
  //    story.add(enemy.getName() + " missed its attack because you successfully dodged!");
  //  }
  //  kidDefense = 1;
  //  //healthBar();
  //}
  
  //public void updEnemy(int dmg) {
  //  int max = dmg + 3;
  //  int min = dmg - 3;
  //  int realDmg = (int) (Math.random()*(max-min+1) + min); 
  //  int randomNumber = (int) ((Math.random()*6) + 1);
  //  if (randomNumber > 1) {
  //    enemy.setHp(enemy.getHp() - realDmg);
  //  } else {
  //    story.add(enemy.getName() + " dodged your attack!");
  //  }
  //  //healthBar();
  
  // }
  
  ////after winning battle
  //public void updateBaseStats(String enemyType) {
  //  if (enemyType.equals("Wolf") ) {
  //    kid.setStrength((int) (strength * 1.5));
  //    kid.setHealth((int) (kidHp + 30));
  //    story.add("Your health increased by 30HP. Your strength increased by 50%.");
  //  } else { 
  //    kid.setStrength((int) (strength * 1.05));
  //    kid.setHealth((int) (kidHp + 5));
  //    story.add("Your health increased by 10HP. Your strength increased by 5%.");
  //  }
  //}
  
  ////damage done to player by enemy per turn
  //public int enemyMove() {
  //  enemyMoveFinder();
  //  int dmg = 0;
  //  dmg = enemy.attack(enemyNextMove);
  //  playerTurn = true;
  //  return dmg;
  //}
  
  ////updates queue of enemy moves
  //public void enemyMoveFinder() {
  //  Queue<String> enemyMoveList = enemy.moveList;
  //  String temp = enemyMoveList.peek();
  //  enemyMoveList.remove();
  //  enemyMoveList.add(temp);
  //  enemyNextMove = temp;
  //}
  
  ////damage done to enemy by player per turn
  //public int playerMove() {
  //  int dmg = 0;
  //  if (!(playerMove == null)) {
  //    if (playerMove.equals("attack")) {
  //      //attack
  //      dmg = strength;
  //      kidDefense = 15;
  //      story.add("You kicked " + enemy.getName() + " for " + dmg + " hp, keeping your guard up.");
  //    }
  //    else if (playerMove.equals("defend")) {
  //      //defend
  //      dmg = (int)(strength * 0.3);
  //      kidDefense = kidDefense + (int)(kidDefense * 0.85);
  //      story.add("You guarded yourself against " + enemy.getName() + " but delt " + dmg + " hp of damage!"); 
  //    }
  //    else if (playerMove.equals("punch")) {
  //      //punch
  //      dmg = (int)(strength * 1.85);
  //      kidDefense = 0;
  //      story.add("You punched " + enemy.getName() + " with all you had for a whopping" + dmg + " hp, but leaving yourself vulnerable!"); 
  //    }
  //    else if (playerMove.equals("breadcrumbs")) {
  //      //ult
  //      kidDefense = 15;
  //      dmg = (int)(strength * 2.4);
  //      story.add("You threw the mighty breadcrumbs at " + enemy.getName() + " for " + dmg + " hp of damage!");
  //   }
  //   else {
  //     return 0;
  //   }
  //   playerTurn = false;
  //   return dmg;
  //  }
  //  else {
  //    return 123;
  //  }
  //}
  
  //choosing player's move
  //void keyPressed() { //playerMoves
  //    println(command);
  //    println("acka");
  //    println("inBattle " + inBattle + ", playerTurn " + playerTurn);
  //    switch(key) {
  //      case '1':
  //        //playerMovesList.add('1');
  //        command = 1;
  //        println("command 1");
  //        break;
  //      case '2':
  //        //playerMovesList.add('2');
  //        command = 1;
  //        println("command 2");
  //        break;
  //      case '3':
  //        //playerMovesList.add('3');
  //        command = 1;
  //        println("command 3");
  //        break;
  //      case '4':
  //        //playerMovesList.add('4');
  //        command = 1;
  //        println("command 4");
  //        break;
  //    }
  //}
  
  
}
