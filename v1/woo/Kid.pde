class Kid {
  
  String _name;
  int _health;
  int _strength;
  
  int xGret = 200;
  int yGret = 200;
  float xGspeed = 0;
  float yGspeed = 0;
  
  int xHans = 170;
  int yHans = 200;
  float xHspeed = 0;
  float yHspeed = 0;
  
  boolean gretLeads, hansLeads;
  
  int currentFrame = 0;
  int loopFrames = 3;
  int offset = 0;
  int delay = 0;
  
  
  Kid() {
    this._health = 1;
    this._strength = 1;
  }
  
  
  Kid(int hp, int str) {
    this._health = hp;
    this._strength = str;
  }
  
  
  int getHealth() {
    return _health;
  }
  
  
  int getStrength() {
    return _strength;
  }
  
  
  void setHealth(int newHealth) {
    this._health = newHealth;
  }
  
  
  void setStrength(int newStrength) {
    this._strength = newStrength;
  }
  
  
  //public void attack() {
    
  //}
  
  
  //public void superMove() {
    
  //}
  
  
  void whoLeads() {
    if (gretLeads) {
    xHspeed = 0.03*(xGret - xHans);
    yHspeed = 0.03*(yGret - yHans);
    
    //println(xHspeed + " " + yHspeed);
    
    xHans += xHspeed;
    yHans += yHspeed;
    }
    
    else if (hansLeads) {    
      xGspeed = -0.03*(xGret - xHans);
      yGspeed = -0.03*(yGret - yHans);
      
      xGret += xGspeed;
      yGret += yGspeed;
    }
  }  
  
  
  void display() {
    image(gretelImages[currentFrame + offset], xGret-35, yGret-35, 70, 100); 
    image(hanselImages[currentFrame + offset], xHans-35, yHans-35, 70, 100);
  }
  
  
  void walk() {
    if (up) {
      offset = 6;
      yGret -= 5;
      gretLeads = true;
      hansLeads = false;
    }
    if (down) {
      offset = 0;
      yHans += 5;
      hansLeads = true;
      gretLeads = false;
    }
    if (left) {
      offset = 3;
      xHans -= 5;
      hansLeads = true;
      gretLeads = false;
    }
    if (right) {
      offset = 9;
      xGret += 5; 
      gretLeads = true;
      hansLeads = false;
    }
    if (!up && !down && !left && !right) {
      currentFrame = 1;
      gretLeads = false;
      hansLeads = false;
    }
    else {
      if (delay == 0) {
        currentFrame = (currentFrame + 1) % loopFrames;
      }
      delay = (delay + 1) % 5;
    }
  }
}
