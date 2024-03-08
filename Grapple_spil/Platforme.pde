class Platform extends Overlap{
  
Platform(int xin, int yin, int hin, int bin){
  x = xin; y = yin; h = hin; b = bin;
  }
 void createBoks(){
 rect(x,y,b,h);
 overlap();
 
 
 }

}
