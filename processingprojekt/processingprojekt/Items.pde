/**
 * @author Michael Eisenacher 
 * @version 1.0
 */


// animation der sprites der münze 
int anzFrameMuenze = 8; 
int aktFrameMuenze =0; 
PImage [] muenze = new PImage [anzFrameMuenze]; 

//Animation für Sprites des Feuerballs 
int anzFrameFire = 4; 
int aktFrameFire =0; 
PImage [] fire = new PImage [anzFrameFire]; 
PImage knife; 
PImage gran;  
PImage explode; 

void arrayMuenzen() { 
  //Bilder für Münze werden in Array muenze eingefügt
  muenze [0] = loadImage("Bilder/Muenze/muenze1.png"); 
  muenze [1] = loadImage("Bilder/Muenze/muenze2.png"); 
  muenze [2] = loadImage("Bilder/Muenze/muenze3.png"); 
  muenze [3] = loadImage("Bilder/Muenze/muenze4.png"); 
  muenze [4] = loadImage("Bilder/Muenze/muenze5.png"); 
  muenze [5] = loadImage("Bilder/Muenze/muenze6.png");  
  muenze [6] = loadImage("Bilder/Muenze/muenze7.png"); 
  muenze [7] = loadImage("Bilder/Muenze/muenze8.png");
}   

void arrayFeuer() {
  //Bilder für Feuerball werden in Array fire eingefügt 
  fire [0] = loadImage("Bilder/Feuerball/feuerball2.png"); 
  fire [1] = loadImage("Bilder/Feuerball/feuerball3.png"); 
  fire [2] = loadImage("Bilder/Feuerball/feuerball4.png"); 
  fire [3] = loadImage("Bilder/Feuerball/feuerball5.png");
} 

class ItemFallen { // superklasse für fallende items 
  float x; 
  float y ; 
  float yGeschw; 

  ItemFallen () {
    x = random (17, width-24); // zufällige x position 
    y= -1; // y muss -1 sein da sie ins bild fallen sollen 
    yGeschw = random (2, 8); // zufällige geschwindigkeit zwischen 2 und 8
  } 

  void runterfallen () { 
    y=y+yGeschw; // neue y postion 

    if (y> height-92) { //gibt an bis wohin items fallen sollen 
      y=-1; 
      x=random (17, width-24); 
      // wenn sie bis grenzwert gefallen sind werden ihnen die anfangswerte zugewiesen
    }
  }
}

class MuenzeKlasse extends ItemFallen { // fallende münzen

  MuenzeKlasse [] m = new MuenzeKlasse[10]; // array von münzen

  MuenzeKlasse () {
    super();
  } 

  void anzeigen () {
    rect(x+12, y+10, 15, 15); // rechteck für kollision 
    //Animation der Münze mit Hilfe des Arrays muenze
    aktFrameMuenze = (aktFrameMuenze+1) % anzFrameMuenze; 
    image (muenze [(aktFrameMuenze ) % anzFrameMuenze ], this.x, this.y, 40, 40);      

    // hit einer kollisionfunktion zuweisen 
    hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, x+12, y+10, 15, 15);// erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt

    if (hit== true) { // wenn kollision eintritt wird hit auf true gesetzt 
      print("colliding? " + hit+points++); // ein punkt wird auf den score addiert 
      // anfangswerte zugewiesen 
      this.y =-1; 
      this.x =random (17, width-24); 
      muenzeSound = minim.loadFile( "coin.mp3"); 
      muenzeSound.play();  // sound wird bei kollision abgespielt abgespielt
    }
  }
  void erzeugen () {
    for (int i =0; i < m.length; i++) { // durchlaufen des arrays und erzeugen von münzen. diese methode wird in setup () aufgerufen 
      m[i]= new MuenzeKlasse (); // initialisieren
    }
  } 
  void fallenFinal () {
    for (int i = 0; i<m.length; i++) {  // durchlaufen des arrays 
      m[i].runterfallen(); // fallen der münzen 
      m[i].anzeigen(); // münzen anzeigen
    }
  }
} 

class FeuerballKlasse extends ItemFallen { // fallende feuerbälle 
  FeuerballKlasse [] f = new FeuerballKlasse[7];  // array von feuerbällen 

  FeuerballKlasse () {
    super();
  } 

  void anzeigen () {
    rect(this.x, this.y, 50, 50); // rechteck für kollision 

    // Animation des Feuerballs mit Hilfe des Arrays fire
    aktFrameFire = (aktFrameFire+1) % anzFrameFire; 
    image (fire [(aktFrameFire ) % anzFrameFire], this.x-10, this.y-70, 150, 150);         
    // hit kollisionsfunktion zugewiesen
    hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, this.x, this.y, 50, 50); // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt
    if (hit== true) {  
      print("colliding? " + hit+points--); // punkte abziehen 
      image (explode, this.x-65, this.y-90, 230, 230); //explosionsbild bei kollision anzeigen 
      explosion = minim.loadFile ("explosion.mp3"); 
      explosion.play(); // abspielen sound 
      if (points==-1) { // sicherstellen das punkte nicht weniger als 0 sind 
        points=0;
      } 
      //anfangswerte zuweisen 
      this.y = -1; 
      this.x=random(17, width-24);
    }
  } 

  void erzeugen () {
    for (int i =0; i < f.length; i++) { // durchlaufen array
      f[i]= new FeuerballKlasse (); // initialisieren
    }
  } 

  void fallenFinal() { //feuerbälle fallen 
    for (int i = 0; i<f.length; i++) { 
      f[i].runterfallen(); 
      f[i].anzeigen();
    }
  }
}  

