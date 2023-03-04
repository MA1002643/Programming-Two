class Defender { // defender class

  int x; // x position of the Defender
  int y = 20; // y position of the Defender
  int dx =10 ; // speed on x axis

  PImage Image1; // this code is to put the image of the bullet

  Defender(int x, int y) { // constructors
    this.x = 480; // x position inside the constructor
    this.y = 100; // y position inside the constructor

    Image1 = loadImage("Knightcartoon.png"); // code to find and run the image in the backgroud
    Image1.resize(200, 200); //set image to be same size as the canvas
  }

  void render() { //render function

    imageMode(CENTER); // image mode set to center
    image(Image1, x, y); // to run the image and apply the y and x location of the image
  }

  void limitation()  // limitation function
  {
    if (this.x < 0 ) // if statement
    {
      x = 0; // when x become greather than 0 it takes it back to 0
    }
    if (this.x > width) // if statement
    {
      x = width; // when it try to go to off the screen it doesn't let the defender go off the screen
    }
  }

  void momaster () {  // master method
    render(); // render method
    limitation(); // limitation method
  }
}  // end class
