class Player { //Det her er spiller klassen
 // boolean right, left;
  float b=50, h=50;
  float g = 0.8;
  boolean knapH, knapV, knapJ, slag, onGround;
  PVector player = new PVector();
  PVector acc = new PVector();
  PVector vel = new PVector();
  PVector Camera = new PVector();
  Animation a;

  Player(PVector play) {
    player = play;
    a=new Animation("sprite.png",4,2,5,player.x,player.y);
  }

  void drawPlayer() {
    strokeWeight(1);
    a.Animater(); //player animeres
    a.x = player.x;
    a.y = player.y;
    
    vel.add(acc);
    player.add(vel);
    Camera.add(vel);
    acc.set(0, 0);

    if (onGround && knapJ ) {

      acc.y = -12;
    } else if (onGround ) {
      playerYposCollide(b1.overlap,b1.y);
      playerYposCollide(b2.overlap,b2.y);
      //player.y=b1.y-p.b+1;
    } else {
      if (!grappleActive) {
        acc.y = acc.y + g;
      } else {
        acc.y = 0;
      }
    }


    vel.x = vel.x*0.8;
    if (onGround){
      vel.y=0;
    }


    if (knapH) acc.x = 1;
    if (knapV) acc.x = -1;
    if(!knapV && !knapH) a.animationBillede = false; else a.animationBillede = true;
    // if (knapJ && onGround ) acc.y = -12;
  }


 void playerYposCollide(boolean plat,float bY){
 if (onGround && plat) {
      player.y=bY-p.b+1;
    }
 }



  void keyPress() { //bevæger spilleren
    if (keyCode == 'D') {
      knapH = true;
      a.reverseFactor=1;
    } else if (keyCode == 'A') {
      a.reverseFactor=-1;
      knapV = true;
    } else if (keyCode=='W' ) {
      knapJ = true;
    }else if (keyCode==' ' ) {
      slag = true;
  }
  }

  void keyRelease() { //stopper spillerens bevægelse
    if (keyCode == 'D') {
      knapH = false;
    } else if (keyCode == 'A') {
      knapV = false;
    } else if (keyCode=='W') {
      knapJ = false;
    }else if (keyCode==' ') {
      slag = false;
  }
  }
  
  
  
}
