class Background {

  String[] str;
  Tile[][] map = new Tile[25][25];
  int tileXCor;
  int tileYCor;
  
  PImage bg;

  public Background(){
     //bg = loadImage("WorldPics/World.png");
     //str = loadStrings("World.txt");
     ForestUno();
     render();
  }
  
  void render(){
    map = new Tile[25][25];
    tileXCor = 0;
    tileYCor = 0;
    for (int j = 0; j < str.length; j++) {
      for (int i = 0; i < 25; i++) {
        if(str[j].charAt(i) == '1'){
          map[j][i] = new Path(tileXCor, tileYCor, false, false);
        }
        else if (str[j].charAt(i) == '2'){
          map[j][i] = new Grass(tileXCor, tileYCor, false, false);
        }
        else if (str[j].charAt(i) == '3'){
          map[j][i] = new Tree(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == 'A'){
          map[j][i] = new Path(tileXCor, tileYCor, true, false);
        }
        else if (str[j].charAt(i) == 'B'){
          map[j][i] = new Grass(tileXCor, tileYCor, true, false);
        }
        tileXCor += 64;
       }
       tileXCor = 0;
       tileYCor += 64;
       
     }
  }

  PImage bgImage(){
     return bg; 
  }

  void ForestUno(){
    bg = loadImage("WorldPics/Forest1.png");
    str = loadStrings("Forest1.txt");
  }
  
}
