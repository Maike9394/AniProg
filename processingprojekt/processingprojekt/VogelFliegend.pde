
/**
 * @author Michael Eisenacher 
 * @version 1.0
 */

class VogelFliegend { // vogel der über nordpol fliegt 
  PImage nordpol;  
  PImage bag2;  
  int y =132;
  float vogelFlyX= 0;  
  float x =0;  
  int geschwY =1;
  //für animation sprites 
  int anzFrameVogelFliegend = 4; 
  int aktFrameVogelFliegend =0; 
  PImage [] vogelFliegend = new PImage [anzFrameVogelFliegend]; 
  //sprites in array 
  void arrayVogelFliegen() {
    vogelFliegend [0]= loadImage("Bilder/Vogel/vogelfliegen1.png"); 
    vogelFliegend [1]= loadImage("Bilder/Vogel/vogelfliegen2.png"); 
    vogelFliegend [2]= loadImage("Bilder/Vogel/vogelfliegen3.png"); 
    vogelFliegend [3]= loadImage("Bilder/Vogel/vogelfliegen4.png");
  }

  void vogelFliegen () { 
    noFill(); 
    noStroke(); 
    rect(x+25, y, 50, 50);  // für kollisionen 
    image(bag2, vogelFlyX+25, y, 50, 50); 
    //animation sprites 
    aktFrameVogelFliegend = (aktFrameVogelFliegend+1) % anzFrameVogelFliegend; 
    image (vogelFliegend [(aktFrameVogelFliegend ) % anzFrameVogelFliegend], vogelFlyX, 0, width/5, height/4);  
    vogelFlyX+=4; // vogel bewegt sich   
    rect (300, 350, 500, 500); //rechteck für kollision mit kiste 
    hit = rectRect(x+25, y, 50, 50, 300, 350, 500, 500);// x pos figur, y pos figur, x rechteck figur, y rechteckfigur, xpos des items, ypos des items, x rechteck figur, y rechteck figur 

    if (hit== true) { 
      y=5000;  
      muenzeSound = minim.loadFile( "coin.mp3");
      //sounds abspielen 
      muenzeSound.play();  
      hoho.play();
    }
  } 


  void loslassen () { // loslassen des sackes 
    if (x <400) { 
      x+=4;
    } else { // ab hier fällt der sack 
      x=400; 
      geschwY+=1; 
      y+=geschwY;
    }
  }
} 