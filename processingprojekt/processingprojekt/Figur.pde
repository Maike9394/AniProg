/**
 * @author Michael Eisenacher 
 * @version 1.0
 */

//Animation der Sprites für stehende Figur 
int anzFrame = 10; //anzahl der frames 
int aktuellerFrame =0; // aktueller frame
PImage [] stehen = new PImage [anzFrame]; // erzeugen einer array bildvariable

// Animation der Sprites für laufende Figur
int anzFrameLaufenRechts = 10; //anzahl der frames 
int aktFrameLaufenRechts =0; // aktueller frame
PImage [] LaufenRechts = new PImage [anzFrameLaufenRechts]; // erzeugen einer array bildvariable

// Animation der Sprites für springende Figur
int anzFrameSpringen = 10; //anzahl der frames 
int aktFrameSpringen =0; // aktueller frame
PImage [] Springen = new PImage [anzFrameSpringen]; // erzeugen einer array bildvariable  

void arraystehendeFigur () { 
  //Bilder für stehende Figur werden in Array stehen eingefügt
  stehen [0] = loadImage("Bilder/figur/Stehen1.png"); 
  stehen [1] = loadImage("Bilder/figur/Stehen2.png"); 
  stehen [2] = loadImage("Bilder/figur/Stehen3.png"); 
  stehen [3] = loadImage("Bilder/figur/Stehen4.png"); 
  stehen [4] = loadImage("Bilder/figur/Stehen5.png"); 
  stehen [5] = loadImage("Bilder/figur/Stehen6.png"); 
  stehen [6] = loadImage("Bilder/figur/Stehen7.png"); 
  stehen [7] = loadImage("Bilder/figur/Stehen8.png"); 
  stehen [8] = loadImage("Bilder/figur/Stehen9.png"); 
  stehen [9] = loadImage("Bilder/figur/Stehen10.png");
}  

void arrayLaufendeFigur () {
  // Bilder für das Laufen in Array LaufenRechts eingefügt 
  LaufenRechts [0] = loadImage("Bilder/figur/laufenRechts1.png");
  LaufenRechts [1] = loadImage("Bilder/figur/laufenRechts2.png"); 
  LaufenRechts [2] = loadImage("Bilder/figur/laufenRechts3.png");
  LaufenRechts [3] = loadImage("Bilder/figur/laufenRechts4.png"); 
  LaufenRechts [4] = loadImage("Bilder/figur/laufenRechts5.png"); 
  LaufenRechts [5] = loadImage("Bilder/figur/laufenRechts6.png"); 
  LaufenRechts [6] = loadImage("Bilder/figur/laufenRechts7.png"); 
  LaufenRechts [7] = loadImage("Bilder/figur/laufenRechts8.png"); 
  LaufenRechts [8] = loadImage("Bilder/figur/laufenRechts9.png"); 
  LaufenRechts [9] = loadImage("Bilder/figur/laufenRechts10.png");
}

void arrayFigurSpringen() { 
  // Bilder für das Springen in Array Springen eingefügt
  Springen [0] =  loadImage("Bilder/figur/springen1.png"); 
  Springen [1] =  loadImage("Bilder/figur/springen2.png"); 
  Springen [2] =  loadImage("Bilder/figur/springen3.png"); 
  Springen [3] =  loadImage("Bilder/figur/springen4.png"); 
  Springen [4] =  loadImage("Bilder/figur/springen5.png"); 
  Springen [5] =  loadImage("Bilder/figur/springen6.png"); 
  Springen [6] =  loadImage("Bilder/figur/springen7.png"); 
  Springen [7] =  loadImage("Bilder/figur/springen8.png"); 
  Springen [8] =  loadImage("Bilder/figur/springen9.png"); 
  Springen [9] =  loadImage("Bilder/figur/springen10.png");
} 
public class Figur {

  float xfigur; // xPosition der Spielfigur 
  float yfigur;  //yPosition der Spiefigur 
  float geschwY;  // geschwindigkeit y   
  boolean rechts =true;  // variable um zu überprüfen ob figur rechts steht 
  boolean fallen = false; // variable um zu überprüfen ob figur fällt

  Figur (float xfigur, float yfigur, float geschwY) { 
    xfigur=this.xfigur; 
    yfigur=this.yfigur; 
    geschwY=this.geschwY;
  }

