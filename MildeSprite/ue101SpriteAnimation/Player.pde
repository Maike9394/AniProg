/**
 * @author Maike Lippold
 * @version 1.0
 */
 
 /*VARIABLEN*/
  int tileSize = 20;
  PImage idlePlayer;
  PImage walkPlayer;
  PImage attack1Player;
  PImage attack2Player;
  PImage defeatedPlayer;
  PImage getHitPlayer;
  
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
  void walkPlayer(){
  walkPlayer = loadImage("walk.png");
    hoehe = 115;
    for (int n = 0; n < 7 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(walkPlayer, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasen[n].endDraw();
    }
  }
  
  void attack_1_Player(){
    attack1Player = loadImage("attack.png");
    hoehe = 121;
    for (int n = 0; n < 9 ; n++) {
       phasen[n] = createGraphics(hoehe,hoehe);
       phasen[n].beginDraw();
       phasen[n].copy(attack1Player, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
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
  