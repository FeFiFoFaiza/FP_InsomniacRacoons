class Tree_Full_1 extends Tile{
 
  PImage tree;
  
  public Tree_Full_1(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      tree = loadImage("Tiles/tree_full_1.png");
      image(tree, xCor, yCor, 64, 64);
  }
}
