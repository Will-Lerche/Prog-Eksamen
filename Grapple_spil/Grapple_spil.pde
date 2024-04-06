Player p;
Pendulum g;
Spike s1;
Platform b1;
Platform b2;
Platform b3;
Platform b4;
Health h;
Animation a;
Coins c1;
Fjende f1;


int livsTimer = 60; // cirka hvert sekund (computer afhængigt)
int score = 0;
boolean started,reset=false;

boolean grappleActive = false;

PImage coinIcon;

void setup() {
  size(500, 500);
  resetAll();
  coinIcon = loadImage("pixil-frame-0 (1).png");
}

void resetAll(){
  livsTimer = 45; // cirka hvert sekund (computer afhængigt)
  score = 0;
  started = false;reset=false;
  grappleActive = false;
  p=new Player(new PVector(30, 380)); //laver et objekt "p" som er fra player klassen
  b1=new Platform(10, 430, 200, 64);
  b2=new Platform(500, 430, 64, 64);
  s1=new Spike(260, 420, 64, 64);
  h=new Health(15, 10);
  c1 = new Coins(200, 350, 30, 30);
  f1 = new Fjende(20,380);
  b3 = new Platform(600,350,75,64);
  b4 = new Platform(800,400,50,64);
  a=new Animation();
  a.AnimationSetup();

}
void draw() {
  background(100);
  h.Hearts();
  text(score,450,40);
  image(coinIcon, 425, 27);
   pushMatrix();

   translate((p.player.x*-1)+250,0.0);
   popMatrix();
  
  if (started){
    reset=true;
  if (grappleActive) g.go(); // Grapllinghook laves, hvis den er aktiveret
  a.Animater(); //player animeres
  p.drawPlayer();  // player tegnes
 

  b1.createBoks();
  b2.createBoks();
  b3.createBoks();
  b4.createBoks();
  s1.createSpike();
  f1.createFjende();

  
  //println(h.liv);
 
  if (b1.overlap || b2.overlap|| b3.overlap|| b4.overlap) p.onGround = true; 
  else p.onGround = false;// hvis den overlapper så er onGround true ellers false
  if (s1.overlap) livsTimer--; //hvis man rammer spike så begynder en timer 
  if (livsTimer < 0 && s1.overlap) { //her mister man livet og timeren reseter
    h.liv--; 
    livsTimer = 60;
  }
  
   
  if (h.liv<=0) resetAll();//started=false;

f1.fjendeCollison(b1.overlap,f1.x);

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

  g = new Pendulum();

  grappleActive = true;
  //println("waaah");
}

void mouseReleased() {
  grappleActive = false;
}
