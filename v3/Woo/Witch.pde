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
      story.add("Muahahah. The Witch cackles!"); 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      story.add("The Witch wackes you with broomstick!"); 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       story.add("The Witch slaps you."); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      story.add("The Witch splashes Draught of Living Death!");
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      story.add("The Witch uses Confundo!");
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      story.add("The Witch casts Avada Kedavra!");
    } else {
      dmg = 0;
      println("oops?");
    }
    return dmg;
   }

}
