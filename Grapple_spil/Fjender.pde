class Fjende extends Overlap{
  float Fxpos, Fypos;

   Fjende(int xin, int yin, int hin, int bin) {
    x = xin; 
    y = yin; 
    h=hin;
    b=bin;
  }
  
  void createFjende(){
  rect(x, y, h, b); // fjende
   overlap();
  }
  
  
  void fjendeCollison(boolean blok,int fx){
  if(blok && p.player.x<fx) x=x-1;//hvis en spiller er på blok x og player har højere x værdi 
 if(blok && p.player.x>fx) x=x+1;
  }
  
}
