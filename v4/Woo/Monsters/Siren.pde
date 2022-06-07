//Hard, after Wolf
class Siren extends Monsters {
  
  PImage Siren;
  
  public Siren(int xCor, int yCor) {
    super();
    x = xCor; //Tiles
    y = yCor; //Tiles
    setHealth(100);
    setStrength(15);
    
  }
  
  public void display() {
    Siren = loadImage("");
    image(Siren, x, y, 32, 32);
  
  }

  public int attack(String move) {
    int dmg = 0;
    String dialogue;
    if (move.equals("basic1")) {
      dmg = (int)(strength * (0.5);
      dialogue = "Siren stares at you, suggestingly."; 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5);
      dialogue = "Siren smiles at you, arms open."; 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5);
       dialogue = "Siren swims around you."; 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      dialogue = "Siren sings beautifully.";
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      dialogue = "Siren drags you by the arm to her home.";
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      dialogue = "Siren throws her child at you and sings a song of lamentation.";
    } else {
      dmg = 0;
      dialogue = "oops? attack went wrong, dmg 0";
    }
    return dmg;
   }
  

}
