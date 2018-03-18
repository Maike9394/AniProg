class TimeBase {
  private int phases = 7;
  private int dauer = 100; // dauer phase in ms
  private int startTime = 0;

  
  public TimeBase(int dur, int phs) {
    phases = phs;
    dauer = dur;
    startTime = millis();
  }
  
  public int getPhase() {
    int time = millis() - startTime;
    int p = floor(time / dauer);
    return (p % phases);
  }
}