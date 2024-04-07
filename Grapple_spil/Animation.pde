class Animation {
  PImage spritesheet;
  int wFrame;            //bredde på hver frame i spriteshetten 
  int hFrame;            //højde på hver frame i spriteshetten
  int row, column;       //row og column bruges til at vælge hvilken "nummer" frame
  int Ax=0, Ay=0;           //x og y anvendes til at finde øverste venstre hjørne af denne frame 
  int reverseFactor = 1; //reverseFactor bruges til at spejlvende en frame

  Animation() {
  } 


  void AnimationSetup() {
    imageMode(CENTER);
    spritesheet = loadImage("sprite.png");
    wFrame = spritesheet.width/4;
    hFrame = spritesheet.height/2;
  }

  void Animater() {
    if (frameCount%5==0) { //animationen er lidt hurtig, så jeg ændrer kun frame hver 5. billede

      //udvælgelse af næste frame
      if (column<3) { 
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
    //billedet var alt for stort så det er sat til 100X100 pixels istedet
    image(sprite, reverseFactor*p.player.x + reverseFactor*20, p.player.y+10, 100, 100);    

    popMatrix();
  }

  void animationtryk() {
    if (p.knapH)reverseFactor=1;
    else if (p.knapV)reverseFactor=-1;
  }
}
