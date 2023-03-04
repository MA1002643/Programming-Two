class Climber extends Sclass { // climber class


  Climber(int x, int y)   // constructor
  {
    super(x, y);
    pic[1] = loadImage("name1.png"); // to find and run the image
    pic[1].resize(100, 200); // to resize the image
    pic[2] = loadImage("name2.png"); // to find and run the image 
    pic[2].resize(100, 200); // to resize the image
    pic[3] = loadImage("name3.png"); //  to resize the image
    pic[3].resize(100, 200); //  to resize the image
  }
}
