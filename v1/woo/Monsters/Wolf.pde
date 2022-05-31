class Wolf extends Monsters {
  PImage Wolf;
  float x;
  float y;
  
  public Wolf(float xCor, float yCor) {
    x = xCor;
    y = yCor;
    setHealth(80);
    setStrength(10);
    setatkRate(1.5);
    
    //moveList = ??
  }
  
  void display() {
    Wolf = loadImage("");
    image(Wolf, x, y, 32, 32);
  
  }
  
  
  void superMove() {
    
  }

}
