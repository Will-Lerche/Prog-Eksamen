class Fjende extends Overlap{
  float Fxpos, Fypos;

   Fjende(int xin, int yin) {
    x = xin; 
    y = yin; 
  }
  
  void createFjende(){
  rect(x, y, 64, 64); // fjende
   overlap();
  }
  
  
  void fjendeCollison(boolean blok,int fx){
  if(blok && p.player.x<fx) fx--; //hvis en spiller er på blok x og player har højere x værdi 
 if(blok && p.player.x>fx) fx++;
  }
}
