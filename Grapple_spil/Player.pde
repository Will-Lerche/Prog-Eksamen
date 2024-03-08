class Player { //Det her er spiller klassen
float Pxpos,Pypos, Pvel,Pacc;
float b=50,h=50;
boolean knapH, knapV, knapJ, onGround;

Player(float xpos,float ypos,float vel,float acc){
Pxpos=xpos; 
Pypos=ypos;
Pvel=vel;
Pacc=acc;
}

void drawPlayer(){
rect(Pxpos, Pypos, 50, 50); //tmp player
if (knapH==true){Pxpos=Pxpos+Pvel;Pvel=Pvel*Pacc;} //giver spilleren acceleration og lader ham gå til højre
if (knapV==true){Pxpos=Pxpos-Pvel;Pvel=Pvel*Pacc;} //samme som over bare til venstre
if (Pvel>15){Pvel=15;} //capper velocitien
if (knapH==false && knapV==false){Pvel=2;} //reseter velocity hvis man ikke bevæger sig


if (!onGround){ //hvis man ikke er on Ground så falder ma ned
Pypos=Pypos+1;
}
if(onGround && knapJ){ //hvis man hopper imens han er på ground så hopper han
Pypos=Pypos-40;}

}



void keyPress(){ //bevæger spilleren
if (keyCode == RIGHT) {
      knapH = true;
    } else if (keyCode == LEFT) {
      knapV = true;
    }
      else if (keyCode==UP){
      knapJ = true;
      }
}
void keyRelease(){ //stopper spillerens bevægelse
if (keyCode == RIGHT) {
      knapH = false;
    } else if (keyCode == LEFT) {
      knapV = false; 
    }
      else if (keyCode==UP){
      knapJ = false;
      }
}
}
