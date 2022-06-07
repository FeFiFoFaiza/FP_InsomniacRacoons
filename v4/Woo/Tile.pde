class Tile {
   int xCor;
   int yCor;
   boolean isCollidable;
   boolean isSpawnable;
   boolean isTrigger;
   
   
   public Tile(int x, int y, boolean stat) {
      xCor = x;
      yCor = y;
      isCollidable = stat;
   }
   
   int getXCor() {
      return xCor; 
   }
   
   int getYCor() {
     return yCor;
   }
}
