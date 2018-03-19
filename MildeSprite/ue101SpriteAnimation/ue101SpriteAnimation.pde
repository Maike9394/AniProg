/**
 * @author Maike Lippold
 * @version 1.0
 */
//Level
PImage levelOne;
PImage level0;
PImage screen1, screen2, screen3,screen4;
boolean intro[] = new boolean[8];
int level;
PFont title;
int substr_cnt;
int score; 
 
int tileSize = 5;

//Gravity Variablen
float speedY = 0;
float gravity = 0.5;
float ground = 340;

//Animation Vaiablen
PGraphics[] phasenPlayer = new PGraphics[9];

int phase = 0;

//klassenvariablen
TimeBase tb;
Player player;
Timer timer;
Apples [] apples;

int totalApples = 0;

//random variablen
float py = 170;
float px = 820;
int text; 

//win loose
boolean win, loose;
        
void setup() {
  //setup 
  size(1100,500);
  frameRate(60);
  tb = new TimeBase(100, 7);
  screen1 = loadImage("screen1.png");
  screen2 = loadImage("screen2.png");
  screen3 = loadImage("screen3.png");
  screen4 = loadImage("screen4.png");
  
  level = 0;
  
  //used font
  PFont myFont;
  myFont = loadFont("NuevaStd-Bold-48.vlw");
  textFont(myFont);
  
  score = 0;
  //apple setup
  apples = new Apples[100];
  timer = new Timer(1600);    // Create a timer that goes off every 1600 milliseconds
  timer.start();             // Starting the timer

  //wurm setup
  player = new Player(px,py,speedY);
  idlePlayerLeft();
}

void draw() {
   //background(levelOne);
   background (screen1);
   image(phasenPlayer[tb.getPhase()], px, 260, 220,220);
  
if (level ==0) {
    //musik muss starten
    //ellipse (random (width), random (height), random (4), random (4));
    //blend(ellipse, 0, 0, 33, 100, 67, 0, 33, 100, ADD);
    textAlign(CENTER); 
    textSize(112);
    text ("Vermi", 350, 300);   //vermiculus Wurm auf lateinisxch
    textSize(30);
    fill (255);
    text("Press x to start", 350, 325);   
 }
 
 else if (level == 1) {
    background (screen2);
    image(phasenPlayer[tb.getPhase()], px, 260,220,220);
    sadPlayer();
    writeIntro();
 }
 
 else if ( level == 2) {
    background (screen3);
    textSize(60); text(score, 30, 60);
   // image(phasenPlayer[tb.getPhase()], px, py, 110,110);
    player.setLocation(px,py);
    player.display(110);
    player.addGravity();   
    // Check the timer
    if (timer.timerFinished()) {
      // Deal with apples
      // Initialize one apple
      apples[totalApples] = new Apples();
      // Increment totalDrops
      totalApples++;
      // If we hit the end of the array
      if (totalApples >= apples.length) {
        totalApples = 0; // Start over
      }
      timer.start();
    }  
    // Move and display all apples
    for (int i = 0; i < totalApples; i++ ) {
        if(score ==2)  {      //LEVELWECHSEL
        level = 3;
        }
        apples[i].fall();
        apples[i].display();
        if(player.intersect(apples[i])) {
        apples[i].caught();
        countScore();
        }
      }      
 }
 
 else if (level == 3)
 {
    background (screen4);
    typewriterText("Oh, look at all those apples. Yummy!"  +"\n" + "You won! Thanks for helping me.", 450,170,35);  
    idlePlayerLeft();
    image(phasenPlayer[tb.getPhase()], 790, 198, 200,200);
    textSize(30);
    text ("Press S to go" +"\n" +"back to start", 1000, 30);
 }
}

void countScore(){
  if (score == 2){
    level = 3;
  }
score +=1;
}

//typewriterText() entnommen und angepasst https://forum.processing.org/two/discussion/26427/how-to-incorporate-the-typewriter-effect-into-my-game
void typewriterText(String msg, int positionX, int positionY, int textSize){
    textAlign(CENTER); 
    textSize(textSize);
    fill (000);
    text (msg.substring(0,constrain(int(substr_cnt/5),0,msg.length())), positionX, positionY);
    substr_cnt++;
}

void writeIntro(){             
  String msg =   "Hello, I'm Vermi. I live in this forest all by myself."  +"\n" + 
                 "In the morning, the first thing I eat is an apple......" +"\n" + 
                 "Actually, I need a lot of apples to make it through my day." +"\n" + 
                 "Today I could not find a single apple!" +"\n" + 
                 "But I need about 50 apples to make it through my day." +"\n" + 
                 "So can you please help me get my apples?" +"\n" + "\n" + 
                 "Press X to help me!";
  typewriterText(msg,400,180,25);           
} 


        