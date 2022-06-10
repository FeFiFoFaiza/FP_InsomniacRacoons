//final boss
class Witch extends Monsters {
  
  PImage Witch;
  
  public Witch (int xCor, int yCor) {
    super();
    x = xCor;
    y = yCor;
    name = "Witch";
    setHp(200);
    setStrength(20);
    
  }
  
  public void display() {
     Witch = loadImage("");
     image(Witch, x, y, 32, 32);
   }
   
   public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5));
      text("Muahahah. The Witch cackles!", 50, 800);
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      text("The Witch wackes you with broomstick!", 50, 800); 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       text("The Witch slaps you.", 50, 800); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      text("The Witch splashes Draught of Living Death!", 50, 800);
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      text("The Witch uses Confundo!", 50, 800);
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      text("The Witch casts Avada Kedavra!", 50, 800);
    } else {
      dmg = 0;
      println("oops?");
    }
    return dmg;
   }

}
