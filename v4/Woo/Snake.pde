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
      story.add("Snake rattles its tail."); 
    } else if (move.equals("basic2") ) {
       dmg = (int)(strength * (0.5));
      story.add("Snake meanacingly slithers around you."); 
    } else if (move.equals("basic3") ) {
       dmg = (int)(strength * (0.5));
       story.add("Snake sticks its tongue out at you."); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      story.add("Snake whips its tail at you.");
    } else if (move.equals("mid2") ) {
      dmg = (int)(strength);
      story.add("Snake spits venom at your face.");
    } else if (move.equals("ult") ) {
      dmg = (int)(strength * (2));
      story.add("Snake bites you and poisons you.");
    } else {
      dmg = 0;
      println("oops? attack went wrong, no dmg");
    }
    return dmg;
   }
  

}
