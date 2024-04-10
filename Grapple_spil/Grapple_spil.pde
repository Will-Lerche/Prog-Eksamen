Player p;
Grappling g;
Spike s1;
Spike s2;
Spike s3;
Spike s4;
Spike s5;
Platform b1;
Platform b2;
Platform b3;
Platform b4;
Health h;
Animation a;
Coins c1;
Coins c2;
Coins c3;
Coins c4;
Coins c5;
Fjende f1;
Fjende f2;


int livsTimer = 60; // cirka hvert sekund (computer afhængigt)
int score = 0;
boolean started,reset=false;
boolean grappleActive = false;
boolean fjende1,fjende2;
PImage coinIcon;

void setup() {
  size(500, 500);
  resetAll();
  coinIcon = loadImage("pixil-frame-0 (1).png");
}

void resetAll(){
  livsTimer = 60; // cirka hvert sekund (computer afhængigt)
  score = 0;
  started = false;reset=false;
  grappleActive = false;
  p=new Player(new PVector(30, 380)); //laver et objekt "p" som er fra player klassen
  b1=new Platform(-300, 450, 500, 64);
  b2=new Platform(300, 400, 460, 64);
  b3=new Platform(990, 400, 150, 64);
  b4=new Platform(1600,450,50,64);
  s1=new Spike(250, 470, 60, 65);
  s2=new Spike(530, 370, 60,65);
  s3=new Spike(805, 470, 60, 65);
  s4=new Spike(870, 470, 60, 65);
  s5=new Spike(935, 470, 60, 65);
  h=new Health(15, 10);
  c1 = new Coins(-300, 400, 30, 30);
  c2 = new Coins(190, 400, 30, 30);
  c3 = new Coins(350, 350, 30, 30);
  c4 = new Coins(530, 320, 30, 30);
  c5 = new Coins(870, 380, 30, 30);
  f1 = new Fjende(-100,360,64,64);
  fjende1=false;
  f2 = new Fjende(300, 350, 64,64);
  fjende2 = false;
 
  a=new Animation("sprite.png",4,2,5,p.player.x,p.player.y);
}
void draw() {
  
  background(100);
  h.Hearts();
  text(score,450,40);
  image(coinIcon, 425, 27);
  //pushMatrix();

   translate((p.player.x*-1)+250,0.0);
   //popMatrix();
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
  s5.createSpike();
  c1.drawCoins();
  c2.drawCoins();
  c3.drawCoins();
  c4.drawCoins();
  c5.drawCoins();
  f1.fjendeCollison(b1.overlap,f1.x);
  if(p.player.x>f1.x && p.player.x<f1.x+50&& p.slag)fjende1=true;
  f2.fjendeCollison(b2.overlap,f2.x);
  if(p.player.x>f2.x && p.player.x<f2.x+50&& p.slag)fjende2=true;
 
  
  if (!fjende1)f1.createFjende();
  if (!fjende2)f2.createFjende();
  
 
  if (b1.overlap || b2.overlap|| b3.overlap|| b4.overlap) p.onGround = true; 
  else p.onGround = false;// hvis den overlapper så er onGround true ellers false
  if (s1.overlap  || f1.overlap) livsTimer--; //hvis man rammer spike så begynder en timer 
  if (livsTimer < 0 && s1.overlap  ) { //her mister man livet og timeren reseter
    h.liv--; 
    livsTimer = 60;
  }
   if (livsTimer < 0 && f1.overlap && !fjende1) { //her mister man livet og timeren reseter
    h.liv--; 
    livsTimer = 60;
  }
  
  //println(f1.overlap);
   
  if (h.liv<=0 || p.player.y>1000) resetAll();//started=false;


  

  }else { textSize(40); text("press to start",-100,250);
   if(mousePressed){
   started=true;
   h.liv=3;
 }
   
  }
    println(mouseX + p.player.x+250,mouseY,p.player.x+250);
    fill(255);
    ellipse(mouseX+p.player.x-250,mouseY,10,10);
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

  g = new Grappling();

  grappleActive = true;
  //println("waaah");
}

void mouseReleased() {
  grappleActive = false;
  p.acc.x *= g.aAcceleration;
}
