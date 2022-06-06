//medium
class Snake extends Monsters {
  
  PImage Snake;
  
  public Snake() {
    super();
    name = "Snake";
    setHealth(50);
    setStrength(8);
    
  }
  
  public void display() {
    Snake = loadImage("");
    image(Snake, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    String dialogue;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5));
      dialogue = "Snake rattles its tail."; 
    } else if (move.equals("basic2") ) {
       dmg = (int)(strength * (0.5));
      dialogue = "Snake meanacingly slithers around you."; 
    } else if (move.equals("basic3") ) {
       dmg = (int)(strength * (0.5));
       dialogue = "Snake sticks its tongue out at you."; 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      dialogue = "Snake whips its tail at you.";
    } else if (move.equals("mid2") ) {
      dmg = (int)(strength);
      dialogue = "Snake spits venom at your face.";
    } else if (move.equals("ult") ) {
      dmg = (int)(strength * (2));
      dialogue = "Snake bites you and poisons you.";
    } else {
      dmg = 0;
      dialogue = "oops? attack went wrong, no dmg";
    }
    return dmg;
   }
  

}
