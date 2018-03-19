 /*VARIABLEN*/
  PImage idlePlayerL;
  PImage idlePlayerR;
  PImage attack1Player;
  PImage attack2Player;
  PImage defeatedPlayer;
  PImage getHitPlayer;
  PImage walkPlayerRight;
  PImage walkPlayerLeft;
  PImage sadPlayer;
  boolean keys[] = new boolean[4];
  int hoehe;

 /*WURM KLASSE*/
 public class Player {
   float xPosition;      //x Position 
   float yPosition;      //y Position
   float speedY;      //Geschwindigkeit Y
  
   Player(float xPosition, float yPosition, float speedY){
     xPosition = this.xPosition;
     yPosition = this.yPosition;
     speedY = this.speedY;
    }
    
    void setLocation(float tempX, float tempY) {
        xPosition = tempX;
        yPosition = tempY;
    }
    
    float getCurrentLocationX()
    {
      return xPosition;
    }
        
    float getCurrentLocationY()
    {
      return yPosition;
    }
       
       
    void display(float hoehe) {
    image(phasenPlayer[tb.getPhase()], px, py, hoehe,hoehe);
  }
  
    // A function that returns true or false based on
    // if the catcher intersects a raindrop
    boolean intersect(Apples d) {
      // Calculate distance
      float distance = dist(xPosition, yPosition, d.appleX, d.appleY); 
      // Compare distance to sum of radii
      if  (distance  <= (4 + d.appleSize)){ 
        return true;
      } else {
        return false;
      }
    }
  
    void addGravity(){
      //add speed to location
      speedY = speedY + gravity;
      //add gravity to speed
      py = py + speedY;
       if(py > ground){
       //Verlangsamt das immer wieder abspringen, bounced 2 mal
       speedY = speedY * -0.35;
       py = ground;
    }
  }  
} 

/*Ende Wurm KLASSE*/
  

/*Bewegungen*/
void movePlayer(float dx, float dy) {
  dx *= tileSize;
  dy *= tileSize;  
  float newX = px + dx;
  float newY = py + dy;
  if(newX >= -24  && newX < width && newY >= 0 && newY < height) {
    px = newX;
    py = newY;
  }
}
  
//passende Bewegung zu bestimmter Taste
void keyPressed() {
  if (level == 2) {
    if (key == 'a')
      {   keys[0] = true;
          walkPlayerLeft();
          movePlayer(-5, 0);
        }
    if (key == 'd'){  
          keys[1] = true;
          movePlayer(5, 0); 
          walkPlayerRight();
      }
    if (key == 'w') {
        keys[2] = true; 
        movePlayer(0,-40);
      }
}
  else {
    if (key == 'x' || key == 'X') {
        keys[3] = true;
        level +=1;
    }
  }
}

//welche Animation wird gestartet wenn Wurm sich nicht mehr bewegt?
void keyReleased(){
  if (level == 2) {
    if (key == 'a')
      {
         keys[0] = false;
         idlePlayerLeft();
      }
     if(key == 'd'){
         keys[1] = false;
         idlePlayerRight();
     }
   if(key == 'w'){
          keys[2] = false; 
}  }

 else {
   if(key == 'x' || key == 'X') {
         keys[3] = false;
   }
 }
}
    

/*Animationen*/
  //idle 126
  void idlePlayerRight(){
  idlePlayerR = loadImage("idleRight.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(idlePlayerR, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
  
  void idlePlayerLeft(){
  idlePlayerL = loadImage("idleLeft.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(idlePlayerL, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }

  //walk 115
  void walkPlayerRight(){
  walkPlayerRight = loadImage("walkRight.png");
    hoehe = 115;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(walkPlayerRight, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
  //walkleft 115
  void walkPlayerLeft(){
  walkPlayerLeft = loadImage("walkLeft.png");
    hoehe = 115;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(walkPlayerLeft, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
  
  //134 Attack 2 sieht besser aus 
  void attack_1_Player(){
    attack1Player = loadImage("attack.png");
    hoehe = 134;
    for (int n = 0; n < 9 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(attack1Player, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
   //attack 2 174
    void attack_2_Player(){
    attack2Player = loadImage("attack2.png");
    hoehe = 174;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(attack2Player, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
    
    //defeated 159
    void defeatedPlayer(){
    defeatedPlayer = loadImage("defeated.png");
    hoehe = 159;
    for (int n = 0; n < 9 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(defeatedPlayer, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  } 
  
    //defeated 159
    void sadPlayer(){
    sadPlayer = loadImage("sad.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(sadPlayer, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  } 
 
/*
//Grenzen setzen, damit FIgur nur innerhalb von Rahmen ist
 /* void setBorders () { // methode welche dafür sorgt, dass sich die figur nur bis zum rand des bildschirms bewegen kann, nicht abgeschnitten wird und nur bis zum boden fällt
    if (xPosition < 15) { // links 
      xPosition = 15;
    }
    if ( xPosition> width - 113) { // rechts 
      xPosition = width - 116;
    }  
    if ( yPosition> 1) { // boden
      yPosition = 1; 
      fallen =false;
    }
    if ( yPosition< -350) { // obere grenze
      yPosition = -347;
    }
  }*/  
  