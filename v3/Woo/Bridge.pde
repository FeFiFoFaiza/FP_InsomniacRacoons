class Bridge extends Tile{
 
  PImage bridge;
  
  public Bridge(int xCor, int yCor, boolean stat, boolean isCollidable){
      super(xCor, yCor, false);
      bridge = loadImage("Tiles/Bridge.png"); 
      image(bridge, xCor, yCor, 64, 64);
      isTrigger = stat;
  }
}
