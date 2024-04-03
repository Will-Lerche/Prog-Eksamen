Player p;
Pendulum g;
Spike s1;
Platform b1;
Platform b2;
Health h;
Animation a;
Coins c1;

int livsTimer = 60; // cirka hvert sekund (computer afhængigt)
int score = 0;
boolean started,reset=false;

boolean grappleActive = false;



void setup() {
  size(500, 500);
  resetAll();
}

void resetAll(){
  livsTimer = 45; // cirka hvert sekund (computer afhængigt)
  score = 0;
  started = false;reset=false;
  grappleActive = false;
 p=new Player(new PVector(30, 380)); //laver et objekt "p" som er fra player klassen
  b1=new Platform(10, 430, 64, 500);
  b2=new Platform(120, 430, 64, 64);
  s1=new Spike(120, 420, 64, 164);
  h=new Health(15, 10);
  a=new Animation();
  c1 = new Coins(200, 350, 30, 30);

  a.AnimationSetup();

}
void draw() {
  background(100);
  h.Hearts();
  translate((p.player.x*-1)+250,0.0);
  if (started){
    reset=true;
  if (grappleActive) g.go();

  a.Animater(); //player animeres
  p.drawPlayer();  // player tegnes
  if (grappleActive) g.go(); // Grapllinghook laves, hvis den er aktiveret

  b1.createBoks();
  b2.createBoks();
  s1.createSpike();

  
  //println(h.liv);

  if (b1.overlap || b2.overlap) p.onGround = true; 
  else p.onGround = false;// hvis den overlapper så er onGround true ellers false
  if (s1.overlap) livsTimer--; //hvis man rammer spike så begynder en timer 
  if (livsTimer < 0 && s1.overlap) { //her mister man livet og timeren reseter
    h.liv--; 
    livsTimer = 60;
  }
  if (h.liv<=0) resetAll();//started=false;

 


  c1.drawCoins();

  }else { textSize(40); text("press to start",-100,250);
   if(mousePressed){
   started=true;
   h.liv=3;
 }
   
  }
}

void keyPressed() {
  if (!grappleActive) {
    p.keyPress();
    a.animationtryk();
  } else { 
    g.keyPress();
    p.keyRelease();
  }
}

void keyReleased() {
  if (!grappleActive) {
    p.keyRelease();
  } else { 
    g.keyRelease();
  }
}

void mousePressed() {

  g = new Pendulum(new PVector(width/2, 0), 175);

  grappleActive = true;
  //println("waaah");
}

void mouseReleased() {
  grappleActive = false;
}
