import java.util.*;

class Monsters {
  
  private int health;
  private int strength;
  private String dialogue; 
  private int x;
  private int y;
  String name;

  private Queue<String> moveList = new LinkedList<String>();
  
  public Monsters() {
    moveList.add("basic1");
    moveList.add("basic2");
    moveList.add("basic3");
    moveList.add("mid1");
    moveList.add("mid2");
    moveList.add("basic2");
    moveList.add("ult");
    
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
   }
 
  public boolean isAlive() {
    return (health > 0);
  }
  
  public void display() {
  
  }
  
  public String getDialogue() {
    return dialogue;
  }
  
  public int getHp() {
    return health;
  }
  
  public int getStrength() {
    return strength;
  }
  
  
  public int setHp(int h) {
    this.health = h;
    return h;
  }
  
  public int setStrength(int s) {
    this.strength = s;
    return s;
  }
  
  public int attack(String n) {
    return 0;
  }


}
