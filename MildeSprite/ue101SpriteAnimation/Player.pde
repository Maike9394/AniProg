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
  boolean keys[] = new boolean[4];

//Gravity Variablen
  float px =350,py = 200;
  float speedY = 0;
  float gravity = 0.5;
  float ground = 250;
  
  int hoehe = 0;
  int phase = 0;
  PGraphics[] phasen = new PGraphics[9];
  
  
 /*WURM KLASSE*/
 public class Player {
   float xPosition;      //x Position 
   float yPosition;      //y Position
   float speedY;      //Geschwindigkeit Y
   PVector velocity;
  
   Player (float xPosition, float yPosition, float speedY){
     xPosition = this.xPosition;
     yPosition = this.yPosition;
     speedY = this.speedY;
   }
}
 
/*Ende Wurm KLASSE*/
    
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

/*Bewegung*/
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
  
//passende Bewegung zu bestimmter Taste
void keyPressed() {
  if (key == 'a')
    {   keys[0] = true;
        walkPlayerLeft();
        movePlayer(-4, 0);
      }
  /*if (keys[0]==true && keys[2] ==true)
    {   
        if(keys[2]==false){
        movePlayer(-40, -40);
        walkPlayerLeft();}
      }*/
  if (key == 'd'){  
        keys[1] = true;
        movePlayer(4, 0); 
        walkPlayerRight();
    }
  if (key == 'w') {
      keys[2] = true; 
      movePlayer(0,-40);
    }
 /*  //wenn player gerade nach rechts läuft + sprungtaste
   if (key == 'w' && (keys[1] == true)){
       movePlayer(50,-20);
    } */
}

//welche Animation wird gestartet wenn Wurm sich nicht mehr bewegt?
void keyReleased(){
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
  