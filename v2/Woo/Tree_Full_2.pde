class Tree_Full_2 extends Tile{
 
  PImage tree;
  
  public Tree_Full_2(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      tree = loadImage("Tiles/tree_full_2.png");
      image(tree, xCor, yCor, 64, 64);
  }
}
