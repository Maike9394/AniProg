Timer timer;
Apples [] apples;
Worm worm;
int totalApples = 0;
int score;
  
  
void setup() {
  score = 0;
  size(480, 270);
  apples = new Apples[100];
  worm = new Worm(32);
  timer = new Timer(1200);    // Create a timer that goes off every 1200 milliseconds
  timer.start();             // Starting the timer
}

void draw() {
  background(220);
  textSize(60); text(score, 30, 60);
  worm.setLocation(mouseX,mouseY);
  worm.display();

  // Check the timer
  if (timer.isFinished()) {
    // Deal with apples
    // Initialize one apple
    apples[totalApples] = new Apples();
    // Increment totalDrops
    totalApples++;
    // If we hit the end of the array
    if (totalApples >= apples.length) {
      totalApples = 0; // Start over
    }
    timer.start();
  }

    // Move and display all apples
  for (int i = 0; i < totalApples; i++ ) {
    apples[i].move();
    apples[i].display();
    if(worm.intersect(apples[i])) {
    apples[i].caught();
    score += 1;
    }
  }
}
  