class Tree_Edge_3 extends Tile{
 
  PImage tree;
  
  public Tree_Edge_3(int xCor, int yCor, boolean isCollidable){
      super(xCor, yCor, isCollidable);
      tree = loadImage("Tiles/tree_edge_3.png");
      image(tree, xCor, yCor, 64, 64);
  }
}
