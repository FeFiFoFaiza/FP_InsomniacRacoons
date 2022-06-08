class Grass extends Tile{
 
  PImage grass;
  
  public Grass(int xCor, int yCor, boolean stat, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      grass = loadImage("Tiles/grass.png");
      image(grass, xCor, yCor, 64, 64);
      isSpawnable = stat;
  }
}
