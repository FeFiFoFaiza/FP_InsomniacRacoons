class Path extends Tile{
 
  PImage path;
  
  public Path(int xCor, int yCor){
      path = loadImage("Tiles/road00.png");
      image(path, xCor, yCor, 64, 64);
  }
}

