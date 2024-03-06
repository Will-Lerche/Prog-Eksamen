Player p;
Platform b1;


void setup(){
p=new Player(20,400,2,1.02); //laver et objekt "p" som er fra player klassen
b1=new Platform(10,450,50,50);

size(500,500);
}

void draw(){
  background(100);
p.drawPlayer();
b1.boks();

}

void keyPressed() {
  p.keyPress();
}

void keyReleased() {
  p.keyRelease();
}
