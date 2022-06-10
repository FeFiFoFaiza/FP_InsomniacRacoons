class Grass extends Tile{
 
  PImage grass;
  
  
  public Grass(int xCor, int yCor, boolean stat, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      grass = loadImage("Tiles/grass.png");
      image(grass, xCor, yCor, 64, 64);
      if (currIndex <= 2) {
       monsterType = "Imp";
      } else if (currIndex <= 5) {
        monsterType = "Snake";
      } else if (currIndex <= 9) {
        monsterType = "Siren";
      }
      isSpawnable = stat;
  }
  

}

class WitchHouse extends Tile{
  PImage WitchHouse;
  String monsterType;
  
  public WitchHouse(int xCor, int yCor, boolean stat, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      WitchHouse = loadImage("Tiles/witchHouse.png");
      image(WitchHouse, xCor, yCor, 64, 64);
      isSpawnable = stat;
  }
  
}
