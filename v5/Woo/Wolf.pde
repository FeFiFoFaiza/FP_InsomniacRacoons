//boss
class Wolf extends Monsters {
  
  PImage Wolf;
  
  public Wolf() {
    super();
    name = "Wolf";
    setHp(80);
    setStrength(15);
    
  }
  
  public void display() {
    Wolf = loadImage("");
    image(Wolf, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1") ) {
      dmg = (int)(strength * (0.5));
      text("The Big Bad Wolf growls.", 50, 800); 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      text("The Big Bad Wolf Wolf licks its teeth.", 50, 800); 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       text("The Big Bad Wolf Wolf scratches you.", 50, 800); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      text("The Big Bad Wolf Wolf pounces on you.", 50, 800);
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      text("The Big Bad Wolf Wolf slams you to the ground.", 50, 800);
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      text("The Big Bad Wolf throws you across the field.", 50, 800);
    } else {
      dmg = 0;
      println("oops?");
    }
    return dmg;
   }
  

}
