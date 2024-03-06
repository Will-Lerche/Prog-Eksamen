class Platform extends Overlap{
  
Platform(int xin, int yin, int hin, int bin){
  x = xin; y = yin; h = hin; b = bin;
  }
 void createBoks(){
 rect(x,y,b,h);
 if(overlap()){
// println(p.onGround);
 //p.onGround=true;
 }else{
 //p.onGround=false;
 }
 
 }

}
