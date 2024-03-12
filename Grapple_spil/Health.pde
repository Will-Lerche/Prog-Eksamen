class Health{
PImage hjerte; 
int hx,hy;
int liv=3;

Health(int Hxpos,int Hypos){
hx=Hxpos;
hy=Hypos;
}


void Hearts(){
//int billed=loadImage;
if (liv==3){rect(hx,hy,10,10);rect(hx+10,hy,10,10);rect(hx+20,hy,10,10);}
if (liv==2){rect(hx,hy,10,10);rect(hx+10,hy,10,10);}
if (liv==1){rect(hx,hy,10,10);}

}

}
