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
      yVariation += 0.05;
      if (overlap()) {
        score ++;
        coin = false;
      }
    }
  }
}
