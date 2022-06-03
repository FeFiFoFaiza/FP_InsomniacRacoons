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
  
   void displayWitch() {
     Witch = loadImage("");
     image(Witch, x, y, 32, 32);
   }
  
   public int attack(String move) {
    int dmg = 0;
    String dialogue;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5);
      dialogue = "Muahahah. The Witch cackled!"; 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5);
      dialogue = "The Witch wacked you with broomstick!"; 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5);
       dialogue = "The Witch slapped you."; 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      dialogue = "The Witch splashed Draught of Living Death!";
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      dialogue = "The Witch used Confundo!";
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      dialogue = "The Witch casted Avada Kedavra!";
    } else {
      dmg = 0;
      dialogie = "oops?";
    }
    return dmg;
   }

}
