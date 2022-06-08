//easy 
class Imp extends Monsters {
  
  PImage Imp;
  
  public Imp(int xCor, int yCor) {
    super();
    x = xCor; //Tile's
    y = yCor; //Tile's
    setHealth(50);
    setStrength(8);
    
  }
  
  public void display() {
    Imp = loadImage("");
    image(Imp, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    String dialogue;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5);
      dialogue = "Imp screetches."; 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5);
      dialogue = "Imp circles around you."; 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5);
       dialogue = "Imp is invisible and punches you."; 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      dialogue = "Imp conjures fire and throws it at you.";
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      dialogue = "Imp teleports behind you and kicks you.";
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      dialogue = "Imp rebirthes stronger than ever and leaps at you.";
    } else {
      dmg = 0;
      dialogue = "oops? attack went wrong, no dmg";
    }
    return dmg;
   }
  

}
