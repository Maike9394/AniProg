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
  player = new Player(550,550, 5);
  idlePlayerRight();

  //attack_1_Player();
  //attack_2_Player();
  //defeatedPlayer();
  //walkPlayerLeft();
   //walkPlayerRight();
}


void draw() {
  background(127);
  line(800,550,0,550);
  line(850,580,0,580);
  player.keyPressed();
  image(phasen[tb.getPhase()], px, py);
}