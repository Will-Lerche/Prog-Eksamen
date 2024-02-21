class Player { //Det her er spiller klassen
int Pxpos,Pypos, Pvel,Pacc;
boolean knapH, knapV;

Player(int xpos,int ypos,int vel){
Pxpos=xpos;
Pypos=ypos;
Pvel=vel;
}

void drawPlayer(){
ellipse(Pxpos, Pypos, 100, 100); //tmp player
}

}

void keyPressed(){
if (keyCode == RIGHT) {
      knapH = true;
    } else if (keyCode == LEFT) {
      knapV = true;
    }
}
