class Wolf extends Monsters {
  PImage Wolf;
  int x;
  int y;
  
  public Wolf(int xCor, int yCor) {
    x = xCor;
    y = yCor;
    setHealth(80);
    setStrength(10);
    
  }
  
  void display() {
    Wolf = loadImage("");
    image(Wolf, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    String dialogue;
    if (move == "basic1") {
      dmg = (int)(strength * (0.5);
      dialogue = "Wolf growled."; 
    } else if (move == "basic2") {
       dmg = (int)(strength * (0.5);
      dialogue = "Wolf licked its teeth."; 
    } else if (move == "basic3") {
       dmg = (int)(strength * (0.5);
       dialogue = "Wolf scratched you."; 
    } else if (move == "mid1") {
      dmg = (int)(strength);
      dialogue = "Wolf pounced on you.";
    } else if (move == "mid2") {
      dmg = (int)(strength);
      dialogue = "Wolf slammed you to the ground.";
    } else if (move == "ult") {
      dmg = (int)(strength * (2));
      dialogue = "Wolf throws you across the field.";
    } else {
      dmg = 0;
      dialogie = "oops?";
    }
    return dmg;
   }
  

}
