/**
 * @author Maike Lippold
 * @version 1.0
 */
 /*VARIABLEN*/
  float appleX, appleY, appleSize;
  float appleSpeed = 0;
  //PImage apple1, apple2, apple3, apple4, apple6;
  //PGraphics[] apples = new PGraphics[6];
  //int index;
  PImage apple1;

 /*Klasse APPLE*/
 public class Apple {
   float xPosition;      //x Position 
   float yPosition;      //y Position

   Apple (float xPosition, float yPosition){
     xPosition = this.xPosition;
     yPosition = this.yPosition;
     
    }
      void fallen(){
      appleSpeed = appleSpeed + gravity;
      appleY = appleY + speedY;
   }
}
 
/*Ende Klasse APPLE*/
//Erstellen der verschiedenen Äpfel images


/*void getApple(){
  image(apples[index], 100, 100,200,200);
}


void fillAppleArray(){
  int size = (int)appleSize; //casten da createGraphis int erwartet
    
  apple1 = loadImage("apple1.png");
  apples[0] = createGraphics(size,size);
  apples[0].beginDraw();
  apples[0].copy(apple1,100,0*100,100,100,0,0, 100,100);
  apples[0].endDraw();
  
  apple2 = loadImage("apple2.png");
  apples[1] = createGraphics(size,size);
  apples[1].beginDraw();
  apples[1].copy(apple2,100,0*100,100,100,0,0, 100,100);
  apples[1].endDraw();
  
  apple3 = loadImage("apple3.png");
  apples[2] = createGraphics(size,size);
  apples[2].beginDraw();
  apples[2].copy(apple3,100,0*100,100,100,0,0, 100,100);
  apples[2].endDraw();
  
  apple4 = loadImage("apple4.png");
  apples[3] = createGraphics(size,size);
  apples[3].beginDraw();
  apples[3].copy(apple4,100,0*100,100,100,0,0, 100,100);
  apples[3].endDraw();
  
  apple6 = loadImage("apple6.png");
  apples[4] = createGraphics(size,size);
  apples[4].beginDraw();
  apples[4].copy(apple6,100,0*100,100,100,0,0, 100,100);
  apples[4].endDraw(); 
}*/