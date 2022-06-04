class Tree_Full_4 extends Tile{
 
  PImage tree;
  
  public Tree_Full_4(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      tree = loadImage("Tiles/tree_full_4.png");
      image(tree, xCor, yCor, 64, 64);
  }
}
