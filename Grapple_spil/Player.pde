class Player { //Det her er spiller klassen
float Pxpos,Pypos, Pvel,Pacc;
boolean knapH, knapV;

Player(float xpos,float ypos,float vel,float acc){
Pxpos=xpos;
Pypos=ypos;
Pvel=vel;
Pacc=acc;
}

void drawPlayer(){
rect(Pxpos, Pypos, 50, 50); //tmp player
if (knapH==true){Pxpos=Pxpos+Pvel;Pvel=Pvel*Pacc;}
if (knapV==true){Pxpos=Pxpos-Pvel;Pvel=Pvel*Pacc;}
if (knapH==true||)
if (Pvel>15){Pvel=2;}
}



void keyPress(){ //bevæger spilleren
if (keyCode == RIGHT) {
      knapH = true;
    } else if (keyCode == LEFT) {
      knapV = true;
    }
}
void keyRelease(){ //stopper spillerens bevægelse
if (keyCode == RIGHT) {
      knapH = false;
    } else if (keyCode == LEFT) {
      knapV = false; 
    }
}
}
