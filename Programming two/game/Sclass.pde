class Sclass {

  int x; // x axis in inheritence 
  float y; // y axis in inheritence 
  int speedx = 1; // speed of x axis
  int speedy = 2; // speed of y axis

  int counter = 0; // counter set 0 

  PImage[] pic = new PImage [4]; // this code is to call the image in inheritence

  Sclass(int x, int y) // inheritence constructor
  {
    this.x = x; // x location inside the constructor
    this.y = y; // y location inside the constructor
  }

  void render() // render method
  {
    if (counter > 0 & counter <5) // if statmeent for animation of climber/coin 
    {
      image(pic[1], this.x, this.y); // loading image and giving location positions
    } else if (counter > 5 & counter<15) // else if statement for animation of climber/coin 
    {
      image(pic[2], this.x, this.y); // loading image and giving location positions
    } else // else statement for animation of climber/coin
    {
      image(pic[3], this.x, this.y); // loading image and giving location position
    }

    counter = counter+1; // counter set to +1 
    if (counter>70) // if statement 
      counter=1; // counter set = to 1
  }

  void move () // code for movement
  {
    y = y - speedy; // to move the climber/ coin
  }

  void mamaster() // master method
  {
    render(); // render method
    move(); // move method
    wall(); // wall mwthod
  }

  boolean hit(Defender other) // boolean formula for the defender
  {
    return(abs(this.x-other.x ) <= 50 && abs(this.y - other.y)<= 100); // if defender collides with enemy it will end the game
  }

  boolean IsShot(Bullet other) // boolean formula for the bullet
  {
    return(abs(this.x - other.x )<= 25 && abs(this.y - other.y)<= 35); // if bullet collides with the enemy the enemy will dissapear
  }
  void wall () { // code for the wall
    if (this.y < 0) // if statement
    {
      y = height; // so if the cliber/coin hits the y axis then the climber will start again climbing the wall
    }
  }
}
