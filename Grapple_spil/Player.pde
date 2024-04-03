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
    println("position box",player);
    vel.add(acc);
    player.add(vel);
    acc.set(0, 0);
    if (player.y >= 380) {
      player.y=380;
    } else {
      acc.y = acc.y + g;
    }
    vel.x = vel.x*0.8;


  if(knapH) acc.x = 1;
  if(knapV) acc.x = -1;
  if(knapJ && player.y >= 380) acc.y = -12;
//println(knapH);
  }
  
  void keyPress() { //bevæger spilleren
    if (keyCode == 'D') {
      knapH = true;
      
    } else if (keyCode == 'A') {
      knapV = true;
      
    } else if (keyCode=='W' && player.y >= 380) {
      knapJ = true;
      //println("hop! "+frameCount);
    }
  }

 void keyRelease() { //stopper spillerens bevægelse
    if (keyCode == 'D') {
      knapH = false;
    } else if (keyCode == 'A') {
      knapV = false;
    } else if (keyCode=='W') {
      knapJ = false;
    }
  }
  }
