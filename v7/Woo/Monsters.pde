import java.util.*;

class Monsters {
  
  int health;
  int strength;
  int x;
  int y;
  String name;
  String attack;

  private Queue<String> moveList = new LinkedList<String>();
  
  public Monsters() {
    moveList.add("basic1");
    moveList.add("basic2");
    moveList.add("basic3");
    moveList.add("mid1");
    moveList.add("mid2");
    moveList.add("basic2");
    moveList.add("ult");
    attack = "";
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
   }
 
  public boolean isAlive() {
    return (health > 0);
  }
  
  public void display() {
  
  }
  
  public String getName() {
    return name;
  }
  
  public int getHp() {
    return health;
  }
  
  public int getStrength() {
    return strength;
  }
  
  
  public int setHp(int h) {
    this.health = h;
    return h;
  }
  
  public int setStrength(int s) {
    this.strength = s;
    return s;
  }
  
  public int attack(String n) {
    return 0;
  }

  String getAttack(){
    return attack;
  }

}


//easy 
class Imp extends Monsters {
  
  PImage Imp;
  
  public Imp() {
    super();
    setHp(80);
    setStrength(800);
    name = "Imp";
    
  }
  
  public void display() {
    Imp = loadImage("");
    image(Imp, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5));
      attack = "Imp screetches."; 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      attack = "Imp circles around you."; 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       attack = "Imp is invisible and punches you."; 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      attack = "Imp conjures fire and throws it at you.";
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      attack = "Imp teleports behind you and kicks you.";
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      attack = "Imp rebirthes stronger than ever and leaps at you.";
    } else {
      dmg = 0;
      attack = "oops? attack went wrong, no dmg";
    }
    return dmg;
   }
  

}

//medium
class Snake extends Monsters {
  
  PImage Snake;
  
  public Snake() {
    super();
    name = "Snake";
    setHp(50);
    setStrength(8);
    
  }
  
  public void display() {
    Snake = loadImage("");
    image(Snake, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5));
      text("Snake rattles its tail.", 50, 800); 
    } else if (move.equals("basic2") ) {
       dmg = (int)(strength * (0.5));
      text("Snake meanacingly slithers around you.", 50, 800); 
    } else if (move.equals("basic3") ) {
       dmg = (int)(strength * (0.5));
       text("Snake sticks its tongue out at you.", 50, 800); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      text("Snake whips its tail at you.", 50, 800);
    } else if (move.equals("mid2") ) {
      dmg = (int)(strength);
      text("Snake spits venom at your face.", 50, 800);
    } else if (move.equals("ult") ) {
      dmg = (int)(strength * (2));
      text("Snake bites you and poisons you.", 50, 800);
    } else {
      dmg = 0;
      println("oops? attack went wrong, no dmg");
    }
    return dmg;
   }
  

}

//Hard, after Wolf
class Siren extends Monsters {
  
  PImage Siren;
  
  public Siren() {
    super();
    setHp(100);
    setStrength(15);
    name = "Siren";
    
  }
  
  public void display() {
    Siren = loadImage("");
    image(Siren, x, y, 32, 32);
  
  }

  public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5));
      text("Siren stares at you, suggestingly.", 50, 800); 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      text("Siren smiles at you, arms open.", 50, 800); 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       text("Siren swims around you.", 50, 800); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      text("Siren sings beautifully.", 50, 800);
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      text("Siren drags you by the arm to her home.", 50, 800);
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      text("Siren throws her child at you and sings a song of lamentation.", 50, 800);
    } else {
      dmg = 0;
      println("oops? attack went wrong, dmg 0");
    }
    return dmg;
   }
  

}

//boss
class Wolf extends Monsters {
  
  PImage Wolf;
  
  public Wolf() {
    super();
    name = "Wolf";
    setHp(80);
    setStrength(15);
    
  }
  
  public void display() {
    Wolf = loadImage("");
    image(Wolf, x, y, 32, 32);
  
  }
  
  public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1") ) {
      dmg = (int)(strength * (0.5));
      text("The Big Bad Wolf growls.", 50, 800); 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      text("The Big Bad Wolf Wolf licks its teeth.", 50, 800); 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       text("The Big Bad Wolf Wolf scratches you.", 50, 800); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      text("The Big Bad Wolf Wolf pounces on you.", 50, 800);
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      text("The Big Bad Wolf Wolf slams you to the ground.", 50, 800);
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      text("The Big Bad Wolf throws you across the field.", 50, 800);
    } else {
      dmg = 0;
      println("oops?");
    }
    return dmg;
   }
  

}

//final boss
class Witch extends Monsters {
  
  PImage Witch;
  
  public Witch (int xCor, int yCor) {
    super();
    x = xCor;
    y = yCor;
    name = "Witch";
    setHp(200);
    setStrength(20);
    
  }
  
  public void display() {
     Witch = loadImage("");
     image(Witch, x, y, 32, 32);
   }
   
   public int attack(String move) {
    int dmg = 0;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5));
      text("Muahahah. The Witch cackles!", 50, 800);
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      text("The Witch wackes you with broomstick!", 50, 800); 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       text("The Witch slaps you.", 50, 800); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      text("The Witch splashes Draught of Living Death!", 50, 800);
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      text("The Witch uses Confundo!", 50, 800);
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      text("The Witch casts Avada Kedavra!", 50, 800);
    } else {
      dmg = 0;
      println("oops?");
    }
    return dmg;
   }

}
