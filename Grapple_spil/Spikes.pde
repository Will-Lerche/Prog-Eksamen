class Spike extends Overlap {
  PImage spike;
  Spike(int xin, int yin, int hin, int bin) {
    x = xin; 
    y = yin; 
    h = hin; 
    b = bin;
  }

  void createSpike() {
    spike=loadImage("spike.png");
    image(spike, x, y, b, h);
    overlap();
  }
}
