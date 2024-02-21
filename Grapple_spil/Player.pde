class Player { //Det her er spiller klassen
int Pxpos,Pypos, Pvel,Pacc;
boolean knapH, knapV;

Player(int xpos,int ypos,int vel,int acc){
Pxpos=xpos;
Pypos=ypos;
Pvel=vel;
Pacc=acc;
}

void drawPlayer(){
rect(Pxpos, Pypos, 50, 50); //tmp player
if (knapH==true){Pxpos=Pxpos+Pvel;Pvel=Pvel*Pacc;}
if (knapV==true){Pxpos=Pxpos-Pvel;}
}



void keyPress(){
if (keyCode == RIGHT) {
      knapH = true;
    } else if (keyCode == LEFT) {
      knapV = true;
    }
}
void keyRelease(){
if (keyCode == RIGHT) {
      knapH = false;
    } else if (keyCode == LEFT) {
      knapV = false;
    }
}
}
