PImage hanz;
PImage gret;

void setup() {
  size(1250,700);
  hanz = loadImage("Hansel.png");
  gret = loadImage("Gretel.png");
  //img.resize(70, 70);
}

void draw() {
  image(hanz, 100, 100);
  image(gret, 500, 100);
}
