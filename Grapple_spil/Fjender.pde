class Fjende extends Overlap{

  Animation ea;

   Fjende(int xin, int yin, int hin, int bin) {
    x = xin; 
    y = yin; 
    h=hin;
    b=bin;
    ea = new Animation("spritesheetvolt_run.png",5,2,5,x,y);
  }
  
  void createFjende(){
    
  
   overlap();
   ea.x = x;
   ea.y = y;
   ea.Animater();
  }
  
  
  void fjendeCollison(boolean blok,float fx){
  if(blok && p.player.x<fx) {x=x-1; ea.reverseFactor = -1;}//hvis en spiller er på blok x og player har højere x værdi 
 if(blok && p.player.x>fx) {x=x+1; ea.reverseFactor = 1;}
  }
  
}
