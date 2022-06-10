class Tree extends Tile{
 
  PImage tree;
  
  public Tree(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      tree = loadImage("Tiles/tree.png");
      image(tree, xCor, yCor, 64, 64);
  }
  
  public Tree(int xCor, int yCor, boolean isCollidable, String type){
      super(xCor, yCor, isCollidable);
      if (type.equals("A")) {
         tree = loadImage("Tiles/tree_edge_1.png"); 
      } else if (type.equals("B")){
         tree = loadImage("Tiles/tree_edge_2.png"); 
      } else if (type.equals("C")){
         tree = loadImage("Tiles/tree_edge_3.png"); 
      } else if (type.equals("D")){
         tree = loadImage("Tiles/tree_edge_4.png"); 
      } else if (type.equals("E")){
         tree = loadImage("Tiles/tree_full_1.png"); 
      } else if (type.equals("F")){
         tree = loadImage("Tiles/tree_full_2.png"); 
      } else if (type.equals("G")){
         tree = loadImage("Tiles/tree_full_3.png"); 
      } else if (type.equals("H")){
         tree = loadImage("Tiles/tree_full_4.png");
      } else if (type.equals("I")){
         tree = loadImage("Tiles/tree_up_1.png"); 
      } else if (type.equals("J")){
         tree = loadImage("Tiles/tree_up_2.png"); 
      } else if (type.equals("K")){
         tree = loadImage("Tiles/tree_upFill_1.png"); 
      } else if (type.equals("L")){
         tree = loadImage("Tiles/tree_upFill_2.png"); 
      } else if (type.equals("M")){
         tree = loadImage("Tiles/tree_upTrunk_1.png"); 
      } else if (type.equals("N")){
         tree = loadImage("Tiles/tree_upTrunk_2.png");
      } else {
        tree = loadImage("Tiles/tree.png");
      }
      image(tree, xCor, yCor, 64, 64);
  }
  
}

class Rock extends Tile {
  
  PImage rock;
  
  public Rock(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      rock = loadImage("Tiles/Rock.png");
      image(rock, xCor, yCor, 64, 64);
  } 
}

class Water extends Tile {
  
  PImage water;
  
  public Water(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      water = loadImage("Tiles/water.png");  
      image(water, xCor, yCor, 64, 64);
  }
  
  public Water(int xCor, int yCor, boolean isCollidable, String type){
      super(xCor, yCor, isCollidable);
      if (type.equals("A")){
        water = loadImage("Tiles/water_edge_N.png");  
      } else if (type.equals("B")){
        water = loadImage("Tiles/water_edge_NE.png");  
      } else if (type.equals("C")){
        water = loadImage("Tiles/water_edge_E.png");  
      } else if (type.equals("D")){
        water = loadImage("Tiles/water_edge_SE.png");  
      } else if (type.equals("E")){
        water = loadImage("Tiles/water_edge_S.png");  
      } else if (type.equals("F")){
        water = loadImage("Tiles/water_edge_SW.png");  
      } else if (type.equals("G")){
        water = loadImage("Tiles/water_edge_W.png");  
      } else if (type.equals("H")){
        water = loadImage("Tiles/water_edge_NW.png"); 
      } else{
        water = loadImage("Tiles/water.png"); 
      }
      image(water, xCor, yCor, 64, 64);
  }
}
