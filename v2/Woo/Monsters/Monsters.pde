import java.util.*;

class Monster {
  
  int health;
  int strength;

  Queue moveList = new LinkedList<>();
  moveList = ["basic1", "basic2", "basic3", "mid1", "mid2", "basic3", "basic2", "basic1", "ult" ];
 

  //public int dmg() {
  //  int dmg = (int)(strength * atkRate);
  //  if (Math.random() > atkRate) {
  //  dmg = 0;
  //  }
  //  if (dmg < 0) {
  //  dmg = 0;
  //  }
  //  name.lowerHP(dmg);
  //  return dmg;
  //}
  
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
  
  
  public int setHealth(int h) {
    this.health = h;
    return h;
  }
  
  public int setStrength(int s) {
    this.strength = s;
    return s;
  }


}
