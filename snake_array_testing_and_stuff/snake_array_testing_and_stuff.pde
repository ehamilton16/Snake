#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

int snakeX = 0;    // create variables for snake
int snakeY = 0;
int appleX = 0;    // create variables for dot
int appleY = 0;

boolean appleEat = true;  // if u eat apples

byte score = 1;  // light up the top

int direction = 0;    //directional variable 

int eatenApples = 1; // track how many apples eaten (for the score indicator)

/* vvv this is for the snake line vvv */

int tail = 4;

struct Point // name for the class
{
  int x;
  int y;
};

Point s1 = {snakeX,snakeY};  //making points
Point s2 = {4,4};
Point s3 = {5,4};
Point s4 = {6,4};

Point snakeArray[64] = {s1, s2, s3, s4};

/* ^^^ end snake line code ^^^ */

void setup()                   
{
  MeggyJrSimpleSetup();      // Required code, line 2 of 2.
}

void loop()                    
{ 
drawSnake();
DrawPx (appleX,appleY,Red);  // ...apple-chan!!!
updateSnake();
  
  // vvv defining what numbers are up etc vvv //
  
  CheckButtonsPress();
    if (Button_Up)
        direction = 0;
    
    if (Button_Down)
        direction = 180;
    
    if (Button_Left)
        direction = 270;

    if (Button_Right)
        direction = 90;

// vvv this stuff is making the wraparound vvv //  

  if (snakeArray[0].y>7)
    snakeArray[0].y=0;
    
  if (snakeArray[0].y<0)
    snakeArray[0].y=7;
    
  if (snakeArray[0].x>7)
    snakeArray[0].x=0;
    
  if (snakeArray[0].x<0)
    snakeArray[0].x=7;
  
// apple chan sempai //

if (appleEat)  // after you eat an apple, make a new apple in a random spot
  {
    appleX = random(8);
    appleY = random(8);
    appleEat = false;
    eatenApples = eatenApples*2;
    Tone_Start(2500,100);
    ;
  }

if (snakeArray[0].x == appleX && snakeArray[0].y == appleY)  // apple collision detection
  {
    appleEat = true;
    tail++;
  }

if (appleEat)
    SetAuxLEDs(eatenApples-1);    // updating the topside LEDs to represent the score

/* display stuff */

  DisplaySlate();
  delay(150);
  ClearSlate();
  
}  // closes the loop

void drawSnake()
 {
   for (int i = 0; i < tail; i++)
     {
       DrawPx(snakeArray[i].x, snakeArray[i].y, Green);
     }
  }
    
void updateSnake()
{
  for (int i = tail-1; i> 0; i--)
  {
    snakeArray[i].x = snakeArray[i-1].x;
    snakeArray[i].y = snakeArray[i-1].y;
  }
  if (direction == 0)  // gooooing up
    snakeArray[0].y++;
    
  if (direction == 90)  // gooooing right
    snakeArray[0].x++;
    
  if (direction == 180) // goooooing down
    snakeArray[0].y--;
    
  if (direction == 270) // goooooing left
    snakeArray[0].x--;
}
