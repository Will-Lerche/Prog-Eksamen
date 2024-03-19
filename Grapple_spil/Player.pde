class Player{ //Det her er spiller klassen
boolean right,left;
float Pxpos, Pypos, Pxvel, Pyvel, Pacc, Pdacc;
float b=50,h=50;
float g = 0.8;
boolean knapH, knapV, knapJ, onGround;
PVector player = new PVector();
PVector acc = new PVector();
PVector vel = new PVector();


  Player(PVector play) {
    player = play;
  }

  void drawPlayer() {
    strokeWeight(1);
    rect(player.x, player.y, b, h);
    vel.add(acc);
    player.add(vel);
    acc.set(0, 0);
    if (player.y >= 380) {
      player.y=380;
    } else {
      acc.y = acc.y + g;
    }
    vel.x = vel.x*0.8;


  if(keyPressed && key=='d') acc.x = 1;
  if(keyPressed && key=='a') acc.x = -1;
  if(keyPressed && key=='w' && player.y >= 380) acc.y = -12;


  }
  void keyPress() { //bevæger spilleren
    if (keyCode == RIGHT) {
      knapH = true;
    } else if (keyCode == LEFT) {
      knapV = true;
    } else if (keyCode==UP && player.y >= 380) {
      knapJ = true;
      println("hop! "+frameCount);
    }
  }
}
 void keyRelease() { //stopper spillerens bevægelse
    if (keyCode == RIGHT) {
      //knapH = false;
    } else if (keyCode == LEFT) {
      //knapV = false;
    } else if (keyCode==UP) {
      //knapJ = false;
    }
  }
