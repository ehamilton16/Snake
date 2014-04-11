/* hissss snake */

// if button up, y ++
// if button down, y --
// if button right x ++ 
// if button left, x --

// direction variable

/* 

continuous movement
   loop: check direction is up
         y ++
         if direction is down
         y --
         if direction is right
         x ++
         if direction is left
         x -- 

adjusting values
   if snakeX < 0, snakeX = 7
   if snakeX > 7, snakeX = 0
   if snakeY < 0, snakeY = 7
   if snakeY > 7, snakeY = 0
*/


// UP = 0 ... DOWN = 180 ... RIGHT = 90 ... LEFT = 270


int snakeX = 0;    // create variables for snake
int snakeY = 0;
int appleX = 0;    // create variables for dot
int appleY = 0;

int direction = 0;    //directional variable 

boolean appleEat = true;  // if u eat apples

byte score = 1;  // light up the top

int speed = 100; // speed stuff

int eatenApples = 1; // track how many apples eaten (for the score indicator)

#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

void setup()                   
{
  MeggyJrSimpleSetup();      // Required code, line 2 of 2.
}

void loop()                    
{
  DrawPx(snakeX,snakeY,Green); // ...snake-kun...
  DrawPx (appleX,appleY,Red);  // ...apple-chan!!!
  
  // vvv defining what numbers are up etc vvv
  
  CheckButtonsPress();
    if (Button_Up)
        direction = 0;
    
    if (Button_Down)
        direction = 180;
    
    if (Button_Left)
        direction = 270;

    if (Button_Right)
        direction = 90;
      
  if (direction == 0) // if direction is UP
    {
      if (snakeY==7)
      {
        snakeY=0;
      }
      else
        snakeY++;
    }
  if (direction == 90) // if going RIGHT
    {
      if (snakeX==7)
      {
        snakeX=0;
      }
      else
        snakeX++;
    }
  if (direction == 180) // if going DOWN
     {
       if (snakeY==0)
       {
         snakeY=7;
       }
       else
         snakeY--;
     }
  if (direction == 270) // if going LEFT
     {
       if (snakeX==0)
       {
         snakeX=7;
       }
       else
         snakeX--;
     }

if (appleEat)  // after you eat an apple, make a new apple in a random spot
  {
    appleX = random(8);
    appleY = random(8);
    appleEat = false;
    eatenApples = eatenApples*2;
    Tone_Start(2500,100);
    ;
  }

if (snakeX == appleX && snakeY == appleY)  // apple collision detection
  appleEat = true;
  
if (appleEat)
    SetAuxLEDs(eatenApples-1);    // updating the topside LEDs to represent the score
  
/* display stuff*/

DisplaySlate();
delay(100);
ClearSlate();
       
}


