Player p;

void setup(){
p=new Player(20,400,2,1.02);
size(500,500);
}

void draw(){
  background(100);
p.drawPlayer();

}

void keyPressed() {
  p.keyPress();
}

void keyReleased() {
  p.keyRelease();
}
