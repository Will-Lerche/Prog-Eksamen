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
    r = mag(origin.x-(p.Pxpos), origin.y-(p.Pypos));
    angle = atan2(p.Pxpos-mouseX, p.Pypos-mouseY); 

    aVelocity = 0.0;
    aAcceleration = 0.0;
    damping = 0.995;   // Arbitrary damping
    
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
    line(origin.x, origin.y, p.Pxpos+25, p.Pypos+25);
    ellipseMode(CENTER);
    fill(255);
    if (dragging) fill(0);
    // Draw the ball
    p.Pxpos = position.x; 
    p.Pypos = position.y;
  }
}
