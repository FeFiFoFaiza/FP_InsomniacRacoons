class Path extends Tile{
 
  PImage path;
  
  public Path(int xCor, int yCor, boolean stat, boolean isCollidable){
      super(xCor, yCor, false);
      path = loadImage("Tiles/road00.png");
      image(path, xCor, yCor, 64, 64);
      isTrigger = stat;
  }
}
