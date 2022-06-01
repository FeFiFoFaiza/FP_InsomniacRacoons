class Background {

  String[] str;
  Tile[][] map;
  int tileXCor;
  int tileYCor;

  public Background(){
     str = loadStrings("World.txt");
     map = new Tile[25][25];
     tileXCor = 0;
     tileYCor = 0;
     for (int j = 0; j < str.length; j++) {
       for (int i = 0; i < 25; i++) {
          if(str[j].charAt(i) == '1'){
              map[j][i] = new Path(tileXCor, tileYCor);
          }
          else if (str[j].charAt(i) == '2'){
            map[j][i] = new Grass(tileXCor, tileYCor);
          }
          else if (str[j].charAt(i) == '3'){
            map[j][i] = new Tree(tileXCor, tileYCor);
          }
          tileXCor += 64;
       }
       tileXCor = 0;
       tileYCor += 64;
       
     }
     
  }
}
