import java.util*; 

class Battle {
  Monsters enemy;
  boolean won;
  boolean playerTurn = true;
  
  int kidHp;
  boolean playerUlt;
  String playerMove;
  int ogStrength;
  
  int enemyHp;
  String enemyNextMove;
  
  public Battle(Monsters type) {
    enemey = type;
    enemyHp = enemy.getHealth;
    ogStrength = kid.getStrength;
  }
  
  public void turn() {
    
  }
  
  public int enemyMove() {
    int dmg = 0;
    enemy.attack(enemyNextMove) = dmg;
    return dmg;
    playerTurn = true;
  }
  
  public String enemyMoveFinder() {
    Queue enemyMoveList = enemy.moveList;
    String temp = enemyMoveList.peek();
    enemyMoveList.remove();
    enemyMoveList.add(temp);
    return temp;
  }
  
  public int playerMove() {
    int dmg = 0;
    if (playerMove.equals("attack")) {
      //attack
    } else if (playerMove.equals("defend")) {
      //defend
    } else if (playerMove.equals("punch")) {
      //punch
    } else if (playerMove.equals("breadcrumbs")) {
      //ult
   } else {
     return 0;
   }
   playerTurn = false;
   return dmg;
   
  }
  
  void keyPressed() { //playerMoves 
   
     if (key == CODED) {
      if (keyCode == 1) {
        playerMove = "attack"; //no changes
      }
      if (keyCode == 2) {
        playerMove = "defend"; //lower dmg done on en, lower dmg done on player
      }
      if (keyCode == 3) {
        playerMove = "punch"; // higher dmg done on en, higher on player
      }
      if (keyCode == 4 &&  (ultYes) ) {
        playerMove = "breadcrumbs"; //higher dmg done on en
        this.playerUlt = false;
      }
    }
    return move;
  }
  
  
}
