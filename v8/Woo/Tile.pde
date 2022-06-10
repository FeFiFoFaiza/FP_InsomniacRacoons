class Tile {
   int xCor;
   int yCor;
   boolean isCollidable;
   boolean isSpawnable;
   boolean isTrigger;
   String monsterType;
   
   
   public Tile(int x, int y, boolean stat) {
      xCor = x;
      yCor = y;
      isCollidable = stat;
      isSpawnable = false;
      isTrigger = false;
   }
   
   int getXCor() {
      return xCor; 
   }
   
   int getYCor() {
     return yCor;
   }
   
  public String getMonType() {
    return monsterType;
   }
   
}
