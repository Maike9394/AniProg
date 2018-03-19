PImage idlePlayerL;
color col;

public class Worm {
  float xPosition, yPosition; // location
  float speedY,r;  
  
 // Worm(float xPosition, float yPosition, float tempR) {
   Worm(float tempR) {
     xPosition = this.xPosition;
     yPosition = this.yPosition;
     col = color(50, 10, 10, 150);
     r = tempR;
  }

  void setLocation(float tempX, float tempY) {
    xPosition = tempX;
    yPosition = tempY;
  }
  
  void display() {
    stroke(0);
    fill(125);
    ellipse(xPosition, yPosition, r*2, r*2);
  }


  
  // A function that returns true or false based on
  // if the catcher intersects a raindrop
  boolean intersect(Apples d) {
    // Calculate distance
    float distance = dist(xPosition, yPosition, d.appleX, d.appleY); 

    // Compare distance to sum of radii
    if (distance < r + d.appleSize) { 
      return true;
    } else {
      return false;
    }
  }
}