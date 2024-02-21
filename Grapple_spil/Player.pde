class Player {
int Pxpos,Pypos, Pvel,Pacc;

Player(int xpos,int ypos,int vel,int acc){
Pxpos=xpos;
Pypos=ypos;
Pvel=vel;
Pacc=acc;
}

void drawPlayer(){
ellipse(xpos, ypos, 100, 100);
}

}
