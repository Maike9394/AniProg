/**
 * @author Maike Lippold
 * @version 1.0
 */
 
 
//Variablen Deklarationen 
 
 
 
//klassenvariablen
TimeBase tb;
Player player;

void setup() {
  size(840,680);
  frameRate(60);
  tb = new TimeBase(100, 7);
  player = new Player(0, height-192, 5);
  //idlePlayer();

  //attack_1_Player();
  //attack_2_Player();
  defeatedPlayer();
  //walkPlayerLeft();
   //walkPlayerRight();
}


void draw() {
  background(127);
  player.keyPressed();
  image(phasen[tb.getPhase()], px, py);
}