Player p;
Grappling g;
Spike s1;
Spike s2;
Spike s3;
Spike s4;
Spike s5;
Spike s6;
Platform b1;
Platform b2;
Platform b3;
Platform b4;
Platform b5;
Health h;
Coins c1;
Coins c2;
Coins c3;
Coins c4;
Coins c5;
Coins c6;
Coins c7;
Coins c8;
Coins c9;
Coins c10;
Fjende f1;
Fjende f2;


int livsTimer = 60; // cirka hvert sekund (computer afhængigt)
int score = 0;
boolean started,reset=false;
boolean grappleActive = false;
boolean fjende1,fjende2;
PImage coinIcon;
boolean win;

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
  b3=new Platform(990, 400, 300, 64);
  b4=new Platform(1600, 450, 500, 64);
  b5=new Platform(2450, 450, 500, 64);
  s1=new Spike(250, 470, 60, 65);
  s2=new Spike(530, 370, 60, 65);
  s3=new Spike(805, 470, 60, 65);
  s4=new Spike(870, 470, 60, 65);
  s5=new Spike(935, 470, 60, 65);
  s6=new Spike(1635, 420, 60, 65);
  h=new Health(15, 10);
  c1 = new Coins(-300, 400, 30, 30);
  c2 = new Coins(190, 400, 30, 30);
  c3 = new Coins(350, 350, 30, 30);
  c4 = new Coins(530, 320, 30, 30);
  c5 = new Coins(870, 380, 30, 30);
  c6 = new Coins(1450, 370, 30, 30);
  c7 = new Coins(1635, 380, 30, 30);
  c8 = new Coins(2275, 400, 30, 30);
  c9 = new Coins(2550, 400, 30, 30);
  c10 = new Coins(3000, 400, 30, 30);
  f1 = new Fjende(-100,360,64,64);
  fjende1=false;
  f2 = new Fjende(300, 350, 64,64);
  fjende2 = false;
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
  p.drawPlayer();  // player tegnes
 

  b1.createBoks();
  b2.createBoks();
  b3.createBoks();
  b4.createBoks();
  b5.createBoks();
  s1.createSpike();
  s2.createSpike();
  s3.createSpike();
  s4.createSpike();
  s5.createSpike();
  s6.createSpike();
  c1.drawCoins();
  c2.drawCoins();
  c3.drawCoins();
  c4.drawCoins();
  c5.drawCoins();
  c6.drawCoins();
  c7.drawCoins();
  c8.drawCoins();
  c9.drawCoins();
  c10.drawCoins();
  f1.fjendeCollison(b1.overlap,f1.x);
  f2.fjendeCollison(b2.overlap,f2.x);

 
  
  if (!fjende1)f1.createFjende();
  if (!fjende2)f2.createFjende();
  println(fjende2);
 
  if (b1.overlap || b2.overlap|| b3.overlap|| b4.overlap|| b5.overlap) p.onGround = true; 
  else p.onGround = false;// hvis den overlapper så er onGround true ellers false
  
  if (s1.overlap  ||s2.overlap||s3.overlap||s4.overlap||s5.overlap||s6.overlap|| f1.overlap||f2.overlap) livsTimer--; //hvis man rammer spike så begynder en timer
  
  if (livsTimer < 0 && s1.overlap || livsTimer < 0 && s2.overlap||livsTimer < 0 && s3.overlap ||livsTimer < 0 && s4.overlap ||livsTimer < 0 && s5.overlap ) { //her mister man livet og timeren reseter
    h.liv--; 
    livsTimer = 60;
  }
   if (livsTimer < 0 && f1.overlap && !fjende1||livsTimer < 0 && f2.overlap && !fjende2) { //her mister man livet og timeren reseter
    h.liv--; 
    livsTimer = 60;
  }
  
  //println(f1.overlap);
   
  if (h.liv<=0 || p.player.y>1000) resetAll();//started=false;
  if (score==10){
  win=true;
  resetAll();
  }else{ 
  win=false;
}

  

  }else if(win){
   textSize(40);text("You Won! press to start again",-215,250);
   if(mousePressed){
   started=true;
   h.liv=3;
 }
  }
  else { textSize(40); text("press to start",-100,250);
   textSize(15);text("A for left, D for right, W for jump, SPACE for attack, click for grapple",-180,150);
   textSize(20);text("To win get 10 coins",-80,350);textSize(40);
   if(mousePressed){
   started=true;
   h.liv=3;
 }
   
  }
  
    fill(255);
    ellipse(mouseX+p.player.x-250,mouseY,10,10);
}

void keyPressed() {
  if (!grappleActive) {
    p.keyPress();
  } else { 
    g.keyPress();
    p.knapH = false; p.knapV = false; p.knapJ = false;
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
