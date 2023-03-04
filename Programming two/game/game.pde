int x; // this code is for the x axis
int y; // this code is for the y axis

boolean End = false;// boolean end statement
String gameStage; // this will call different stages of the game

PImage backimage; // this code is to put the background

Climber attacker1; // this creates a climber
Defender killer1; // this creates a defender
coin coin1; // this creates a coin 

ArrayList<Climber>climberrow; // code for Climber Array
ArrayList<Bullet>bulletrow; // code for Bullet Array
ArrayList<coin>coinrow; // code for coin Array

int gamewin = 12; // int set for game win score

void setup() // setup for the game
{
  gameStage = "START"; // start stage of the game
  backimage = loadImage("Backgroud.jpg"); // loading the background image to the game
  backimage.resize(width, height); // code to resize the height and width of the background image
  size(1500, 1000); // canvas size

  climberrow = new ArrayList <Climber>(); // to make the array list for climber function
  bulletrow = new ArrayList <Bullet>(); // to make the array list for bullet function
  killer1 = new Defender (width/5, height/10); // this is to create a defender to a specific size

  climberrow.add(new Climber(height/4, width/4)); // to show fist climber on screen
  climberrow.add(new Climber(height/3, width)); // to show second climber on screen
  climberrow.add(new Climber(height, width)); // to show third climber on screen
  climberrow.add(new Climber(height/2, width/2)); // to show fourth climber on screen
  climberrow.add(new Climber(height/5, width)); // to show fifth climber on screen
  climberrow.add(new Climber(height/8, width)); // to show sixth climber on screen

  coinrow = new ArrayList <coin>(); // make the array list for coin function

  coinrow.add(new coin(height, width/7)); // to show first coin on the screen
  coinrow.add(new coin(height, width/3)); // to show second coin on the screen
  coinrow.add(new coin(height/10, width/10)); // to show third coin on the screen
  coinrow.add(new coin(height/1, width)); // to show fourth coin on the screen
  coinrow.add(new coin(height, width/5)); // to show fifth coin on the screen
  coinrow.add(new coin(height/2, width)); // to show sixth coin on the screen
}

int killpoint = 0; // integer that shows kill point set to 0 when the game starts

void draw () // draw function
{
  clearBackground(); // clearBackground call called in draw 
  if (gameStage == "START") {  // start stage of game  
    startGame(); // starting the game function
  } else if (gameStage == "PLAY") { // play stage of the game 
    playGame(); // play game function
  } else if (gameStage == "GAME OVER") { // game over stage of the game
    gameOver(); // game over function
  }
}

void startGame() { // start game function called 
  textAlign(CENTER); // text alignment set to center
  textSize(18); // first text size
  fill(255, 0, 0); // the fill color for first text 
  text("Click Anywhere to Play!", width/2, height/2); // text that will be displayed on the screen with location where it will be displayed
  textSize(14); // second text size
  fill(0, 0, 255); // the fill color for second text 
  text("To win get 12 points\nIf climber hits you then game is over", width/2, height/2+40); // text that will be displayed on the screen with location where it will be displayed 

  if (mousePressed == true) { // if statement for mouse pressed
    gameStage = "PLAY"; // if mouse pleassed then moving to the playing game stage
  }
}

