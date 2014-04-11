#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

/* vvv this is for the snake line vvv */

int marker = 4;

struct Point // name for the class
{
  int x;
  int y;
};

Point s1 = {3,4};  //making points
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
  updateSnake();
/* display stuff */
  DisplaySlate();
  delay(100);
  ClearSlate();

}  // closes the loop

void drawSnake()
 {
   for (int i = 0; i < marker; i++)
     {
       DrawPx(snakeArray[i].x, snakeArray[i].y, Green);
     }
  }
    
void updateSnake()
{
  for (int i = marker-1; i> 0; i--)
  {
    snakeArray[i].x = snakeArray[i-1].x;
    snakeArray[i].y = snakeArray[i-1].y;
  }
}
