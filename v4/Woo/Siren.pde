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
      story.add("Siren stares at you, suggestingly."); 
    } else if (move.equals("basic2")) {
       dmg = (int)(strength * (0.5));
      story.add("Siren smiles at you, arms open."); 
    } else if (move.equals("basic3")) {
       dmg = (int)(strength * (0.5));
       story.add("Siren swims around you."); 
    } else if (move.equals("mid1")) {
      dmg = (int)(strength);
      story.add("Siren sings beautifully.");
    } else if (move.equals("mid2")) {
      dmg = (int)(strength);
      story.add("Siren drags you by the arm to her home.");
    } else if (move.equals("ult")) {
      dmg = (int)(strength * (2));
      story.add("Siren throws her child at you and sings a song of lamentation.");
    } else {
      dmg = 0;
      println("oops? attack went wrong, dmg 0");
    }
    return dmg;
   }
  

}
