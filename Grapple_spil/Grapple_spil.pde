Player p;

void setup(){
p=new Player(20,20,2,1.02); //laver et objekt "p" som er fra player klassen
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
