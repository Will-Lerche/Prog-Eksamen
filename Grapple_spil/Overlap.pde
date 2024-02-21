class Overlap{
  //Koordinat, højde og bredde
  int x; int y; int h; int b;
  //Henter koordinaterne, højden og bredden for objektet der bruger klassen
  Overlap(int xin, int yin, int hin, int bin){
  x = xin; y = yin; h = hin; b = bin;
  }
  boolean overlap(){
  //variabel, som ændres hvis der er overlap
  boolean overlap = false;
  
  if(p.b > x && p.y + p.h > y && p.x < x + b){
  overlap = true;}
  
  return overlap;
  }
}
