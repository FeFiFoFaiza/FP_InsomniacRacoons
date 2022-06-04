class Tree_Full_3 extends Tile{
 
  PImage tree;
  
  public Tree_Full_3(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      tree = loadImage("Tiles/tree_full_3.png");
      image(tree, xCor, yCor, 64, 64);
  }
}
