class Witch extends Monsters {
  PImage Witch;
  float x;
  float y;
  
  public Witch (float xCor, float yCor) {
    x = xCor;
    y = yCor;
    setHealth(120);
    setStrength(8);
    setatkRate(1.8);
 
  }
  
   void display() {
     Witch = loadImage("");
     image(Witch, x, y, 32, 32);
   }
  
  void superMove() {
    
  }

}
