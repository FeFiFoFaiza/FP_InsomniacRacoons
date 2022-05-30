//import Java.util;

class Monster {
  
  int health;
  int strength;
  double atkRate;
  //Queue<Integer> moveList;
  
  void setup() {
  }
  
  void draw() {
  }
  
  //Kid = superclass of Hansel/Gretel
  int attack(Kid name) {
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
  
  boolean isAlive() {
    return (health > 0);
  }
  
  void lowerHP(int dmg) {
    health -= dmg;
  }
  
  int getHealth() {
    return health;
  }
  
  int getStrength() {
    return strength;
  }
  
  double getatkRate() {
    return atkRate;
  }
  
  double setAtkRate(double r) {
    this.atkRate = r;
    return r;
   }
  
  int setHealth(int h) {
    this.health = h;
    return h;
  }
  
  int setStrength(int s) {
    this.strength = s;
    return s;
  }

}
