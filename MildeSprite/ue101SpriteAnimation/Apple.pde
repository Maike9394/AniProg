/**
 * @author Maike Lippold
 * @version 1.0
 */
 /*VARIABLEN*/
 float appleX, appleY, appleSize;
 PImage apple1, apple2, apple3, apple4, apple6;
  
 /*Klasse APPLE*/
 public class Apple {
   float xPosition;      //x Position 
   float yPosition;      //y Position
   float speedY;      //Geschwindigkeit Y
  
   Apple (float xPosition, float yPosition, float speedY){
     xPosition = this.xPosition;
     yPosition = this.yPosition;
     speedY = this.speedY;
   }
   
   void addGravity(){
      //add speed to location
      speedY = speedY + gravity;
      //add gravity to speed
      py = py + speedY;
       if(py > ground){
        //Verlangsamt das immer wieder abspringen, bounced 2 mal
        speedY = speedY * -0.35;
        py = ground;
        }
    }
}
 
/*Ende Klasse APPLE*/
//Erstellen der verschiedenen Äpfel images

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
  apples[1].copy(apple1,100,0*100,100,100,0,0, 100,100);
  apples[1].endDraw();
  
  apple3 = loadImage("apple3.png");
  apples[2] = createGraphics(size,size);
  apples[2].beginDraw();
  apples[2].copy(apple1,100,0*100,100,100,0,0, 100,100);
  apples[2].endDraw();
  
  apple4 = loadImage("apple4.png");
  apples[3] = createGraphics(size,size);
  apples[3].beginDraw();
  apples[3].copy(apple1,100,0*100,100,100,0,0, 100,100);
  apples[3].endDraw();
  
  apple6 = loadImage("apple6.png");
  apples[4] = createGraphics(size,size);
  apples[4].beginDraw();
  apples[4].copy(apple1,100,0*100,100,100,0,0, 100,100);
  apples[4].endDraw(); 
}