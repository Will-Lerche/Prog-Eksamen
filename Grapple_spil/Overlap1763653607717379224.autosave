class Overlap{
  //Koordinat, højde og bredde til objektet
  int x; float y; int h; int b;
  //Henter koordinaterne, højden og bredden for objektet der bruger klassen
    boolean overlap = false;

  
  Overlap(){
 
  }
  boolean overlap(){
  //variabel, som ændres hvis der er overlap

  //tjekker om der er overlap mellem spilleren og alle objekter som klassen nedarver til. 
  //Variablen (boolean) ændres derefter til true for at vise der er overlap

     if(p.player.x>x && p.player.x<x+b && p.player.y>y&& p.player.y<y+h || //checker hvert hjørne om den rammer et af de andre objekter
        p.player.x+p.b>x && p.player.x<x+b && p.player.y>y&& p.player.y<y+h||
        p.player.x>x && p.player.x<x+b && p.player.y>y+p.h&& p.player.y<y+h||
        p.player.x+p.b>x && p.player.x<x+b && p.player.y+p.h>y&& p.player.y<y+h){
  overlap = true;}else{overlap=false;}

  return overlap;
  }
}
