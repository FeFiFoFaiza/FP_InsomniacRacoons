//easy 
class Imp extends Monsters {
  
  PImage Imp;
  
  public Imp() {
    super();
    setHp(1000);
    setStrength(8);
    name = "Imp";
    
  }
  
  public void display() {
    Imp = loadImage("");
    image(Imp, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5));
      text("Imp screetches.", 50, 800); 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      text("Imp circles around you.", 50, 800); 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       text("Imp is invisible and punches you.", 50, 800); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      text("Imp conjures fire and throws it at you.", 50, 800);
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      text("Imp teleports behind you and kicks you.", 50, 800);
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      text("Imp rebirthes stronger than ever and leaps at you.", 50, 800);
    } else {
      dmg = 0;
      println("oops? attack went wrong, no dmg", 50, 800);
    }
    return dmg;
   }
  

}
