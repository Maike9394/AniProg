/**
 * @author Maike Lippold
 * @version 1.0
 */
 
//Bibiliotheken
import ddf.minim.*;  
import processing.sound.*;

//Random Variablen
float py = 170;
float px = 820;
int text; 
int totalApples = 0;
PFont title;
int substr_cnt;
int score; 
int tileSize = 5;

//Level Variablen
PImage screen1, screen2, screen3,screen4;
int level;

//Gravity Variablen
float speedY = 0;
float gravity = 0.5;
float ground = 340;

//Animation Vaiablen
PGraphics[] phasenPlayer = new PGraphics[9];
int phase = 0;

//Klassenvariablen
TimeBase tb;
Player player;
Timer timer;
Apples [] apples;

//Soundvariablen  
SoundFile eating, successSound,jump, end;
AudioPlayer music;
Minim minim; 
 
void setup() {
  //General setup 
  size(1100,500);
  frameRate(60);
  tb = new TimeBase(100, 7);
  score = 0;
  level = 0;

  //Pictures Setup
  screen1 = loadImage("screen1.png");
  screen2 = loadImage("screen2.png");
  screen3 = loadImage("screen3.png");
  screen4 = loadImage("screen4.png");
  
  //Schrift
  PFont myFont;
  myFont = loadFont("NuevaStd-Bold-48.vlw");
  textFont(myFont);
  
  //Apple setup
  apples = new Apples[100];
  timer = new Timer(1600);    // Create a timer that goes off every 1600 milliseconds
  timer.start();             // Starting the timer

  //Wurm setup
  player = new Player(px,py,speedY);
  idlePlayerLeft();
  
  //Sound setup
  eating = new SoundFile(this,"eating.mp3");
  successSound = new SoundFile(this,"success.wav");
  jump = new SoundFile(this, "jump.wav");
  end = new SoundFile(this,"music.mp3");
 
  minim = new Minim(this);
  music = minim.loadFile("music.mp3");
  //music = minim.loadFile("music2.wav");
  music.loop();
}

void draw() {

   background (screen1);
   image(phasenPlayer[tb.getPhase()], 820, 250, 220,220);
  
if (level == 0) { 
    ellipse (random (width), random (height), random (4), random (4));
    textAlign(CENTER); 
    textSize(112);
    text ("Vermi", 350, 300);   //vermiculus Wurm auf lateinisxch
    textSize(30);
    fill (255);
    text("Press x to start", 350, 325);   
 }
 
 else if (level == 1) {
    background (screen2);
    ellipse (random (width), random (height), random (4), random (4));
    image(phasenPlayer[tb.getPhase()], 820, 250,220,220);
    sadPlayer();
    writeIntro();
 }
 
 else if (level == 2) {
    background (screen3);
    ellipse (random (width), random (height), random (4), random (4)); //altes Spiel Effekt
    textSize(60); 
    text(score, 30, 60);
    fill(255);
    player.setLocation(px,py);
    player.display(110);
    player.addGravity();
 
    // Check the timer
    if (timer.timerFinished()) {
      apples[totalApples] = new Apples();
      totalApples++;
      if (totalApples >= apples.length) {
        totalApples = 0; // Start over
      }
      timer.start();
    }  
    
    // Move and display all apples
    for (int i = 0; i < totalApples; i++ ) {
        if(score ==10)  {      //LEVELWECHSEL --> 3
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
 
 else if (level == 3) {
   background (screen4);
   ellipse (random (width), random (height), random (4), random (4));
    music.close();
    delay(400);
    successSound.play();
    score = 0;
    level = 4;      //LEVELWECHSEL --> 4
 }
 
 else if ( level== 4){
    background (screen4);
    ellipse (random (width), random (height), random (4), random (4));
    typewriterText("Oh, look at all those apples. Yummy!"  +"\n" + "You won! Thanks for helping me.", 450,170,35);  
    idlePlayerLeft();
    image(phasenPlayer[tb.getPhase()], 790, 198, 200,200);
    textSize(30);
    text ("Press S to go" +"\n" +"back to start", 1000, 30);
  }
}

//Zählt die gegessenen Äpfel
void countScore(){
    eating.play();
    eating.amp(4);
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

//IntroText 
void writeIntro(){             
  String msg =   "Hello, I'm Vermi. I live in this forest all by myself."  +"\n" + 
                 "In the morning, the first thing I eat is an apple......" +"\n" + 
                 "Actually, I need a lot of apples to make it through my day." +"\n" + 
                 "Today I could not find a single apple!" +"\n" + 
                 "But I need about 10 apples to make it through my day." +"\n" + 
                 "So can you please help me get my apples?" +"\n" + "\n" + 
                 "Press X to help me!";
  typewriterText(msg,400,180,25);           
} 



        