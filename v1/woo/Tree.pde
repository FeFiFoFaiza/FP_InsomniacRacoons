class Tree extends Tile{
 
  PImage tree;
  
  public Tree(int xCor, int yCor){
      tree = loadImage("Tiles/tree.png");
      image(tree, xCor, yCor, 64, 64);
  }
}
