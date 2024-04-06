class Fjende extends Overlap{
  float Fxpos, Fypos;

   Fjende(int xin, int yin) {
    x = xin; 
    y = yin; 
  }
  
  void createFjende(){
  rect(x, y, 50, 50); // fjende
   overlap();
  }
  
  
}
