class Apples {
  float appleX, appleY;   //Variables for location of apple
  float appleSpeed;       // Speed of apple
  float appleSize;        //Größe des Apfels 
  PImage apple1;


  Apples(){
    appleX = random(10,400); 
    appleY = 0;
    appleSize = random(30,80);
    appleSpeed = random(4,7);
    apple1 = loadImage("apple1.png");    
  }

  void move(){
  appleY += appleSpeed;
  }
  
  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (appleY > height + appleSize - 50) { 
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
        image(apple1, appleX, appleY, appleSize,appleSize);

    // Display the apple
  //  image(apple1, appleX, appleY, appleSize,appleSize);
}
 //If the drop is caught
  void caught() {
    // Stop it from moving by setting speed equal to zero
    appleSpeed = 0; 
    // Set the location to somewhere way off-screen
    appleY = -1000;
  }

}