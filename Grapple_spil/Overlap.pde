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

     if(p.Pxpos>x && p.Pxpos<x+b && p.Pypos>y&& p.Pypos<y+h || //checker hvert hjørne om den rammer et af de andre objekter
        p.Pxpos+p.b>x && p.Pxpos<x+b && p.Pypos>y&& p.Pypos<y+h||
        p.Pxpos>x && p.Pxpos<x+b && p.Pypos>y+p.h&& p.Pypos<y+h||
        p.Pxpos+p.b>x && p.Pxpos<x+b && p.Pypos+p.h>y&& p.Pypos<y+h){
  overlap = true;}else{overlap=false;}

  return overlap;
  }
}
