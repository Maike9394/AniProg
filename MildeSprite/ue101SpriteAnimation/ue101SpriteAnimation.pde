/**
 * @author Maike Lippold
 * @version 1.0
 */
//Level
PImage levelOne;
PImage level0;
boolean intro[] = new boolean[8];
//Variablen Deklarationen 

int tileSize = 5;

//Gravity Variablen
float speedY = 0;
float gravity = 0.5;
float ground = 330;

int level;
PFont title;
int substr_cnt;
 
//Animation Vaiablen
PGraphics[] phasenPlayer = new PGraphics[9];
int hoehe = 0;
int phase = 0;

//klassenvariablen
TimeBase tb;
Player player;
Apple apple;

//random variablen
float py = 250;
float px = 800;
int text; 
    
    
void setup() {
  //setup 
  size(1100,500);
  frameRate(60);
  tb = new TimeBase(100, 7);
  levelOne = loadImage("level1.png");
  level0 = loadImage("level0.png");
  level = 0;

  //apple setup
  apple = new Apple(200,200,speedY);
  appleX = random(10,400); 
  appleY = 0;
  appleSize = random(40,80);
  
  //take random string from applePictures Array
  index = int (random(apples.length));
  fillAppleArray();
    
 
  //wurm setup
  player = new Player(px,py,speedY);
   idlePlayerLeft();
 // player.fillWormArray();
  
  for (int i = 0; i < 6; i++)
  {
    intro[i] = false;
  }
  
  
}

void draw() {
   //background(levelOne);
   background(112);
   image(phasenPlayer[tb.getPhase()], px, py, 180,180);
 
  //image(apples[index], appleX, appleY, appleSize,appleSize);
  //image(apples[index], 100, 100, 200, 200);
   //image(apples[4], 100, 100, 100, 100);

 //PImage apple = (apples[index]);
 //image(apple,appleX,appleY, appleSize,appleSize);
 // image(phasenPlayer[tb.getPhase()], px, py, 120,120);
 //startscreen  title = createFont ("font", 28, true);
  
if (level ==0) {
    //musik muss starten
    //ellipse (random (width), random (height), random (4), random (4));
    //blend(ellipse, 0, 0, 33, 100, 67, 0, 33, 100, ADD);
    textAlign(CENTER); 
    textSize(112);
    text ("Vermi", 350, 300);   //vermiculus Wurm auf lateinisxch
    textSize(30);
    fill (000);
    text("press x to start", 350, 325);
   
 }
 else if (level == 1) {
    background (level0);
    image(phasenPlayer[tb.getPhase()], px, py, 180,180);
    intro[1] = true;
    writeIntro();
    intro[2] = true;
 }
 else if ( level == 2) {
    background (levelOne);
    image(phasenPlayer[tb.getPhase()], px, py, 180,180);
 
 }
 
 
}

//typewriterText() entnommen und angepasst https://forum.processing.org/two/discussion/26427/how-to-incorporate-the-typewriter-effect-into-my-game
void typewriterText(String msg, int positionX, int positionY){
   textAlign(CENTER); 
    textSize(22);
    fill (000);
    text (msg.substring(0,constrain(int(substr_cnt/5),0,msg.length())), positionX, positionY);
    substr_cnt++;
}

void writeIntro(){
    if (intro[1]){
             String msg = "Hello, I'm Vermi. I am a worm and I live in the forest here all by myself.";
             typewriterText(msg, 410,160);
           }
     if (intro[2] == true){  
            typewriterText("In the morning the first thing I eat is an apple. After that I eat another apple.", 410,180);
            intro[3] = true;
            }
      if (intro[3] == true){ 
           typewriterText("Actually I need a lot of apples to make it through my day.", 450,200);
            text = 3;
            }
      if (text == 3){  
            typewriterText("But listen, it's getting really serious now. I need all those apples to stay alive.", 450,220);
            text = 4;
            sadPlayer();
            }
      if (text ==4){        
           typewriterText("If I just eat one too few, I'm gonna die. I need to eat about 50 apples a day!", 450,240);
            text = 5; 
            }
     if (text ==5){  
            typewriterText("I devour one apple after another to stay alive. So can you please help me get my apples?", 450,260);
            text = 6;
            }
   /* else if (text ==6){          
            delay(300);
            text("press x to help me", 550, 300);
                  if ((key == 'x') || (key== 'X')) {
                          level = 3;
                  }
            }  */
}


     