class Background {

  String[] str;
  Tile[][] map = new Tile[25][25];
  int tileXCor;
  int tileYCor;
  int nextSetting;
  LinkedList<String> worldList = new LinkedList<String>();
  
  PImage bg;
  //Imp imp = new Imp();
  //Battle battle = new Battle(imp);

  public Background(){
     //bg = loadImage("WorldPics/World.png");
     //str = loadStrings("World.txt");
     Forest1();
     render();
  }
  
  void render() {
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
        else if (str[j].charAt(i) == 'w'){
          map[j][i] = new Water(tileXCor, tileYCor, true); 
        }
        else if (str[j].charAt(i) == 'R'){
          map[j][i] = new Rock(tileXCor, tileYCor, true);
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
  }

  PImage bgImage() {
    return bg;
  }
  
  void Forest1() {
    bg = loadImage("WorldPics/Forest_1.png");
    str = loadStrings("Forest1.txt");
    nextSetting = 2;
  }
  
  void Forest2() {
    bg = loadImage("WorldPics/Forest_2.png");
    str = loadStrings("Forest2.txt");
    nextSetting = 3;
  }
  
  void Forest3() {
   bg = loadImage("WorldPics/Forest_3.png");
    str = loadStrings("Forest3.txt");
    nextSetting = 4;
  }
  
  void Forest4() {
    bg = loadImage("WorldPics/Forest_4.png");
    str = loadStrings("Forest4.txt");
    nextSetting = 5; 
  }
  
  void Forest5() {                    
    bg = loadImage("WorldPics/Forest_5.png");
    str = loadStrings("Forest5.txt");
    nextSetting = 6; 
  }
  
  void Forest6() {                
    bg = loadImage("WorldPics/Forest_6.png");
    str = loadStrings("Forest6.txt");
    nextSetting = 7;
  }
  
  void Forest7() {            
    bg = loadImage("WorldPics/Forest_7.png");
    str = loadStrings("Forest7.txt");
    nextSetting = 8;
  }
  
  void Forest8() {            
    bg = loadImage("WorldPics/Forest_8.png");
    str = loadStrings("Forest8.txt");
    nextSetting = 9;
  }
  
  void Forest9() {            
    bg = loadImage("WorldPics/Forest_9.png");
    str = loadStrings("Forest9.txt");
    nextSetting = 10;
  }
  
  void Forest10() {            
    bg = loadImage("WorldPics/Forest_10.png");
    str = loadStrings("Forest10.txt");
    nextSetting = 11;
  }
  
  void battleMenu() {
    if (inBattle) {
      bg = loadImage("WorldPics/black.png");
    }
  }
  
  void battleTurn() {
    if (inBattle) {
      battle.turn();
    }
  }
  
  void nextSetting() {
    if (nextSetting == 2) {
      Forest1();
      render();
    } else if (nextSetting == 3) {
      Forest2();
      render();
    } else if (nextSetting == 4) {
      Forest3();
      render();
    } else if (nextSetting == 5) {
      Forest4();
      render();
    } else if (nextSetting == 6) {
      Forest5();
      render();
    } else if (nextSetting == 7) {
      Forest6();
      render();
    } else if (nextSetting == 8) {
      Forest7();
      render();
    } else if (nextSetting == 9) {
      Forest8();
      render();
    } else if (nextSetting == 10) {
      Forest8();
      render();
    } else if (nextSetting == 11) {
      Forest10();
      render();
    }
 }
  
  void setUpList() {
    for (int i = 1; i <= 4; i++) {
       worldList.add("Forest" + i + ".png");
    }
    System.out.println(worldList.size());
  }
  
}
