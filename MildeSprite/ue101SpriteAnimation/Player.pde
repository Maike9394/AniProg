/**
 * @author Maike Lippold
 * @version 1.0
 */
 
 /*VARIABLEN*/
  int tileSize = 5;
  PImage idlePlayerL;
  PImage idlePlayerR;
  PImage attack1Player;
  PImage attack2Player;
  PImage defeatedPlayer;
  PImage getHitPlayer;
  PImage walkPlayerRight;
  PImage walkPlayerLeft;
  float px = 480, py = 450;
  
  int hoehe = 0;
  int phase = 0;
  PGraphics[] phasen = new PGraphics[9];
  
  
 /*WURM KLASSE*/
 public class Player {
   float xPosition;      //x Position 
   float yPosition;      //y Position
   float speedY;      //Geschwindigkeit Y
  
   Player (float xPosition, float yPosition, float speedY){
     xPosition = this.xPosition;
     yPosition = this.yPosition;
     speedY = this.speedY;
   }

void movePlayer(float dx, float dy) {
  dx *= tileSize;
  dy *= tileSize;  
  float newX = px + dx;
  float newY = py + dy;
  if(newX >= -24  && newX < width && newY >= -13 && newY < height) {
    px = newX;
    py = newY;
  }
  }

void keyPressed() {
    switch (key){
      case 'w': 
        movePlayer(0, -0.5);
        break;
      case 'a':
        walkPlayerLeft();
        break;
      case 's': movePlayer(0, 0.5);  break; 
      case 'd': 
        movePlayer(0.5, 0); 
        walkPlayerRight();
        break;
      }
    }
}


//verschiedene Lauffunktionen
  //idle 126
  void idlePlayerRight(){
  idlePlayerR = loadImage("idleRight.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(idlePlayerR, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasen[n].endDraw();
    }
  }
  
  void idlePlayerLeft(){
  idlePlayerL = loadImage("idleLeft.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(idlePlayerL, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasen[n].endDraw();
    }
  }

  //walk 115
  void walkPlayerRight(){
  walkPlayerRight = loadImage("walkRight.png");
    hoehe = 115;
    for (int n = 0; n < 7 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(walkPlayerRight, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasen[n].endDraw();
    }
  }
  //walkleft 115
  void walkPlayerLeft(){
  walkPlayerLeft = loadImage("walkLeft.png");
    hoehe = 115;
    for (int n = 0; n < 7 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(walkPlayerLeft, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasen[n].endDraw();
    }
  }
  
  //134 Attack 2 sieht besser aus 
  void attack_1_Player(){
    attack1Player = loadImage("attack.png");
    hoehe = 134;
    for (int n = 0; n < 9 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(attack1Player, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasen[n].endDraw();
    }
  }
   //attack 2 174
    void attack_2_Player(){
    attack2Player = loadImage("attack2.png");
    hoehe = 174;
    for (int n = 0; n < 7 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(attack2Player, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasen[n].endDraw();
    }
  }
    
    //defeated 159
    void defeatedPlayer(){
    defeatedPlayer = loadImage("defeated.png");
    hoehe = 159;
    for (int n = 0; n < 9 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(defeatedPlayer, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasen[n].endDraw();
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
  