class Overlap{
  //Koordinat, højde og bredde til objektet
  int x; int y; int h; int b;
  //Henter koordinaterne, højden og bredden for objektet der bruger klassen
  Overlap(){
 
  }
  boolean overlap(){
  //variabel, som ændres hvis der er overlap
  boolean overlap = false;
  
  //tjekker om der er overlap mellem spilleren og alle objekter som klassen nedarver til. 
  //Variablen (boolean) ændres derefter til true for at vise der er overlap
  if(p.b > x && p.Pypos + p.h > y && p.Pxpos < x + b && p.Pypos < y + h){
  overlap = true;}
  
  return overlap;
  }
}
