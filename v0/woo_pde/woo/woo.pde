PImage hansel;
PImage gretel;

int xGret = 200;
int yGret = 200;
float xGspeed = 0;
float yGspeed = 0;


int xHans = 170;
int yHans = 200;
float xHspeed = 0;
float yHspeed = 0;

boolean gretLeads;
boolean hansLeads;

void setup() {
  size(600, 600);
  hansel = loadImage("Hansel.png");
  gretel = loadImage("Gretel.png");
}

void draw() {
  background(255);
  image(gretel, xGret-35, yGret-35, 70, 70); 
  image(hansel, xHans-35, yHans-35, 70, 70);
  stroke(0);

  
  if (gretLeads) {
    //if (xGret > xHans + 40) {
    //  xHspeed = 1;
    //} else { 
    //  xHspeed = 0;
    //}
  
    //if (yGret > yHans) {
    //  yHspeed = 1;
    //} else {
    //  yHspeed = 0;
    //}

      xHspeed = 0.03*(xGret - xHans);
      yHspeed = 0.03*(yGret - yHans);
    
    
     println(xHspeed + " " + yHspeed);
    
    xHans += xHspeed;
    yHans += yHspeed;
    
  } else if (hansLeads) {
    
    //if (xGret - 40 < xHans) {
    //  xGspeed = 1;
    //}  else {
    //  xGspeed = -1;
    //}
  
    //if (yGret < yHans) {
    //  yGspeed = 1;
    //} else {
    //  yGspeed = -1;
    //}
    
    xGspeed = -0.03*(xGret - xHans));
    yGspeed = -0.03*(yGret - yHans);
    
    xGret += xGspeed;
    yGret += yGspeed;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      yGret -= 5;
      gretLeads = true;
      hansLeads = false;
    } else if (keyCode == DOWN) {
      yHans += 5;
      hansLeads = true;
      gretLeads = false;
    } else if (keyCode == LEFT) {
      xHans -= 5;
      hansLeads = true;
      gretLeads = false;
    } else if (keyCode == RIGHT) {
      xGret += 5; 
      gretLeads = true;
      hansLeads = false;
    }
  }
}
