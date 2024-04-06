class Platform extends Overlap {

  Platform(int xin, int yin, int bin, int hin) {
    x = xin; 
    y = yin; 
    b = bin; 
    h = hin;
  }
  void createBoks() {
    strokeWeight(1);
    rect(x, y, b, h);
    overlap();
  }
}