class muenzeLevel2 { // münze für das zweite level
  int x=780; 
  int y=500; 


  void anzeigen () { 

    rect(x, y, 40, 60);  //rechteck für kollision 

    //Animation der Münze mit Hilfe des Arrays muenze
    aktFrameMuenze = (aktFrameMuenze+1) % anzFrameMuenze; 
    image (muenze [(aktFrameMuenze ) % anzFrameMuenze ], this.x-35, this.y-23, 110, 110); 
    //hit funktionszuweisung 
    hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, x, y, 40, 60);  // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt
    if (hit== true) { 
      print("colliding? " + hit+points++);  // erhöhen punkte
      points++; // nochmaliges erhöhen, da die münze dopplet zählt 
      spielstatus=5; // übergang in neuen spielstatus
      muenzeSound = minim.loadFile( "coin.mp3");
      muenzeSound.play();  // abspielen sound
      zombieSound.pause(); // beenden des zombiesounds, da er im nächsten level nicht gebraucht wird 
      figur = new Figur(0, height-192, 1); // erzeugen einer neuen figur, um figur auf anfangswerte zu setzen
    }
  }
}  

class feuerball1Level2 { // feuerball level 2
  int x =220; 
  int y=200; 
  int schritte =2; // wie schnell sich der feuerball bewegen soll 


  void anzeigen () { 
    // if verzweigung um richtige sprites anzuzeigen 
    if (schritte ==2) { 

      rect(x, y, 40, 40); // rechteck für kollision 

      // Animation des Feuerballs mit Hilfe des Arrays fire
      aktFrameFire = (aktFrameFire+1) % anzFrameFire; 
      image (fire [(aktFrameFire ) % anzFrameFire], this.x-10, this.y-70, 150, 150);
    } else if (schritte ==-2) { 
      rect(x, y, 40, 40); // rechteck für kollision 
      pushMatrix();  // spiegelung sprites 
      scale(1, -1);
      aktFrameFire = (aktFrameFire+1) % anzFrameFire; 
      image (fire [(aktFrameFire ) % anzFrameFire], this.x-10, -this.y-120, 150, 150);       
      popMatrix();
    } 
    //hit kollisionsfunktion zuweisen 
    hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, this.x, this.y, 40, 40); // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt 
    if (hit== true) {  
      print("colliding? " + hit);
      spielstatus=8; // bei kollision, übergang in gameover spielzustand 
      zombieSound.pause(); // beenden, da sound nicht mehr gebraucht wird
      fail.play(); // sound abspielen
    }
  }  

  void bewegen () { // bewegung des feuerballs 
    y+=schritte; 

    if (y>height-500) { // untere grenze 
      y=height-500; 
      schritte =-2;
    } else if (y<75) { // obere grenze 
      y=75; 
      schritte = 2;
    }
  }
} 


class Messer { // messer level 2 
  int x =250; 
  int y=400; 
  int schritte =3; // wie schnell sich messer bewegen soll 

  void erzeugen () { 
    // if verzweigung um  richtige sprites anzuzeigen 
    if (schritte==-3) { 
      rect (x+10, y+20, 88, 10); 
      image (knife, x, y, 100, 50); 
      // hit kollisionsfunktion zuweisen 
      hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, x+10, y+20, 88, 10);  // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt
      if (hit== true) { 
        spielstatus=8; // bei kollision übergang in game over spielzustand 
        zombieSound.pause(); // sound stoppen, da er nicht mehr gebraucht wird 
        fail.play(); // sound starten
      }
    } else if (schritte==3) {  
      rect (x+6, y+20, 88, 10);
      pushMatrix();  // spiegelung sprites 
      scale(-1, 1); 
      image (knife, -x-100, y, 100, 50);  
      popMatrix(); 

      hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, x+6, y+20, 88, 10);  // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt
      if (hit== true) { 
        spielstatus=8; // bei kollision übergang in game over spielzustand 
        zombieSound.pause(); // sound stoppen, da er nicht mehr gebraucht wird 
        fail.play(); // sound starten
      }
    }
  } 

  void bewegen() { // bewegen des messers 
    x+=schritte; 

    if (x>width-590) { // rechts 
      x=width-590; 
      schritte =-3;
    } else if (x<35) { // links 
      x=35; 
      schritte = 3;
    }
  }
} 

class Granate { // granate level 2 
  int x =730; 
  int y=44; 
  int schritte =3;  

  void erzeugen () { 
    rect (x, y, 35, 104); // rechteck für kollisionen 
    image (gran, x-70, y-30, 170, 170);  

    // hit kollisionsfunktion zuweisen 
    hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, x, y, 35, 104);  // erste x und y = position spielfigur, zweites x, y positon item
    if (hit== true) { 
      spielstatus=8; // übergang in gameover spielzustand
      zombieSound.pause(); // sound stoppen, da er nicht mehr gebraucht wird 
      fail.play(); // sound starten
    }
  } 

  void bewegen() { // bewegen der granate 
    y+=schritte; 

    if (y>100) { // unten
      y=100; 
      schritte =-3;
    } else if (y<10) { // oben 
      y=10; 
      schritte = 3;
    }
  }
}