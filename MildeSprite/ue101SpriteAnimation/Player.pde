/**
 * @author Maike Lippold
 * @version 1.0
 */
 
 /*VARIABLEN*/
  PImage idlePlayerL;
  PImage idlePlayerR;
  PImage attack1Player;
  PImage attack2Player;
  PImage defeatedPlayer;
  PImage getHitPlayer;
  PImage walkPlayerRight;
  PImage walkPlayerLeft;
  PImage sadPlayer;
  boolean keys[] = new boolean[5];
  int hoehe;

 /*WURM KLASSE*/
 public class Player {
   float xPosition;      //x Position 
   float yPosition;      //y Position
   float speedY;       //Geschwindigkeit Y
  
   Player(float xPosition, float yPosition, float speedY){
     xPosition = this.xPosition;
     yPosition = this.yPosition;
     speedY = this.speedY;
    }
    
    void setLocation(float tempX, float tempY) {
        xPosition = tempX;
        yPosition = tempY;
    }
    
    float getCurrentLocationX()
    {
      return xPosition;
    }
        
    float getCurrentLocationY()
    {
      return yPosition;
    }
       
       
    void display(float hoehe) {
    image(phasenPlayer[tb.getPhase()], px, py, hoehe,hoehe);
    }
  
    //gibt true zurück, wenn Wurm Apfel berührt
    boolean intersect(Apples d) {
      // Calculate distance
      float distance = dist(xPosition, yPosition, d.appleX, d.appleY); 
      // Compare distance to appleSize
      if  (distance  <= hoehe/5 + d.appleSize/2){ 
        return true;
      } else {
        return false;
      }
    }
    
    void addGravity(){
      speedY = speedY + gravity; //add gravity to speed
      py = py + speedY;
       if(py > ground){
       //Verlangsamt das immer wieder abspringen, bounced 2 mal
       speedY = speedY * -0.35;
       py = ground;
      }
     
    }  
} 

/*Ende Wurm KLASSE*/
  
//Bewegungen
void movePlayer(float dx, float dy) {
  dx *= tileSize;
  dy *= tileSize;  
  float newX = px + dx;
  float newY = py + dy;
    if(newX >= -50  && newX < width -56 && newY >= 0 && newY < height) {
      px = newX;
      py = newY;
  }
}
  
//passende Bewegung zu bestimmter Taste
void keyPressed() {
  //Steuerung
  if (level == 2) {
      if (key == 'a')
        {   keys[0] = true;
            walkPlayerLeft();
            movePlayer(-5, 0);
          }
      if (key == 'd'){  
            keys[1] = true;
            movePlayer(5, 0); 
            walkPlayerRight();
        }
      if (key == 'w') {
          keys[2] = true;    
          jump.amp(0.5);
          jump.play();
          movePlayer(0,-40);
        }
  }
  //Ein Screen vorspringen
  else if (level == 0 || level == 1) {
         if (key == 'x' || key == 'X') {
            keys[3] = true;
            level +=1;
      }  
  }
  //Spiel erneut starten
  else if(level == 4) {
          if (key == 's' || key == 'S') {
             keys[4]=true;
             level = 0;
           }
  }
}

//welche Animation wird gestartet wenn Wurm sich nicht mehr bewegt?
void keyReleased(){
  //Steuerung zurücksetzen
  if (level == 2) {
    if (key == 'a'){
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
 //Level vorspringen zurücksetzen
 else if (level == 0|| level ==1) {
         if(key == 'x' || key == 'X') {
             keys[3] = false;
         }
 }
 else if (level == 4){
         if (key == 's' || key == 'S') {
            keys[4]=false;
         }
 }
}

    
/*Animationen*/
  //idle 126
  void idlePlayerRight(){
  idlePlayerR = loadImage("idleRight.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(idlePlayerR, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
  
  void idlePlayerLeft(){
  idlePlayerL = loadImage("idleLeft.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(idlePlayerL, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }

  //walk 115
  void walkPlayerRight(){
  walkPlayerRight = loadImage("walkRight.png");
    hoehe = 115;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(walkPlayerRight, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
  //walkleft 115
  void walkPlayerLeft(){
  walkPlayerLeft = loadImage("walkLeft.png");
    hoehe = 115;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(walkPlayerLeft, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
  
  //134 Attack 2 sieht besser aus 
  void attack_1_Player(){
    attack1Player = loadImage("attack.png");
    hoehe = 134;
    for (int n = 0; n < 9 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(attack1Player, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
   //attack 2 174
    void attack_2_Player(){
    attack2Player = loadImage("attack2.png");
    hoehe = 174;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(attack2Player, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  }
    
    //defeated 159
    void defeatedPlayer(){
    defeatedPlayer = loadImage("defeated.png");
    hoehe = 159;
    for (int n = 0; n < 9 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(defeatedPlayer, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  } 
  
    //defeated 159
    void sadPlayer(){
    sadPlayer = loadImage("sad.png");
    hoehe = 126;
    for (int n = 0; n < 7 ; n++) {
       phasenPlayer[n] = createGraphics(hoehe,hoehe);
       phasenPlayer[n].beginDraw();
       phasenPlayer[n].copy(sadPlayer, n*hoehe,0*hoehe,hoehe,hoehe,0,0, hoehe,hoehe);
       phasenPlayer[n].endDraw();
    }
  } 