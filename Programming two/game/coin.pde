class coin extends Sclass { // climber class

  coin(int x, int y)   // constructor
  {
    super(x, y);
    pic[1] = loadImage("coin1.png"); // to find and run the image
    pic[1].resize(10, 20); // to resize the image
    pic[2] = loadImage("coin2.png"); // to find and run the image
    pic[2].resize(10, 20); // to resize the image
    pic[3] = loadImage("coin3.png"); // to find and run the image 
    pic[3].resize(10, 20); // to resize the image
  }
}
