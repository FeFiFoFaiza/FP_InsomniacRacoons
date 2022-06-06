//boss
class Wolf extends Monsters {
  
  PImage Wolf;
  
  public Wolf() {
    super();
    name = "Wolf";
    setHealth(80);
    setStrength(15);
    
  }
  
  public void display() {
    Wolf = loadImage("");
    image(Wolf, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    String dialogue;
    if (move.equals("basic1") ) {
      dmg = (int)(strength * (0.5));
      dialogue = "The Big Bad Wolf growls."; 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      dialogue = "The Big Bad Wolf Wolf licks its teeth."; 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       dialogue = "The Big Bad Wolf Wolf scratches you."; 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      dialogue = "The Big Bad Wolf Wolf pounces on you.";
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      dialogue = "The Big Bad Wolf Wolf slams you to the ground.";
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      dialogue = "The Big Bad Wolf throws you across the field.";
    } else {
      dmg = 0;
      dialogue = "oops?";
    }
    return dmg;
   }
  

}
