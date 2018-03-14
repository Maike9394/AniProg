/**
 * @author Maike Lippold
 * @version 1.0
 */
 
 /*VARIABLEN*/
  int tileSize = 20;
  PImage idlePlayer;
  PImage attack1Player;
  PImage attack2Player;
  PImage defeatedPlayer;
  PImage getHitPlayer;
  PImage walkPlayerRight;
  PImage walkPlayerLeft;
  float px = 320, py = 240;
  
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
  if(newX >= 0
    && newX < width
    && newY >= 0
    && newY < height
  ) {
    px = newX;
    py = newY;
  }
}

void keyPressed() {
    switch (key){
      case 'w': movePlayer(0, -0.5); break;
      case 'a': movePlayer(-0.5, 0); break;
      case 's': movePlayer(0, 0.5);  break; 
      case 'd': movePlayer(0.5, 0);  break;
      }
    }
}


//verschiedene Lauffunktionen
  //idle 126
  void idlePlayer(){
  idlePlayer = loadImage("idle.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(idlePlayer, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
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
void keyPressed() {
    switch (key){
      case 'w': movePlayer(0, -1); break;
      case 'a': movePlayer(-1, 0); break;
      case 's': movePlayer(0, 1);  break; 
      case 'd': movePlayer(1, 0);  break;
      }
}*/

/*      
void movePlayer(int dx, int dy) {
  dx *= tileSize;
  dy *= tileSize;  
  int newX = px + dx;
  int newY = py + dy;
  if(newX >= 0
    && newX < width
    && newY >= 0
    && newY < height
  ) {
    px = newX;
    py = newY;
  }
}*/

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
  