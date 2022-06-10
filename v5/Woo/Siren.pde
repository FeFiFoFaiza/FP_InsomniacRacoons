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
