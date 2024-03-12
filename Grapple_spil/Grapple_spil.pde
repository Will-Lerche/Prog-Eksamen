Player p;
Pendulum g;
Spike s1;
Platform b1;
Platform b2;
Health h;

boolean grappleActive = false;



void setup(){
p=new Player(20,380,2,1.02); //laver et objekt "p" som er fra player klassen
b1=new Platform(10,430,64,64);
b2=new Platform(120,430,64,64);
s1=new Spike(70,430,64,164);
h=new Health(10,10);


g = new Pendulum(new PVector(width/2,0),175);
size(500,500);
}

void draw(){
  background(100);
  if(grappleActive) g.go();
p.drawPlayer();
b1.createBoks();
b2.createBoks();
s1.createSpike();

h.Hearts();


if(b1.overlap || b2.overlap) p.onGround = true; else p.onGround = false;// hvis den overlapper så er onGround true ellers false
if (s1.overlap) h.liv=h.liv-1; //hvis man rammer spike så mister man liv
println(h.liv );


}

void keyPressed() {
  p.keyPress();
}

void keyReleased() {
  p.keyRelease();
}

void mousePressed(){
 grappleActive = true;
 g.origin = new PVector(mouseX,mouseY);
}

void mouseReleased(){
  grappleActive = false;
}
