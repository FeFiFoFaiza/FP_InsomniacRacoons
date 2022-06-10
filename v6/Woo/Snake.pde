//medium
class Snake extends Monsters {
  
  PImage Snake;
  
  public Snake() {
    super();
    name = "Snake";
    setHp(50);
    setStrength(8);
    
  }
  
  public void display() {
    Snake = loadImage("");
    image(Snake, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5));
      text("Snake rattles its tail.", 50, 800); 
    } else if (move.equals("basic2") ) {
       dmg = (int)(strength * (0.5));
      text("Snake meanacingly slithers around you.", 50, 800); 
    } else if (move.equals("basic3") ) {
       dmg = (int)(strength * (0.5));
       text("Snake sticks its tongue out at you.", 50, 800); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      text("Snake whips its tail at you.", 50, 800);
    } else if (move.equals("mid2") ) {
      dmg = (int)(strength);
      text("Snake spits venom at your face.", 50, 800);
    } else if (move.equals("ult") ) {
      dmg = (int)(strength * (2));
      text("Snake bites you and poisons you.", 50, 800);
    } else {
      dmg = 0;
      println("oops? attack went wrong, no dmg");
    }
    return dmg;
   }
  

}
