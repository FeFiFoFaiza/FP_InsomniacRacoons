class Rock extends Tile {
  
  PImage rock;
  
  public Rock(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      rock = loadImage("Tiles/Rock.png");
      image(rock, xCor, yCor, 64, 64);
  } 
}
