class Grappling {

  PVector position;    // Spiller position
  PVector origin;      // Der var grappling hook rammer
  float r;             // Distance fra origin til spiller
  float angle;         // Vinklen på rebet til grappling hook
  float aVelocity;     // Vinkel acceleration
  float aAcceleration; // Vinkel acceleration

  float damping;
  Boolean knapJ = false;
  Boolean knapN = false;


 
  Grappling() {

    position = new PVector();
    //kompensation for translate af koordinatsystem
    //mouseX 
    //skal erstatters med
    //mouseX + p.player.x -250
    float nyMousex = mouseX + p.player.x -250;
    origin = new PVector(nyMousex, mouseY);
    r = mag(origin.x-(p.player.x), origin.y-(p.player.y));
    angle = atan2(p.player.x-nyMousex, p.player.y-mouseY);
    aVelocity = 0.0;
    aAcceleration = 0.0;
    damping = 0.995;   // Hvor meget kraft spilleren mister når den svinger
  }

  void go() {
    update();
    display();
  }

  // Funktionen, som hele tiden opdaterer positionen på spiller
  void update() {
      float gravity = 0.5;                              // konstanten gravity
      aAcceleration = (-1 * gravity / r) * sin(angle);  // Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)
      
      if (p.onGround) {
        aVelocity = 0.0;
      } else {
        aVelocity += aAcceleration;                     // ligger acceleariotionen til velocity
        aVelocity *= damping;                           // ganger med damping, så man tager noget kraft af
        angle += aVelocity;                             // ligger til vinklen for at få opdaterede position
     
      if (knapJ && r>1) r += -1;
      if (knapN && !p.onGround) r++;
    }
  }

  void display() {
    position.set(r*sin(angle), r*cos(angle), 0);         // udregner positionerne for spilleren med cos og sin til vinkel gange radius
    position.add(origin);                              // lægger origin til for at gøre så koordinaterne er baseret på det

    stroke(0);
    strokeWeight(2);
    // Draw the arm
    line(origin.x, origin.y, p.player.x+25, p.player.y+25);
    ellipseMode(CENTER);
    fill(255);
    if (dragging) fill(0);
    // Draw the ball
    p.player = position;
  }

  void keyPress() {
    if (keyCode=='W') {
      knapJ = true;
     } else if (keyCode=='S') {
      knapN = true;
     }
     
     if (keyCode=='A') {
      angle -= 0.05;
     } else if (keyCode=='D') {
      angle += 0.05;
     }
  }
  void keyRelease() {
    if (keyCode=='W') {
      knapJ = false;
    }
    if (keyCode=='S') {
      knapN = false;
    }
  }
}
