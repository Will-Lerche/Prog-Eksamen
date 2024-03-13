Player p;
Pendulum g;
Spike s1;
Platform b1;
Platform b2;
Health h;

int livsTimer = 60; // cirka hvert sekund (computer afhængigt)

boolean grappleActive = false;



void setup(){
p=new Player(20,380,2,1.02); //laver et objekt "p" som er fra player klassen
b1=new Platform(10,430,64,500);
b2=new Platform(120,430,64,64);
s1=new Spike(120,420,64,164);
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
if (s1.overlap) livsTimer--; //hvis man rammer spike så begynder en timer 
if(livsTimer < 0 && s1.overlap){ //her mister man livet og timeren reseter
h.liv--;  
livsTimer = 60;}
println(h.liv);
//println(s1.overlap);
}

void keyPressed() {
  p.keyPress();
}

void keyReleased() {
  p.keyRelease();
}

void mousePressed(){
  
 g.origin = new PVector(mouseX,mouseY);
 g.r = mag(g.origin.x-(p.Pxpos), g.origin.y-(p.Pypos));
 g.angle = atan2(p.Pxpos-mouseX, p.Pypos-mouseY);
 grappleActive = true;
 println("waaah");
}

void mouseReleased(){
  grappleActive = false;
}
