Player p;

void setup(){
p=new Player(20,20,2,1.02);
size(500,500);
}

void draw(){
  background(100);
p.drawPlayer();
//if (p.knapV==true){println("hej");}
//if (p.knapV==false){println("x");}
}

void keyPressed() {
  p.keyPress();
}

void keyReleased() {
  p.keyRelease();
}
