PImage player;
int höhe = 10;
int breite = 5;
int phase = 0;
PGraphics[] phasen = new PGraphics[7];
TimeBase tb;

void setup() {
  size(640,480);
  player = loadImage("worm.png");
  initPhasen();
  frameRate(60);
  tb = new TimeBase(100, 7);
}

void initPhasen() {
  for (int n = 0; n < 7 ; n++) {
     phasen[n] = createGraphics(sz,sz);
     phasen[n].beginDraw();
     phasen[n].copy(player, n*sz,0*sz,sz,sz,0,0, sz,sz);
     phasen[n].endDraw();
  }
}

void draw() {
  background(127);
  image(phasen[tb.getPhase()], mouseX, mouseY);
  //saveFrame();
}