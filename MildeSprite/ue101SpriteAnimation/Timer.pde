/**
 * @author http://learningprocessing.com/examples/chp10/example-10-10-rain-catcher-game
 * angepasst von Maike Lippold
 */
 
class Timer {
  int savedTime; //When Timer started
  int totalTime; //How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    // sobald Timer startet, speichert es in Variable die aktuelle Zeit in millisekunde
    savedTime = millis();
  }
  //isFinished() gibt true zurück, wenn die gewünschte anzahl an millisekunden erreicht wurde 
  boolean timerFinished() { 
    //checken wie viel zeit bisher vergangen ist 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}