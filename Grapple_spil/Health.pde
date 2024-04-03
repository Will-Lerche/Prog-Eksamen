class Health {
  PImage hjerte;
  int hx, hy;
  int liv=3;


  Health(int Hxpos, int Hypos) {
    hjerte = loadImage("Heart.png");
    hx=Hxpos;
    hy=Hypos;
  }


  void Hearts() {
    //int billed=loadImage;
    if (liv==3) {
      image(hjerte, hx, hy);
      image(hjerte, hx+30, hy);
      image(hjerte, hx+60, hy);
    }
    if (liv==2) {
      image(hjerte, hx, hy);
      image(hjerte, hx+30, hy);
    }
    if (liv==1) {
      image(hjerte, hx, hy);
    }
  }
}
