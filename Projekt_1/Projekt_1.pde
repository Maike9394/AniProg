/**
 * @author Maike Lippold
 * @version 1.0
 */

//Variablen
int px = 320, py = 240;

//Klassenvariablen
Player player;

void setup() {
  size(840, 680); //VGA for those old enough to remember
  
  
  //initialisieren klassen
  player = new Player(0, height-192, 5);
}

 
void draw() {
  drawBackground();
  player.keyPressed();
}




void drawBackground() {
  fill(174, 204, 27); // green
  rect(0, 0, width, height); // fill whole screen
}