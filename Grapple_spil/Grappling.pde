class Pendulum {

  PVector position;    // position of pendulum ball
  PVector origin;      // position of arm origin
  float r;             // Length of arm
  float angle;         // Pendulum arm angle
  float aVelocity;     // Angle velocity
  float aAcceleration; // Angle acceleration

  float ballr;         // Ball radius
  float damping;       // Arbitary damping amount

  boolean dragging = false;

  // This constructor could be improved to allow a greater variety of pendulums
  Pendulum(PVector origin_, float r_) {
    // Fill all variables
   
    position = new PVector();
   
    origin = new PVector(mouseX,mouseY);
    r = mag(origin.x-(p.player.x), origin.y-(p.player.y));
    angle = atan2(p.player.x-mouseX, p.player.y-mouseY);
    aVelocity = 0.0;
    aAcceleration = 0.0;
    damping = 0.995;   // Arbitrary damping
    ballr = 48.0;      // Arbitrary ball radius
  }

  void go() {
    update();
    //drag();    //for user interaction
    display();
  }

  // Function to update position
  void update() {
    // As long as we aren't dragging the pendulum, let it swing!
    if (!dragging) {
      float gravity = 0.4;                              // Arbitrary constant
      aAcceleration = (-1 * gravity / r) * sin(angle);  // Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)
      if(p.onGround){aVelocity = 0.0;}else{
      aVelocity += aAcceleration;                 // Increment velocity
      aVelocity *= damping;                       // Arbitrary damping
      angle += aVelocity;                         // Increment angle
    }}
  }

  void display() {
    position.set(r*sin(angle), r*cos(angle), 0);         // Polar to cartesian conversion
    position.add(origin);                              // Make sure the position is relative to the pendulum's origin

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
}
