/**
 * @author Maike Lippold
 * @version 1.0
 */
 
 /*VARIABLEN*/
  int tileSize = 20;
  PImage idleWorm;
  int sz = 64;
  int phase = 0;
  PGraphics[] phasen = new PGraphics[7];
  TimeBase timebase;
  
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
}

void keyPressed() {
    switch (key){
      case 'w': movePlayer(0, -1); break;
      case 'a': movePlayer(-1, 0); break;
      case 's': movePlayer(0, 1);  break; 
      case 'd': movePlayer(1, 0);  break;
      }
}

}
   


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
  