class Button {
  PVector pos = new PVector(0,0);
  float widith = 0;
  float heighteth = 0;
  color colore;
  String name;
  boolean pressed = false;
  boolean clicked = false;
  
  Button(int x, int y, int w, int h, String t, int r, int g, int b) {
    pos.x = x;
    pos.y = y;
    widith = w;
    heighteth = h;
    colore = color(r, g, b);
    name = t;
  }
  
  void update() {
    if ((mousePressed) && (mouseButton == LEFT) && (!pressed)) {
      pressed = true;
      if ((mouseX >= pos.x) && (mouseX <= pos.x + widith) && (mouseY >= pos.y) && (mouseY <= pos.y + heighteth)) {
        clicked = true;
      }
    }
    else {
      clicked = false;
    }
    
    if (!mousePressed) {
      pressed = false;
    }
  }
  
  void render() {
    fill(colore);
    rect(pos.x, pos.y, widith, heighteth);    
    fill(0);
    textAlign(CENTER, CENTER);
    text(name, pos.x + (widith / 2), pos.y + (heighteth / 2));
  }
  
  boolean isClicked() {
    return clicked;
  }
}
