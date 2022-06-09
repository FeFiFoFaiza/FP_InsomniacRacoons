class Antagonist extends Monsters{
  
  public Antagonist(){
    health = 150;
    strength = 25 + (int)(Math.random() * 25); // [25,50] 
  }
  
}