  void bewegungSpieler () { // methode welche dafür sorgt, dass sich die figur nur bis zum rand des bildschirms bewegen kann, nicht abgeschnitten wird und nur bis zum boden fällt
    if (xfigur < 15) { // links 
      xfigur = 15;
    }
    if ( xfigur> width - 113) { // rechts 
      xfigur = width - 116;
    }  
    if ( yfigur> 1) { // boden
      yfigur = 1; 
      fallen =false;
    }
    if ( yfigur< -350) { // obere grenze
      yfigur = -347;
    }
  }  
  void keyPressed() { // methode für tastatureingaben welche die figur steuern und die zur eingabe passenden sprites anzeigen 
    noStroke(); 
    noFill(); 
    if ((keyPressed ==true && (keyCode==LEFT))) { // tastatureingabe, in diesem fall der linke pfeil 
      xfigur-=20;  // veränderung der x position der figur 
      rect(xfigur-25, yfigur+485, width/5-30, height/4-20); // rechteck für kollision 
      if (fallen==true) { // figur fällt 
        rect(xfigur-20, yfigur+485, width/5-30, height/4-20);
        pushMatrix();  // spiegelung wenn rechts false ist um sprites anzupassen
        scale(-1, 1);   
        image (Springen [7], -xfigur-125, yfigur+475, width/5, height/4); 
        popMatrix(); // rückspiegelung
      } else if (fallen == false) {  // wenn figur nicht fällt 
        pushMatrix();  // erzeugen eines neuen koordinatensystems, da sprites gespiegelt werden sollen 
        scale(-1, 1); // x position negativ setzen 

        //Animation des Laufens nach rechts der Figur mit Hilfe des Arrays LaufenRechts   
        aktFrameLaufenRechts = (aktFrameLaufenRechts+1) % anzFrameLaufenRechts; // damit das nächste bild ausgewählt wird 
        image (LaufenRechts [(aktFrameLaufenRechts ) % anzFrameLaufenRechts], -xfigur-120, 472, width/5, height/4); // aktuelles bild anzeigen, welches sich durch das arrays (welches solange durchlaufen wird wie der linke pfeil gedrückt wird,da die aktuelle frameanzahl ständig erhöht wird) ständig verändert 
        popMatrix(); // herstellen des alten koordinaten systems
      }
      rechts =false; // rechts auf false setzen, wegen der animation der sprites wenn die figur steht
    }  
    //das oben erklärte prinzip wurde im folgenden genauso gemacht  
    else if ((keyPressed ==true && (keyCode==RIGHT))) {  
      xfigur+=20;   
      rect(xfigur-20, yfigur+485, width/5-30, height/4-20); 
      if (fallen == true) { // figur fällt  
        rect(xfigur-20, yfigur+485, width/5-30, height/4-20); 
        image (Springen [7], xfigur-28, yfigur+475, width/5, height/4);
      } else if (fallen == false) { //figur fällt nicht 
        // Animation des Laufens nach rechts der Figur mit Hilfe des Arrays LaufenRechts   
        aktFrameLaufenRechts = (aktFrameLaufenRechts+1) % anzFrameLaufenRechts; 
        image (LaufenRechts [(aktFrameLaufenRechts ) % anzFrameLaufenRechts], xfigur-28, 472, width/5, height/4);
      } 
      rechts =true; // da figur rechts steht
    } else if ((keyPressed ==true && (keyCode==UP))) {
      yfigur -=80;
      if (rechts==true) { // wenn rechts true werden die normalen sprites zum springen animiert, sonst die gespiegelten 
        rect(xfigur-20, yfigur+485, width/5-30, height/4-20);  
        // Animation des Laufens nach rechts der Figur mit Hilfe des Arrays LaufenRechts   
        aktFrameSpringen = (aktFrameSpringen+1) % anzFrameSpringen; 
        image (Springen [(aktFrameSpringen ) % anzFrameSpringen], xfigur-28, yfigur+475, width/5, height/4);
      } else {
        rect(xfigur-20, yfigur+485, width/5-30, height/4-20); 
        pushMatrix();  // spiegelung wenn rechts false ist um sprites anzupassen
        scale(-1, 1);
        aktFrameSpringen = (aktFrameSpringen+1) % anzFrameSpringen; 
        image (Springen [(aktFrameSpringen ) % anzFrameSpringen], -xfigur-125, yfigur+475, width/5, height/4);     
        popMatrix();
      }
    } else {  
      if (rechts==true) {  // wenn rechts true dann normale sprites für stehende figur 
        if (fallen == true) { 
          rect(xfigur-20, yfigur+485, width/5-30, height/4-20); 
          aktFrameSpringen = (aktFrameSpringen+1) % anzFrameSpringen; 
          image (Springen [5], xfigur-28, yfigur+475, width/5, height/4);
        } else if (fallen == false) { //figur fällt nicht 
          rect(xfigur-20, yfigur+485, width/5-30, height/4-20); 
          aktuellerFrame = (aktuellerFrame+1) % anzFrame; 
          image (stehen [(aktuellerFrame ) % anzFrame ], xfigur-28, 472, width/5, height/4);
        }
      } else if (rechts==false) {  // wenn rechts false ist müssen die sprites der stehenden figur gespiegelt werden, da die figur nach links guckt 
        if (fallen ==true) { //figur fällt 
          rect(xfigur-20, yfigur+485, width/5-30, height/4-20);
          pushMatrix();  // spiegelung wenn rechts false ist um sprites anzupassen
          scale(-1, 1);
          aktFrameSpringen = (aktFrameSpringen+1) % anzFrameSpringen; 
          image (Springen [5], -xfigur-125, yfigur+475, width/5, height/4);      
          popMatrix();
        } else if (fallen ==false) { //figur fällt nicht 
          rect(xfigur-20, yfigur+485, width/5-30, height/4-20); 
          pushMatrix();  // spiegelung wenn rechts false ist um sprites anzupassen
          scale(-1, 1);
          aktuellerFrame = (aktuellerFrame+1) % anzFrame; 
          image (stehen [(aktuellerFrame ) % anzFrame ], -xfigur-125, 472, width/5, height/4);    
          popMatrix();
        }
      }
    }  
    fallen(); // sobald die sprungtaste gedrückt wurde fällt die figur
  }

  boolean fallen () {  // damit die figur nach dem springen wieder auf den boden fällt 
    if ((keyPressed ==true && (keyCode==UP)))  
      //simulation von gravitation
      if (geschwY<10) {
        geschwY+=5;
      } 
    yfigur+= geschwY;  

    if ((keyPressed ==true && (keyCode==UP))) {   
      fallen =true; // fallen wird auf true gesetzt, figur fällt
    }  
    return fallen;
  }
}  