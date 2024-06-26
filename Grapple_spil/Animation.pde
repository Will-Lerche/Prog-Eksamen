class Animation {
  PImage spritesheet;
  int wFrame;            //bredde på hver frame i spriteshetten
  int hFrame;            //højde på hver frame i spriteshetten
  int row, column;       //row og column bruges til at vælge hvilken "nummer" frame
  int Ax=0, Ay=0;           //x og y anvendes til at finde øverste venstre hjørne af denne frame
  int reverseFactor = 1; //reverseFactor bruges til at spejlvende en frame
  int w, h, fps;
  float x, y;
  boolean animationBillede = true;

  Animation(String spriteSheet, int win, int hin, int fpsin, float xin, float yin) {
    imageMode(CENTER);
    spritesheet = loadImage(spriteSheet);
    wFrame = spritesheet.width/win;
    hFrame = spritesheet.height/hin;
    w = win;
    h = hin;
    x = xin;
    y = yin;
    fps = fpsin;
  }

  void Animater() {
    if (frameCount%fps==0) { //animationen er lidt hurtig, så jeg ændrer kun frame hver 5. billede

      //udvælgelse af næste frame
      if (column<w-1) {
        column++;
      } else {
        column=0;
        row++;
      }
      if (row==2) {
        row=0;
      }
      if (row==1 && column==2) {
        row=0;
        column=0;
      }
      //Tallet 25 er korigering fordi tegningerne på mit spritsheet er for langt til venstre!
      Ax = (column)*wFrame-35;
      Ay = (row)*hFrame;
    }
    PImage sprite = spritesheet.get(Ax, Ay, wFrame, hFrame);
    pushMatrix();
    scale(reverseFactor, 1);

    if (animationBillede) {
      //billedet var alt for stort så det er sat til 100X100 pixels istedet
      image(sprite, reverseFactor*x + reverseFactor*20, y+10, 100, 100);    } else {
        PImage idle = loadImage("doraemon1.png");
        image(idle, reverseFactor*x + reverseFactor*20, y+10, 160, 100);
      }


      popMatrix();
      
    }
  }
