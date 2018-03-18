/**
 * @author Maike Lippold
 * @version 1.0
 */
//Level
PImage levelOne;

//Variablen Deklarationen 

int tileSize = 5;

//Gravity Variablen
float speedY = 0;
float gravity = 0.5;
float ground = 330;
 

//Animation Vaiablen
PGraphics[] phasenPlayer = new PGraphics[9];
int hoehe = 0;
int phase = 0;

//klassenvariablen
TimeBase tb;
Player player;


PGraphics[] apples = new PGraphics[6];
int index;
PImage apple;

//Wurm wird auf Hälfte eingeworfen 
float px =550,py = -200;

void setup() {
  size(1100,500);
  frameRate(60);
  tb = new TimeBase(100, 7);
  player = new Player(px,py,speedY);
  idlePlayerLeft(); //startPositionWurm ohne diese klappt draw()image(phasen[....usw nicht

  //Apple setup
  appleX = random(10,400); 
  appleY = 0;
  appleSize = random(40,80);
  //nehme random string von applePictures Array
  index = int (random(apples.length));
  fillAppleArray();
   // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  levelOne = loadImage("level1.png");
}

void draw() {
  background(levelOne);
  image(phasenPlayer[tb.getPhase()], px, py, 120,120);
 // image(apples[index], appleX, appleY, appleSize,appleSize);
 
  addGravity();

 // PImage apple = (apples[index]);
 //image(apple,appleX,appleY, appleSize,appleSize);
  
}