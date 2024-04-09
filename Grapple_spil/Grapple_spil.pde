Player p;
Pendulum g;
Spike s1;
Spike s2;
Spike s3;
Spike s4;
Platform b1;
Platform b2;
Platform b3;
Platform b4;
Health h;
Animation a;
Coins c1;
Coins c2;
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
  b1=new Platform(-300, 450, 1000, 64);
  b2=new Platform(970, 450, 250, 64);
  b3=new Platform(1200, 450, 150, 64);
  b4=new Platform(1600,450,50,64);
  s1=new Spike(740, 470, 60, 65);
  s2=new Spike(805, 470, 60, 65);
  s3=new Spike(870, 470, 60, 65);
  s4=new Spike(935, 470, 60, 65);
  h=new Health(15, 10);
  c1 = new Coins(620, 420, 30, 30);
  c2 = new Coins(835, 390, 30, 30);
  f1 = new Fjende(40,380);
  
 
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
  s2.createSpike();
  s3.createSpike();
  s4.createSpike();
 
  f1.createFjende();

  
  //println(h.liv);
 
  if (b1.overlap || b2.overlap|| b3.overlap|| b4.overlap) p.onGround = true; 
  else p.onGround = false;// hvis den overlapper så er onGround true ellers false
  if (s1.overlap) livsTimer--; //hvis man rammer spike så begynder en timer 
  if (livsTimer < 0 && s1.overlap) { //her mister man livet og timeren reseter
    h.liv--; 
    livsTimer = 60;
  }
  
   
  if (h.liv<=0 || p.player.y>600) resetAll();//started=false;

  f1.fjendeCollison(b1.overlap,f1.x);

  c1.drawCoins();
  c2.drawCoins();

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
  p.acc.x *= g.aAcceleration;
}
