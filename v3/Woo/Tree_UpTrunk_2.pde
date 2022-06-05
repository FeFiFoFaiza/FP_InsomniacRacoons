class Tree_UpTrunk_2 extends Tile{
 
  PImage tree;
  
  public Tree_UpTrunk_2(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      tree = loadImage("Tiles/tree_upTrunk_2.png");
      image(tree, xCor, yCor, 64, 64);
  }
}
