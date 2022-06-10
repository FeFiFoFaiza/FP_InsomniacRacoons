import java.util.*;

class Kid {
  
  String _name;
  int _health = 0;
  int _strength;
  
  int xGret = 65;
  int yGret = 925;
  float xGspeed = 0;
  float yGspeed = 0;
  
  int xHans = 35;
  int yHans = 925;
  float xHspeed = 0;
  float yHspeed = 0;
  
  int xLead;
  int yLead;
  
  boolean gretLeads, hansLeads;
  boolean canBattle;
  
  int currentFrame = 0;
  int loopFrames = 3;
  int offset = 0;
  int delay = 0;
  
  //Queue<String> inventory = new LinkedList<String>();
  //boolean pickedUp = false;
  
  //Item cookie = new Item();
  //Item items[] = new Item[6];
  
  int xTile, yTile, yGTemp, xGTemp, yHTemp, xHTemp;


  //boolean inventoryFull() {
  //  return (inventory.size() > 6);
  //}
  
  
  //void updateInventory(Item item) {
  //  if (pickedUp) {
  //    if (!inventoryFull()) {
  //      inventory.add(item);
  //    }
  //    else {
  //      // idk how to drop items on the ground,
  //      // maybe display the PImage and then its pickuppable
  //      inventory.remove();
  //      inventory.add(item);
  //    }
  //  }
  //}
  
  
  public Kid() {
    this._health = 100;
    this._strength = 10;
  }
  
  
  public Kid(int hp, int str) {
    this._health = hp;
    this._strength = str;
  }
  
  
  public int getHealth() {
    println(_health);
    return _health;
  }
  
  
  int getStrength() {
    return _strength;
  }
  
  
  void setHealth(int newHealth) {
    this._health = newHealth;
  }
  
  
  void setStrength(int newStrength) {
    this._strength = newStrength;
  }
  
  
  //public void attack() {
    
  //}
  
  
  //public void superMove() {
    
  //}
  
  
  void whoLeads() {
    if (gretLeads) {
      xHspeed = 0.03*(xGret - xHans);
      yHspeed = 0.03*(yGret - yHans);
      
      //println(xHspeed + " " + yHspeed);
      
      xHans += xHspeed;
      yHans += yHspeed;
    }
    
    else if (hansLeads) {    
      xGspeed = -0.03*(xGret - xHans);
      yGspeed = -0.03*(yGret - yHans);
      
      xGret += xGspeed;
      yGret += yGspeed;
    }
  }  
  
  
  void display() {
    image(gretelImages[currentFrame + offset], xGret-35, yGret-35, 70, 100); 
    image(hanselImages[currentFrame + offset], xHans-35, yHans-35, 70, 100);
    //shape(cookie, 20, 20, 300, 300);
  }
  
  
  void walk() {
    xTile = 0;
    yTile = 0;
    yGTemp = 0;
    yHTemp = 0;
    xGTemp = 0;
    xHTemp = 0;
    if (up) {
      offset = 6;
      yGTemp = -5;
      gretLeads = true;
      hansLeads = false;
    }
    if (down) {
      offset = 0;
      yHTemp = 5;
      hansLeads = true;
      gretLeads = false;
    }
    if (left) {
      offset = 3;
      xHTemp = -5;
      hansLeads = true;
      gretLeads = false;
    }
    if (right) {
      offset = 9;
      xGTemp = 5; 
      gretLeads = true;
      hansLeads = false;
    }
    if (!up && !down && !left && !right) {
      currentFrame = 1;
      gretLeads = false;
      hansLeads = false;
    }
    else {
      if (delay == 0) {
        currentFrame = (currentFrame + 1) % loopFrames;
      }
      delay = (delay + 1) % 5;
    }
    if (gretLeads) {
        xTile = (xGret + xGTemp) / 64; 
        yTile = ((yGret + yGTemp) / 64);
        if (!checkBoundaries(xTile, yTile)) {
          xGret += xGTemp;
          yGret += yGTemp;
        }
        xLead = xGret;
        yLead = yGret;
     }
     else if (hansLeads){
        xTile = (xHans + xHTemp) / 64; 
        yTile = 1 + ((yHans + yHTemp) / 64);
        if (!checkBoundaries(xTile, yTile)) {
          xHans += xHTemp;
          yHans += yHTemp;
        }
        xLead = xHans;
        yLead = yHans;
     }
  }

  boolean checkBoundaries (int x, int y){
    if ((x == 25) ||(y == 15) || (x == -1) || (y == -1)) return true;
    if (checkTriggers(x, y)) return false;
    checkEnemy(x,y);
    return peep.map[y][x].isCollidable;
  }

  
  void checkEnemy(int x, int y) { 
    
    if (peep.map[y][x].isSpawnable) {
      double battleChance = random(1);
      if (battleChance > 0.33) {
        if (canBattle){
          //Grass tile = peep.map[y][x];
          setBattleUp((peep.map[y][x]).getMonType() );
          canBattle = false;
        }
      //}
      //System.out.println("chances: " + battleChance);
    } else {
       canBattle = true; 
    }
  }
}
  
  boolean checkTriggers (int x, int y) {
    //FACTOR IN WITCH HOUSE LATER
     if (peep.map[y][x].isTrigger){
       boolean inRadius = false;
       if (xLead <= 35) {
         xGret += 1510;
         xHans += 1510;
         inRadius = true;
       }
       if (xLead >= 1550){
         xGret -= 1514;
         xHans -= 1514;
         inRadius = true;
       }
       if (yLead <= 35) {
         yGret += 850;
         yHans += 850;
         inRadius = true;
       }
       if (yLead >= 880){
         yGret -= 820;
         yHans -= 820;
         inRadius = true;
       }
       if (inRadius) {
          peep.Triggered(x, y); 
       }
       return true;
     }
     return false;
  }
  
}
