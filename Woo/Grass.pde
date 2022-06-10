class Grass extends Tile{
 
  PImage grass;
  PImage witchHouse = loadImage("Enemies/WitchHouse.png");
  
  public Grass(int xCor, int yCor, boolean stat, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      grass = loadImage("Tiles/grass.png");
      image(grass, xCor, yCor, 64, 64);
      if (currIndex <= 2) {
       monsterType = "Imp";
      } else if (currIndex <= 5 || currIndex == 7) {
        monsterType = "Snake";
      } else if (currIndex <= 6) {
        monsterType = "Siren";
      } else if (currIndex == 8) {
        image(witchHouse, 638, 67);
        monsterType = "Witch";
      }
      isSpawnable = stat;
  }
}

class WolfBoss extends Tile{
  PImage WolfBoss;
  String monsterType;
  
  public WolfBoss(int xCor, int yCor, boolean stat, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      monsterType = "Wolf";
      WolfBoss = loadImage("Enemies/WolfBattle.png");
      image(WolfBoss, 0, 0, 1600, 960);
      isSpawnable = stat;
  } 
}

class WitchHouse extends Tile{
  PImage WitchHouse;
  String monsterType;
  
  public WitchHouse(int xCor, int yCor, boolean stat, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      WitchHouse = loadImage("Enemies/WitchHouse.png");
      image(WitchHouse, xCor, yCor, 64, 64);
      isSpawnable = stat;
  }
}
