
class Grass extends Tile{
 
  PImage grass;
  
  public Grass(int xCor, int yCor){
      grass = loadImage("Tiles/grass.png");
      image(grass, xCor, yCor, 64, 64);
  }
}
