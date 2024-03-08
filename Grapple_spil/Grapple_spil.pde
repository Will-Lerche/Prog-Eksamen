Player p;
Spike s1;
Platform b1;
Platform b2;


void setup(){
p=new Player(20,380,2,1.02); //laver et objekt "p" som er fra player klassen
b1=new Platform(10,430,64,64);
b2=new Platform(120,430,64,64);
s1=new Spike(70,430,64,164);

size(500,500);
}

void draw(){
  background(100);
p.drawPlayer();
b1.createBoks();
b2.createBoks();
s1.createSpike();
if(b1.overlap || b2.overlap) p.onGround = true; else p.onGround = false;// hvis den overlapper så er onGround true ellers false
if (s1.overlap) println("Hej"); //tester
println("b1:", b1.overlap, " b2:", b2.overlap );

}

void keyPressed() {
  p.keyPress();
}

void keyReleased() {
  p.keyRelease();
}
