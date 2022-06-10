class Dialogue {
  
  String lines;
  
  void startGame() {
    stroke(45, 20, 18);
    strokeWeight(5);
    fill(213, 109, 99);
    rect(500, 300, 500, 375, 5);
    fill(86, 22, 12);
    
    textSize(25);
    text("Welcome to...", 595, 360);
    
    textSize(45);
    text("Once Upon", 550, 430);
    text("a Loaf", 620, 480);
    
    textSize(25);
    text("Press X to begin!", 540, 550);
    
    text("Press T to open", 560, 600);
    text("the tutorial!", 585, 630);
  }
  
  void tutorial() {
    stroke(45, 20, 18);
    strokeWeight(5);
    fill(213, 109, 99);
    rect(500, 300, 500, 375, 5);
    fill(86, 22, 12);
    
    textSize(23);
    text("Use WASD or the", 530, 345);
    text("arrow keys to move.", 530, 375);
    
    text("Press T to open", 530, 435);
    text("the tutorial.", 530, 465);
    
    text("Press F to pick up", 530, 525);
    text("items and talk.", 530, 555);
    
    text("Press X to close", 530, 615);
    text("any menus.", 530, 645);
  }
  
  void battle1() {
    stroke(45, 20, 18);
    strokeWeight(5);
    fill(213, 109, 99);
    rect(500, 300, 500, 375, 5);
    fill(86, 22, 12);
    
    textSize(23);
    text("You Defeated the Enemy!", 530, 345);
    text("Press X to close", 530, 615);
  }
  
  //updating dialogue
  public void writeDialogue() {
      println(story.peek());
      lines = story.peek();
      fill(255);
      textSize(20);
      text(lines, 200, 800);
      story.remove();
      delay(5000);
      //toggleDialogue();
  }
  
  void toggleDialogue() {
    if (storyDialogue) {
      storyDialogue = false;
    }
    else {
      storyDialogue = true;
    }
  }

}
