class Witch extends Monsters {
  PImage Witch;
  int x;
  int y;
  
  public Witch (int xCor, int yCor) {
    x = xCor;
    y = yCor;
    setHealth(120);
    setStrength(12);
    
  }
  
   void display() {
     Witch = loadImage("");
     image(Witch, x, y, 32, 32);
   }
  
   public int attack(String move) {
    int dmg = 0;
    String dialogue;
    if (move == "basic1") {
      dmg = (int)(strength * (0.5);
      dialogue = "Muahahah. Witch cackled!"; 
    } else if (move == "basic2") {
       dmg = (int)(strength * (0.5);
      dialogue = "Witch is wacked you with broomstick"; 
    } else if (move == "basic3") {
       dmg = (int)(strength * (0.5);
       dialogue = "Witch slapped you."; 
    } else if (move == "mid1") {
      dmg = (int)(strength);
      dialogue = "Witch splashed Draughtof Living Death!";
    } else if (move == "mid2") {
      dmg = (int)(strength);
      dialogue = "Witch used Confundo!";
    } else if (move == "ult") {
      dmg = (int)(strength * (2));
      dialogue = "Witch casted spell of Wailing Children";
    } else {
      dmg = 0;
      dialogie = "oops?";
    }
    return dmg;
   }

}
