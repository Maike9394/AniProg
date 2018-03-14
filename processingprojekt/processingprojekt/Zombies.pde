/**
 * @author Michael Eisenacher 
 * @version 1.0
 */

class ZombieMann { // männlicher zombie level 2 
  int XZombieLinks = 250; //x position für männlichen zombie 
  int YZombieLinks = 464; //y position für männlichen zombie  
  int schritteZombieMale =1; // wie schnell sich zombie bewegt 

  // animation sprites 
  int anzFrameZlaufen = 10; 
  int aktFrameZlaufen =0; 
  PImage [] Zlaufen = new PImage [anzFrameZlaufen]; 

  // bilder zombie in array einfügen 
  void arrayZombieMale() { 
    Zlaufen[0] = loadImage("Bilder/Zombie/zlaufen1.png");  
    Zlaufen[1] = loadImage("Bilder/Zombie/zlaufen2.png");  
    Zlaufen[2] = loadImage("Bilder/Zombie/zlaufen3.png");  
    Zlaufen[3] = loadImage("Bilder/Zombie/zlaufen4.png");  
    Zlaufen[4] = loadImage("Bilder/Zombie/zlaufen5.png");  
    Zlaufen[5] = loadImage("Bilder/Zombie/zlaufen6.png");  
    Zlaufen[6] = loadImage("Bilder/Zombie/zlaufen7.png");  
    Zlaufen[7] = loadImage("Bilder/Zombie/zlaufen8.png");  
    Zlaufen[8] = loadImage("Bilder/Zombie/zlaufen9.png");  
    Zlaufen[9] = loadImage("Bilder/Zombie/zlaufen10.png");
  }  

  void erzeugen () {   
    // if verzweigung um richtige sprites anzuzeigen
    if (schritteZombieMale==1) {  
      rect(XZombieLinks+15, YZombieLinks, 100, 165); // rechteck für kollision 

      hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, XZombieLinks+15, YZombieLinks, 100, 165); // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt 
      if (hit== true) { 
        print("colliding? " );  
        zombieSound.pause(); // stoppen, wird nicht mehr gebraucht
        fail.play(); // sound abspielen 
        spielstatus =8; // übergang game over spielstatus
      }  
      // animation der sprites 
      aktFrameZlaufen = (aktFrameZlaufen+1) % anzFrameZlaufen; 
      image (Zlaufen [(aktFrameZlaufen ) % anzFrameZlaufen], XZombieLinks-30, YZombieLinks-50, width/4, height/3);
    } else if (schritteZombieMale==-1) {
      rect(XZombieLinks+50, YZombieLinks, 100, 165); // rechteck für kollision 

      hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, XZombieLinks+50, YZombieLinks, 100, 165); // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt
      if (hit== true) { 
        print("colliding? " ); 
        spielstatus =8;  // übergang in gameover spielstatus 
        zombieSound.pause(); // sound stoppen, da er nicht mehr gebraucht wird 
        fail.play(); // sound abspielen
      } 

      pushMatrix(); // sprites spiegeln 
      scale(-1, 1);
      aktFrameZlaufen = (aktFrameZlaufen+1) % anzFrameZlaufen; 
      image (Zlaufen [(aktFrameZlaufen ) % anzFrameZlaufen], -XZombieLinks-190, YZombieLinks-50, width/4, height/3);
      popMatrix();
    }
  }   
  void bewegen() { // bewegen des zombies 
    XZombieLinks+=schritteZombieMale; 
    if (XZombieLinks>width-700) { // rechts 
      XZombieLinks=width-700; 
      schritteZombieMale= -1;
    } else if (XZombieLinks <20) { // links 
      XZombieLinks=20; 
      schritteZombieMale =1;
    }
  }
}

class ZombieFrau {  
  // für animation sprites 
  int anzFrameFemale = 10; 
  int aktFrameFemale =0; 
  PImage [] Female = new PImage [anzFrameFemale]; 

  int XFemale = 300; // xposition
  int YFemale = 464;  //yposition 
  int schritteZombieFemale= 1;  // wie schnell sich zombie bewegt 

  //spirtes in array einfügen 
  void arrayZombieFemale () { 
    Female [0] = loadImage("Bilder/Zombie/female/femaleZ1.png");  
    Female [1] = loadImage("Bilder/Zombie/female/femaleZ2.png"); 
    Female [2] = loadImage("Bilder/Zombie/female/femaleZ3.png");  
    Female [3] = loadImage("Bilder/Zombie/female/femaleZ4.png");  
    Female [4] = loadImage("Bilder/Zombie/female/femaleZ5.png");  
    Female [5] = loadImage("Bilder/Zombie/female/femaleZ6.png");  
    Female [6] = loadImage("Bilder/Zombie/female/femaleZ7.png");  
    Female [7] = loadImage("Bilder/Zombie/female/femaleZ8.png");  
    Female [8] = loadImage("Bilder/Zombie/female/femaleZ9.png");  
    Female [9] = loadImage("Bilder/Zombie/female/femaleZ10.png");
  } 

  void erzeugen() { 
    // if verzweigung um richtige sprites anzuzeigen 
    if (schritteZombieFemale==1) { 
      rect(XFemale+35, YFemale, 100, 165); // rechteck für kollisionen   
      // animation sprites
      aktFrameFemale = (aktFrameFemale+1) % anzFrameFemale; 
      image (Female [(aktFrameFemale ) % anzFrameFemale], XFemale-30, YFemale-50, width/4, height/3); 

      hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, XFemale+35, YFemale, 100, 165);  // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt 
      if (hit== true) { 
        print("colliding? " );  
        spielstatus =8;  // übergang game over spielstatus
        zombieSound.pause(); // sound stoppen, da er nicht mehr gebraucht wird
        fail.play(); // sound abspielen
      }
    } else if (schritteZombieFemale==-1) {  
      rect(XFemale+25, YFemale, 100, 165);  
      pushMatrix();  
      scale(-1, 1);
      aktFrameFemale = (aktFrameFemale+1) % anzFrameFemale; 
      image (Female [(aktFrameFemale ) % anzFrameFemale], -XFemale-190, YFemale-50, width/4, height/3); 
      popMatrix();  

      hit = rectRect(figur.xfigur-20, figur.yfigur+485, width/5-30, height/4-20, XFemale+25, YFemale, 100, 165);  // erste x und y = position spielfigur, breite figur, höhe figur, zweites x und y = position kollisionsobjekt, breite kollisionsobjekt, höhe kollisionsobjekt 
      if (hit== true) { 
        print("colliding? " );  
        spielstatus =8;  // übergang game over spielstatus
        zombieSound.pause(); // sound stoppen, da er nicht mehr gebraucht wird
        fail.play(); // sound abspielen
      }
    }
  } 

  void bewegen() { // bewegen des weiblichen zombies
    XFemale+=schritteZombieFemale; 
    if (XFemale>width-250) { //rechts
      XFemale=width-250; 
      schritteZombieFemale= -1;
    } else if (XFemale <500) { //links
      XFemale=500; 
      schritteZombieFemale =1; 
      zombieSound.loop(); // zombie in einer schleife abspielen
    }
  }
}