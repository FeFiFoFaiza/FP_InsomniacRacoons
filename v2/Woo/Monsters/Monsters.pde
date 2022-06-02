import java.util.*;

class Monster {
  
  int health;
  int strength;
  double atkRate;
  Queue moveList = new LinkedList<>();
  moveList = ["basic1", "basic2", "basic3", "mid1", "mid2", "basic3", "basic2", "basic1", "ult" ];
 

  public int attack(Kid name) {
    int dmg = (int)(strength * atkRate);
    if (Math.random() > atkRate) {
    dmg = 0;
    }
    if (dmg < 0) {
    dmg = 0;
    }
    name.lowerHP(dmg);
    return dmg;
  }
  
  public int attack(String move) {
    int dmg = 0;
    String dialogue;
    if (move == "basic1") {
      dmg = (int)(strength * (0.5);
      
  } else
  
  public boolean isAlive() {
    return (health > 0);
  }
  
  public void lowerHP(int dmg) {
    health -= dmg;
  }
  
  public int getHealth() {
    return health;
  }
  
  public int getStrength() {
    return strength;
  }
  
  public double getatkRate() {
    return atkRate;
  }
  
  public double setAtkRate(double r) {
    this.atkRate = r;
    return r;
   }
  
  public int setHealth(int h) {
    this.health = h;
    return h;
  }
  
  public int setStrength(int s) {
    this.strength = s;
    return s;
  }


}
