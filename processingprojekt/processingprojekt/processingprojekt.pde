/**
 * @author Michael Eisenacher 
 * @version 1.0
 */

import ddf.minim.*;  // importieren der soundbibliothek  
// Instanz der minim Bibliothek 

Minim minim; // instanz von minim 
//deklaration variablen 
float zeit;  
float zeit2;  
float zeit3; 
float musicStart; 
int spielstatus; //nötig um die spielzustände zu ändern 
boolean hit;  // für kollisionen
int points;// punkte für den score  

//bildvariablen
PImage wiese;   
PImage start; 
PImage level1;  
PImage Level1hintergr; 
PImage level2; 
PImage level2hintergr; 
PImage gameover; 
PImage ende;   

//soundvariablen 
AudioPlayer zombieSound;  
AudioPlayer bye; 
AudioPlayer explosion;
AudioPlayer muenzeSound;
AudioPlayer fail;  
AudioPlayer music;   
AudioPlayer vogelPfeifen;  
AudioPlayer happy;   
AudioPlayer hoho;   

//klassenvariablen
Figur figur; 
ZombieMann zMann; 
ZombieFrau zFrau; 
VogelStehend vs; 
VogelFliegend vf;  
MuenzeKlasse muenzchen; 
FeuerballKlasse feuerchen;
muenzeLevel2 muenzelevel2;  
feuerball1Level2 f1;
Messer messer; 
Granate granate;

void setup () { 
  size(840, 680);  
  frameRate(18); 
  //variablen initialisieren 
  zeit = 10;  
  zeit2 = 500; 
  zeit3 = 400; 
  hit=false; 
  points =0; 
  spielstatus = 0; 
  musicStart=625; 

  //klassen initialisieren 
  figur = new Figur(0, height-192, 5);  
  zMann = new ZombieMann (); 
  zFrau = new ZombieFrau(); 
  vs = new VogelStehend(); 
  vf = new VogelFliegend();  
  muenzchen = new MuenzeKlasse ();   
  feuerchen = new FeuerballKlasse (); 
  muenzelevel2 = new muenzeLevel2();  
  f1 = new feuerball1Level2 ();  
  messer = new Messer ();  
  granate = new Granate(); 

  // bilder initialisieren und methoden für sprites aufrufen
  start =loadImage("Bilder/Hintergrund/start.png"); 
  level1 = loadImage("Bilder/Hintergrund/level1.png");   
  explode= loadImage("Bilder/Feuerball/Explosion.png"); 
  Level1hintergr=loadImage("Bilder/Hintergrund/level1hintergr.png");  
  //methoden für sprites aufrufen
  arraystehendeFigur (); 
  arrayMuenzen();   
  arrayFeuer();
  arrayLaufendeFigur (); 
  arrayFigurSpringen(); 
  muenzchen.erzeugen(); 
  feuerchen.erzeugen(); 
  level2 = loadImage("Bilder/Hintergrund/level2.png");
  vs.arrayVogelStehend(); // methode sprite arrays in der klasse aufrufen
  level2hintergr =loadImage("Bilder/Hintergrund/level2hintergr.png"); 
  zMann.arrayZombieMale(); // methode sprite arrays in der klasse aufrufen
  zFrau.arrayZombieFemale (); // methode sprite arrays in der klasse aufrufen
  knife =loadImage("Bilder/messerFinal.png"); 
  gran = loadImage("Bilder/granate.png"); 
  wiese =loadImage("Bilder/Hintergrund/pegasus.png"); 
  vf.nordpol= loadImage("Bilder/Hintergrund/nordpolhintergr.png");   
  vs.bag= loadImage("Bilder/bag.png");
  vf.bag2= loadImage("Bilder/bag.png");
  vf.arrayVogelFliegen();  // methode sprite arrays in der klasse aufrufen
  ende =loadImage("Bilder/Hintergrund/ende.png");  
  gameover=loadImage("Bilder/Hintergrund/gameover.png");  

  //sounds initialisieren
  minim = new Minim (this);
  zombieSound = minim.loadFile ("zombie.Eigenkreation.mp3");   
  explosion = minim.loadFile ("explosion.mp3"); 
  fail = minim.loadFile  ("fail.mp3"); 
  music = minim.loadFile  ("music.mp3");  
  vogelPfeifen = minim.loadFile  ("vogelpfeifen.mp3");  
  happy= minim.loadFile  ("happy.mp3");  
  hoho = minim.loadFile ( "hoho.mp3"); 
  bye=minim.loadFile ( "bye.mp3");
} 

