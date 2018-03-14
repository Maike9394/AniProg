/* diese funktion wurde von mir lediglich minimal angepasst und aus dem Internet  entnommen. die quelle finden sie im quellenverzeichnis */


boolean rectRect (float x, float y, float w, float h, float x2, float y2, float  w2, float h2) {
  //2d
  //add in a thing to detect rectMode CENTER
  if (x + w >= x2 &&    // r1 right edge past r2 left
    x <= x2 + w2 &&    // r1 left edge past r2 right
    y + h >= y2 &&    // r1 top edge past r2 bottom
    y <= y2 + h2) {    // r1 bottom edge past r2 top
    return true;
  }
  return false;
}