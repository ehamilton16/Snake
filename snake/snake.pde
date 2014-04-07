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
int dotX = 0;    // create variables for dot
int dotY = 0;

int direction = 0;    //directional variable 

int speed = 300; 

#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

void setup()                   
{
  MeggyJrSimpleSetup();      // Required code, line 2 of 2.
}

void loop()                     // run over and over again
{
  DrawPx(snakeX,snakeY,Green); // snake-kun
  
  CheckButtonsPress();
    if (Button_Up)
        direction = 0;
    
    if (Button_Down)
        direction = 180;
    
    if (Button_Left)
        direction = 270;

    if (Button_Right)
        direction = 90;

    if (Button_A)
        speed-50;

    if (Button_B)
        speed+50;
      
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

DisplaySlate();
delay(speed);
ClearSlate();
       
}


