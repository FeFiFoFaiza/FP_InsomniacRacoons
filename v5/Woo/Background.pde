class Background {

  //String[] str;
  Tile[][] map = new Tile[25][25];
  int tileXCor;
  int tileYCor;
  int currIndex;
  DuplicateMap fwdTrigPnts;
  DuplicateMap prevTrigPnts;
  LinkedList<String[]> worldList;
  ListIterator<String[]> worldIterator;
  

  public Background(){
     //bg = loadImage("WorldPics/World.png");
     //str = loadStrings("World.txt");
      currIndex = 0;
      fwdTrigPnts = new DuplicateMap();
      prevTrigPnts = new DuplicateMap();
      worldList = new LinkedList<String[]>();
      for (int i = 0; i <= 8; i++) {
      worldList.add(loadStrings("WorldTxt/Forest" + i + ".txt"));
      }
      render(worldList.get(0));
  }
  
  void render(String[] str) {
    map = new Tile[15][25];
    tileXCor = 0;
    tileYCor = 0;
    prevTrigPnts.reset();
    fwdTrigPnts.reset();
    for (int j = 0; j < 15; j++) {
      for (int i = 0; i < 25; i++) {
        if(str[j].charAt(i) == '-'){
          map[j][i] = new Path(tileXCor, tileYCor, false, false); // path
        }
        else if (str[j].charAt(i) == '*'){
          map[j][i] = new Grass(tileXCor, tileYCor, false, false); // grass
        }
        else if (str[j].charAt(i) == 'H'){
          map[j][i] = new Tree(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == '#'){
          map[j][i] = new Path(tileXCor, tileYCor, true, false); // forward trigger points
          fwdTrigPnts.addValue(i, j);
        }
        else if (str[j].charAt(i) == '$'){
          map[j][i] = new Path(tileXCor, tileYCor, true, false); // backward trigger points
          prevTrigPnts.addValue(i, j);
        }
        else if (str[j].charAt(i) == '@'){
          map[j][i] = new Grass(tileXCor, tileYCor, true, false); // battle grass
        }
        else if (str[j].charAt(i) == 'm'){
          map[j][i] = new Water(tileXCor, tileYCor, true); 
        }
        else if (str[j].charAt(i) == 'R'){
          map[j][i] = new Rock(tileXCor, tileYCor, true);
         }
        else if (str[j].charAt(i) == 'B'){
          map[j][i] = new Bridge(tileXCor, tileYCor, true, false); //bridge
        }
        // trees
        else if (str[j].charAt(i) == '1'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "A");
        }
        else if (str[j].charAt(i) == '2'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "B");
        }
        else if (str[j].charAt(i) == '3'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "C");
        }
        else if (str[j].charAt(i) == '4'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "D");
        }
        
        else if (str[j].charAt(i) == '5'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "E");
        }
        else if (str[j].charAt(i) == '6'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "F");
        }
        else if (str[j].charAt(i) == '7'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "G");
        }
        else if (str[j].charAt(i) == '8'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "H");
        }
        
        else if (str[j].charAt(i) == '9'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "I");
        }
        else if (str[j].charAt(i) == '0'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "J");
        }
        else if (str[j].charAt(i) == 'P'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "K");
        }
        else if (str[j].charAt(i) == 'O'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "L");
        }
        else if (str[j].charAt(i) == 'S'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "M");
        }
        else if (str[j].charAt(i) == 'A'){
          map[j][i] = new Tree(tileXCor, tileYCor, true, "N");
        }
        
        //water
        else if (str[j].charAt(i) == 'q'){
          map[j][i] = new Water(tileXCor, tileYCor, true, "A");
        }
        else if (str[j].charAt(i) == 'w'){
          map[j][i] = new Water(tileXCor, tileYCor, true, "B");
        }
        else if (str[j].charAt(i) == 'e'){
          map[j][i] = new Water(tileXCor, tileYCor, true, "C");
        }
        else if (str[j].charAt(i) == 'r'){
          map[j][i] = new Water(tileXCor, tileYCor, true, "D");
        }
        else if (str[j].charAt(i) == 't'){
          map[j][i] = new Water(tileXCor, tileYCor, true, "E");
        }
        else if (str[j].charAt(i) == 'y'){
          map[j][i] = new Water(tileXCor, tileYCor, true, "F");
        }
        else if (str[j].charAt(i) == 'u'){
          map[j][i] = new Water(tileXCor, tileYCor, true, "G");
        }
        else if (str[j].charAt(i) == 'i'){
          map[j][i] = new Water(tileXCor, tileYCor, true, "H");
        }
        tileXCor += 64;
       }
       tileXCor = 0;
       tileYCor += 64;   
     }
     bg = loadImage("WorldPics/Forest_" + currIndex + ".png");
  }
  
  PImage bgImage() {
    return bg;
  }


void Triggered(int x, int y){
    if (fwdTrigPnts.contains(x, y)) {
      if (currIndex < worldList.size() -1){
        currIndex++;
        render(worldList.get(currIndex));
      }
    } else if (prevTrigPnts.contains(x, y)) {
        if (currIndex > 0){
          currIndex--;
          render(worldList.get(currIndex));
      }
    }
  }
  
}
