class Button {
  
  int rectX, rectY;
  int rectSize = 90;
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;
  
  void setup() {
    rectColor = color(0);
    rectHighlight = color(51);
    baseColor = color(102);
    currentColor = baseColor;
    rectX = width/2-rectSize-10;
    rectY = height/2-rectSize/2;
  }
  
  void draw() {
    update(mouseX, mouseY);
    background(currentColor);
    
    if (rectOver) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    stroke(255);
    rect(rectX, rectY, rectSize, rectSize);
  }
  
  void update(int x, int y) {
    if ( overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
    } else {
      rectOver = false;
    }
  }
  
  void mousePressed() {
    if (rectOver) {
      currentColor = rectColor;
    }
  }
  
  boolean overRect(int x, int y, int width, int height)  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  
}

//class Button {
//  PVector pos = new PVector(0,0);
//  float widith = 0;
//  float heighteth = 0;
//  color colore;
//  String name;
//  Boolean pressed = false;
//  Boolean clicked = false;
  
//  Button(int x, int y, int w, int h, String t, int r, int g, int b) {
//    pos.x = x;
//    pos.y = y;
//    widith = w;
//    heighteth = h;
//    colore = color(r, g, b);
//    name = t;
//  }
  
//  void update() {
//    println("update");
//    if ((mousePressed == true) && (mouseButton == LEFT) && (pressed == false)) {
//      pressed = true;
//      if ((mouseX >= pos.x) && (mouseX <= pos.x + widith) && (mouseY >= pos.y) && (mouseY <= pos.y + heighteth)) {
//        clicked = true;
//      }
//    }
//    else {
//      clicked = false;
//    }
    
//    if (!mousePressed) {
//      pressed = false;
//    }
//  }
  
//  void render() {
//    println("render");
//    fill(colore);
//    rect(pos.x, pos.y, widith, heighteth);    
//    fill(0);
//    textAlign(CENTER, CENTER);
//    text(name, pos.x + (widith / 2), pos.y + (heighteth / 2));
//  }
  
//  boolean isClicked() {
//    return clicked;
//  }
//}
