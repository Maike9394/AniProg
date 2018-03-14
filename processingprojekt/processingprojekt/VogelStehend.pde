/**
 * @author Michael Eisenacher 
 * @version 1.0
 */

class VogelStehend { // stehender vogel 

  PImage bag; 
  int YVogelHoch = 300; 
  // animation der sprites für stehenden vogel 
  int anzFrameVogelStehend = 4; 
  int aktFrameVogelStehend =0; 
  PImage [] vogelStehend = new PImage [anzFrameVogelStehend];  

  // bilder für stehenden vogel werden in array vogelStehend eingefügt 
  void arrayVogelStehend() {
    vogelStehend [0]= loadImage("Bilder/Vogel/vogelstehend1.png"); 
    vogelStehend [1]= loadImage("Bilder/Vogel/vogelstehend2.png"); 
    vogelStehend [2]= loadImage("Bilder/Vogel/vogelstehend3.png"); 
    vogelStehend [3]= loadImage("Bilder/Vogel/vogelstehend4.png");
  }
  void vogelStehend () { 
    image(bag, 385, YVogelHoch+230, 50, 50);
    aktFrameVogelStehend = (aktFrameVogelStehend+1) % anzFrameVogelStehend; 
    image (vogelStehend [(aktFrameVogelStehend ) % anzFrameVogelStehend], 270, YVogelHoch, width/3, height/2);  
    YVogelHoch-=5; // vogel fliegt nach oben
  }
}