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
          map[j][i] = new Path(tileXCor, tileYCor, true, false); // trigger points
        }
        else if (str[j].charAt(i) == '@'){
          map[j][i] = new Grass(tileXCor, tileYCor, true, false); // battle grass
        }
        
        
        // trees
        else if (str[j].charAt(i) == '1'){
          map[j][i] = new Tree_Full_1(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == '2'){
          map[j][i] = new Tree_Full_2(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == '3'){
          map[j][i] = new Tree_Full_3(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == '4'){
          map[j][i] = new Tree_Full_4(tileXCor, tileYCor, true);
        }
        
        else if (str[j].charAt(i) == '5'){
          map[j][i] = new Tree_Edge_1(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == '6'){
          map[j][i] = new Tree_Edge_2(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == '7'){
          map[j][i] = new Tree_Edge_3(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == '8'){
          map[j][i] = new Tree_Edge_4(tileXCor, tileYCor, true);
        }
        
        else if (str[j].charAt(i) == '9'){
          map[j][i] = new Tree_Up_1(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == '0'){
          map[j][i] = new Tree_Up_2(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == 'P'){
          map[j][i] = new Tree_UpFill_1(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == 'O'){
          map[j][i] = new Tree_UpFill_2(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == 'S'){
          map[j][i] = new Tree_UpTrunk_1(tileXCor, tileYCor, true);
        }
        else if (str[j].charAt(i) == 'A'){
          map[j][i] = new Tree_UpTrunk_2(tileXCor, tileYCor, true);
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
