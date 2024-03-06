class Player extends Overlap{ //Det her er spiller klassen
float Pxpos,Pypos, Pvel,Pacc;
boolean knapH, knapV, knapJ, onGround;

Player(float xpos,float ypos,float vel,float acc){
Pxpos=xpos; 
Pypos=ypos;
Pvel=vel;
Pacc=acc;
}

void drawPlayer(){
  overlap();
rect(Pxpos, Pypos, 50, 50); //tmp player
if (knapH==true){Pxpos=Pxpos+Pvel;Pvel=Pvel*Pacc;} //giver spilleren acceleration
if (knapV==true){Pxpos=Pxpos-Pvel;Pvel=Pvel*Pacc;}
if (Pvel>15){Pvel=15;}
if (knapH==false && knapV==false){Pvel=2;}
println(onGround);
if (overlap()){onGround=true;}
if (!onGround){
Pypos=Pypos+2;
}
if (knapJ==true){Pypos=Pypos-10;} //slet
if(onGround){
if (knapJ==true){Pypos=Pypos-10;}
}
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