void playGame() { // play game stage
  image(backimage, width/2, height/2); // this is to put the image in the background and size the image
  killer1.momaster(); // master function for the defender

  for (Climber first : climberrow) // for loop for the climber
  {
    first.mamaster(); // master class used in inheritence
  }

  for (int attack = climberrow.size()-1; attack >= 0; attack--) // this checks for both of the arrays
  {
    Climber first = climberrow.get(attack); // this gets only one array in the cosideration
    for (int bal = bulletrow.size()-1; bal >= 0; bal--) // this code will look over the bullet array
    {
      Bullet second = bulletrow.get(bal); // this will have one of the bullet in the bulletarray
      if (first.IsShot(second)) // this will check if the climber has been shot or not
      {
        climberrow.remove(attack); // if the climber is been shot then it will be taken off the arraylist
        killpoint = killpoint + 3; // if the climber is shot it will add 3 point to the score variable
        bulletrow.remove(bal); // once the bullet come in contact with the climber it will also take the bullet off the array
        //climberlist.add(new Climber(random(-900,900), first.y + + (int)  random(x,y) )); // if the climber get shot for the climber to re appear from another point
      }
    }
  }

  for (coin first : coinrow)  // for loop for the coin 
  {
    first.mamaster(); // master class used in inheritence
  } 

  for (int attack = coinrow.size()-1; attack >= 0; attack--) // this checks for both of the arrays
  {
    coin first = coinrow.get(attack); // this gets only one array in the cosideration
    for (int bal = bulletrow.size()-1; bal >= 0; bal--) // this code will look over the bullet array
    {
      Bullet second = bulletrow.get(bal); // this will have one of the bullet in the bullet array
      if (first.IsShot(second)) // this will check if the coin has been shot or not 
      {
        coinrow.remove(attack); // if the coin is been shot then it will be taken off the arraylist
        killpoint = killpoint + 3; // if the coin is shot it will add 3 point to the score variable
        bulletrow.remove(bal); // once the bullet come in contact with the coin it will also take the bullet off the array
        //coinlist.add(new Climber(random(-900,900), first.y + + (int)  random(x,y) )); // if the coin get shot for the coin to re appear from another point
      }
    }
  }

  if (killpoint == gamewin) { // if statement to say if 12 points are gained
    End(); // if 12 points are gained then gameover sacreen will appear
  }
  text("score : "+killpoint+" point", width/2, height -20); // this is so if the bullet hits the climber the score will go up by 3 points
  fill (255, 204, 0); // this is the colour of the text
  textSize(40); // this is the text size that displays the code

  for (Bullet first : bulletrow) // this is the loop for the arraylist
  {
    first.fired(); // this code has the job to display the bullet when the key for the bullet is pressed
  }

  for (int attack = 0; attack<climberrow.size(); attack++) // this for loop is to check if the bullet had any contact with the climber or not
  {
    if (climberrow.get(attack).hit(killer1)) // this if statement is to have a look if the climber has crashed into the defender or not
    {
      gameOver();// if the climber crashes into the defender then the screen will show game over text
    }
  }

  for (int attack = 0; attack<coinrow.size(); attack++) // this for loop is to check if the bullet had any contact with the coin or not
  {
    if (coinrow.get(attack).hit(killer1)) // this if statement is to have a look if the coin has crashed into the defender or not
    {
      gameOver(); // if the climber crashes into the defender then the screen will show game over text
    }
  }
}

void gameOver() { // game over function

  End(); // end function called in gameOver
  drawReplyButton(); // drawReplyButton called in gameOver
  killpoint =0; // kill set to 0 so when the game is over killpoint will reset
}

void clearBackground() { // clearBackground function
  fill(255); // fill color for background
  rect(0, 0, width, height); // rectangle shape
}

void keyPressed() // void KeyPressed function
{
  if (key == CODED) // if statement
  {
    if (keyCode == LEFT) // code for pressing the left key
    {
      killer1.x = killer1.x - 5; // code to determine if the left key is pressed what will happen
    }
    if (keyCode == SHIFT) // code for pressing the shift key
    {
      bulletrow.add(new Bullet(killer1.x, killer1.y)); // code to determine if the shift key is pressed what will happen
    }
    if (keyCode == RIGHT) // code for pressing the right key
    {
      killer1.x = killer1.x + 5; // code to determine if the right key is pressed what will happen
    }
  }
}

void End() // end function
{
  clear(); // this code is to get a black background behind my text
  textSize(60); // the text size is set to 60
  fill(255); // the text colour is set to white
  text("GAME OVER!", width/2, height/2); // this is the text and size of the text that will be displayed
  drawReplyButton(); // draw reply button called inside end
}

void drawReplyButton() { // for creating a reply button on the end screen
  fill(100); // fill color for text
  rect(width/2-50, height/2+80, 100, 60); // rectangle size and position of it
  fill(0, 255, 0); // fill color for text 
  textSize(36); // text size 
  text("PLAY", width/2, height/2+122); // text and position of it

  float leftEdge = width/2 -50; // try to create button which is not working it come on the screen but when i click on the button nothing happens
  float rightEdge = width/2 -50 + 100;
  float topEdge = height/2 + 80;
  float bottomEdge = height/2 + 80 + 60;
  if (mousePressed == true &&
    mouseX > leftEdge &&
    mouseX < rightEdge &&
    mouseY > topEdge &&
    mouseY < bottomEdge &&
    End == true
    ) {
    gameStage = "PLAY";
  }
}
