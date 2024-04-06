class Coins extends Overlap { 
  float yVariation = 0;
  boolean coin= true;

  Coins(int xin, int yin, int hin, int bin) {
    x=xin;
    y=yin;
    h=hin;
    b=bin;
  }

  void drawCoins() { 
    if (coin) {
      ellipse(x, y+sin(yVariation)*10, b, h);
      noStroke();
      fill(0,0,0,22);
      ellipse(x, 439, b+cos(yVariation+ PI/2)*3, h/2);
      fill(255);
      stroke(3);
      yVariation += 0.05;
      if (overlap()) {
        score ++;
        coin = false;
      }
     
    }
  }
}
