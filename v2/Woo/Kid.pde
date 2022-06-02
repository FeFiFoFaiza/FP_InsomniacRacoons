import java.util.*;

class Kid {
  
  String _name;
  int _health;
  int _strength;
  
  int xGret = 200;
  int yGret = 200;
  float xGspeed = 0;
  float yGspeed = 0;
  
  int xHans = 170;
  int yHans = 200;
  float xHspeed = 0;
  float yHspeed = 0;
  
  boolean gretLeads, hansLeads;
  
  int currentFrame = 0;
  int loopFrames = 3;
  int offset = 0;
  int delay = 0;
  
  Queue inventory = new LinkedList<>();
  boolean pickedUp = false;
  
  Item cookie = new Item();
  Item items[] = new Item[6];
  
  int xTile, yTile, yGTemp, xGTemp, yHTemp, xHTemp;


  boolean inventoryFull() {
    return (inventory.size() > 6);
  }
  
  
  void updateInventory(Item item) {
    if (pickedUp) {
      if (!inventoryFull()) {
        inventory.add(item);
      }
      else {
        // idk how to drop items on the ground,
        // maybe display the PImage and then its pickuppable
        inventory.remove();
        inventory.add(item);
      }
    }
  }
  
  
  Kid() {
    this._health = 1;
    this._strength = 1;
  }
  
  
  Kid(int hp, int str) {
    this._health = hp;
    this._strength = str;
  }
  
  
  int getHealth() {
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
    xTile, yTile, yGTemp, xGTemp, yHTemp, xHTemp = 0;
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
    if (gretLeads){
        xTile = (xGret + xGTemp) / 64; 
        yTile = (yGret + yGTemp) / 64;
        if (checkBoundaries(xTile, yTile)) {
           System.out.println("TREEEEE: " + xTile + " " +yTile);
           System.out.println(xGret + " " + yGret);
        } else {
          xGret += xGTemp;
          yGret += yGTemp;
        }
     }
     else if (hansLeads){
        xTile = (xHans + xHTemp) / 64; 
        yTile = 1 + ((yHans + yHTemp) / 64);
        if (checkBoundaries(xTile, yTile)) {
           System.out.println("TREEEEE: " + xTile + " " +yTile);
           System.out.println(xHans + " " + yHans);
        } else {
          xHans += xHTemp;
          yHans += yHTemp;
        }
     }
  }

  boolean checkBoundaries (int x, int y){
    return peep.map[y][x].isCollidable;
  }
  
  boolean checkTriggers (int x, int y) {
     if (peep.map[y][x].isTrigger) {
       if (xGret == 0) || (xHans == 0) {
         xGret == 1600;
         xHans == 1570;
       }
       if (xGret == 1600) || (xHans == 1600){
         yGret == 0;
         yHans == 30;
       }
       if (yGret == 0) || (yHans == 0) {
         yGret == 1600;
         yHans == 1570;
       }
       if (yGret == 1600) || (yHans == 1600){
         yGret == 0;
         yHans == 30;
       }
     }
     return false;
  }
}