void draw () {  
  // if verzweigung die die verschiedenen spielstadien voneinander trennt, da nicht in jedem stadium auch jede methode aufgerufen werden soll 
  if (spielstatus==0) {
    background(start);
    musicStart ();
    if (keyPressed == true) { // übergang zum nächsten spielzustand 
      spielstatus=1;
    }
  } else if (spielstatus==1) { 
    background (level1); 
    if ((key=='x')|| (key=='X')) { // übergang zum nächsten spielzustand 
      spielstatus=2;
    }
  } else if (spielstatus == 2) { 
    background(Level1hintergr);    
    figur.keyPressed(); 
    figur.bewegungSpieler (); 
    muenzchen.fallenFinal();
    feuerchen.fallenFinal(); 
    drawScore();   
    zeit(); // übergang zum nächsten spielzustand
  } else if (spielstatus==3) { 
    background(level2); 
    if ((key=='x')|| (key=='X')) { // übergang zum nächsten spielzustand  
      spielstatus=4;
    }
  } else if (spielstatus== 4) { 
    background(level2hintergr);  
    drawScore(); 
    figur.keyPressed ();  
    figur.bewegungSpieler (); 
    zMann.erzeugen(); 
    zMann.bewegen();  
    zFrau.erzeugen(); 
    zFrau.bewegen(); 
    muenzelevel2.anzeigen(); 
    f1.anzeigen(); 
    f1.bewegen(); 
    messer.erzeugen(); 
    messer.bewegen(); 
    granate.erzeugen(); 
    granate.bewegen(); 
    // hier wird kein übergang benötigt, da das spiel bei einer kollision mit den gegener beendet ist oder es durch das berühren der münze automatisch ins nächste level geht
  } else if (spielstatus ==5) {  
    background(wiese);  
    drawScore();
    vs.vogelStehend () ;
    figur.keyPressed ();  
    figur.bewegungSpieler ();  
    zeit2(); // übergang zum nächsten spielzustand
  } else if (spielstatus ==6) { 
    background(vf.nordpol);   
    drawScore();
    vf.vogelFliegen ();
    vf.loslassen();  
    zeit3(); // übergang zum nächsten spielzustand
  } else if (spielstatus==7) { 
    background (ende);  
    drawScore(); 
    if (keyPressed == true) { 
      music.close();
      setup(); // setup wird hier aufgerufen um das spiel zu resetten und somit die anfangswerte wieder zu erhalten
    }
  } else if (spielstatus == 8) { 
    background (gameover); 
    if ((key=='x')|| (key=='X')) {   
      music.close();
      setup(); // setup wird hier aufgerufen um das spiel zu resetten und somit die anfangswerte wieder zu erhalten
    }
  }
} 

void drawScore() { // methode zum zeichen des scores 
  if (spielstatus ==7) {  // bei spielstatus 7 hat der score eine andere formatierung, da er an das endbild angepasst werden musste
    textSize(35); 
    fill(1); 
    text(points, 570, 566);//punkte mit position
  } else {
    textSize(40); 
    fill(1); 
    text("Münzen: "+points, 20, 40);
  }
}     

void zeit () { // funktion zum ändern des spielstatus nach einer bestimmten zeit 
  if (spielstatus==2) {
    noFill(); 
    noStroke();
    rect (1, zeit, 5, 5); 
    zeit+=1; // rechteck wird von oben fallen gelassen
    if (zeit == height-47) {  
      figur = new Figur(0, height-192, 1); 
      spielstatus =3; // wenn der grenzwert erreicht wurden ist geht es automatisch ins nächste level
    }
  }
} 

// die folgenden 2 zeitfunktionen sind vom prinzip her die selbe wie zeit () 
void zeit2 () { 
  if (spielstatus==5) {
    noFill(); 
    noStroke(); 
    rect (1, zeit2, 5, 5); 
    zeit2+=1;  
    if (zeit2==501) { 
      bye.play();
    }
    if (zeit2 == height-47) { 
      vogelPfeifen.play();  // wenn grenzwert erreicht wurden ist, wird sound abgespielt
      spielstatus =6;
    }
  }
}  

void zeit3 () { 
  if (spielstatus==6) {
    noFill(); 
    noStroke(); 
    rect (1, zeit3, 5, 5);  
    zeit3+=1; 
    if (zeit3 == height-47) { 
      spielstatus =7;
      happy.play(); // wenn grenzwert erreicht wurden ist, wird sound abgespielt
    }
  }
}  

void musicStart () {  // diese funktion dient dazu die musik starten zu lassen. hätte ich music.loop() in die setup methode geschrieben würde
  //nach beenden des spiel eine neue soundloop gestartet werden ohne die alte zu beenden
  if (spielstatus==0) {
    noFill(); 
    noStroke(); 
    rect (1, musicStart, 5, 5);  
    musicStart+=1; 
    if (musicStart == height-47) {  
      music.loop(); // wenn grenzwert erreicht wurden ist, wird sound abgespielt
    }
  }
}