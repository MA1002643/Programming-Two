class Bullet { // bullet class
  int x; // X position of the bullet
  int y; // y position of the bullet
  int dy = -8; // speed of the bullet

  PImage pic1; // this code is to call the image of the bullet

  Bullet(int x, int y) // bullet constructor
  {
    this.x=x; // X location inside the constructor
    this.y=y; // Y location inside the constructor

    pic1 = loadImage("bullet2.png"); // code to put find and run the image in the game
    pic1.resize(40, 80); // to resize the size of the image
  }
  void move () // for the bullet movement
  {
    y = y-dy; // code to make the bullet move downwards
  }

  void render() // code to create and show the bullet on screen
  {
    image(pic1, x, y); // to run the image and apply the y and x location of the image
  }

  void fired() // methods
  {
    render(); // render method
    move(); // move method
  }
}
