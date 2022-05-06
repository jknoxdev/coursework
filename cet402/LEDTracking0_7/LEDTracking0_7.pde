import JMyron.*;
import java.lang.*;

JMyron m;          // create a camera object
ImageButtons button;// create a button object

PFont font;

int thresh = 24;

void setup()
{
  frameRate( 30 );
  
  //--------------------------------------------------
  // font setup
  //-------------------------------------------------- 
  // note: The font must be located in the sketch's 
  // "data" directory to load successfully
  //--------------------------------------------------
  smooth();
  font = loadFont("SynchroLET-48.vlw"); 
  textFont(font, 32); 
  text("word", 15, 50);
  
  //--------------------------------------------------
  // JMyron video window setup
  //--------------------------------------------------
  size(320,300);
  background( 255, 255, 255 );
  m = new JMyron();//make a new instance of the object
  m.start(320,240);//start a capture at 320x240
  m.trackColor(255,255,255,thresh);//R, G, B, and range of similarity
  m.minDensity(10); //minimum pixels in the glob required to result in a box
  m.maxDensity(500); //
  println("Color tracking system initialized ver. " + m.version());
  noFill();
  
  //--------------------------------------------------
  // button setup
  //--------------------------------------------------
  PImage b = loadImage("base1.gif");
  PImage r = loadImage("roll1.gif");
  PImage d = loadImage("down1.gif");
  int x =  3;
  int y = 246; 
  int w = b.width;
  int h = b.height;
  button = new ImageButtons(x, y, w, h, b, r, d);
}

// global variables for led tracking
int prev_x1 = 0; int prev_x2 = 0; int prev_x3 = 0; int prev_x4 = 0;
int prev_y1 = 0; int prev_y2 = 0; int prev_y3 = 0; int prev_y4 = 0;
int curr_x1 = 0; int curr_x2 = 0; int curr_x3 = 0; int curr_x4 = 0;
int curr_y1 = 0; int curr_y2 = 0; int curr_y3 = 0; int curr_y4 = 0;

void draw()
{
  button.update();
  button.display();
   
  
  m.update();//update the camera view
  drawCamera();//draw the camera to the screen
  int[][] b = m.globBoxes();//get the box points

  //--------------------------------------------------
  // draw all image overlays
  //--------------------------------------------------
  for(int i=0 ; i<b.length ; i++)
  {
    fill( 128, 128, 128, 128); // bounding boxes
    rect( b[i][0] , b[i][1] , b[i][2] , b[i][3] );
   
    prev_x1 = curr_x1; prev_x2 = curr_x2; prev_x3 = curr_x3; prev_x4 = curr_x4;  
    prev_y1 = curr_y1; prev_y2 = curr_y2; prev_y3 = curr_y3; prev_y4 = curr_y4; 
    
    if( b.length >=  1 ) { curr_x1 = b[0][0] ; curr_y1 = b[0][1] ; } 
    if( b.length >=  2 ) { curr_x2 = b[1][0] ; curr_y2 = b[1][1] ; } 
    if( b.length >=  3 ) { curr_x3 = b[2][0] ; curr_y3 = b[2][1] ; } 
    if( b.length >=  4 ) { curr_x4 = b[3][0] ; curr_y4 = b[3][1] ; } 
    
    fill( 255 ); //font color
    textFont(font, 12); 
  
    //Coordinate and framerate display 
    if( b.length >=  1 ) { text( "LED1: ", 10, 20  ); text(  b[0][0], 45, 20  ); text(  ","    , 67, 20  ); text(  b[0][1], 75, 20  ); }
    if( b.length >=  2 ) { text( "LED2: ", 10, 40  ); text(  b[1][0], 45, 40  ); text(  ","    , 67, 40  ); text(  b[1][1], 75, 40  ); }
    if( b.length >=  3 ) { text( "LED3: ", 10, 60  ); text(  b[2][0], 45, 60  ); text(  ","    , 67, 60  ); text(  b[2][1], 75, 60  ); }
    if( b.length >=  4 ) { text( "LED4: ", 10, 80  ); text(  b[3][0], 45, 80  ); text(  ","    , 67, 80  ); text(  b[3][1], 75, 80  ); }
    text( frameRate, 275, 20 );
  
    noStroke(); // no borders on direction indicator
    
    if( i == 0 )
    {
      fill(  255,255,255,128 ); //set to white at half transparency
   /*led 1*/
      /*  left   */ if ( ( curr_x1 ) < ( prev_x1-3 ) ) {  triangle( 15,205  ,  25,195  ,  25,215 ); }
      /*  right  */ if ( ( curr_x1 ) > ( prev_x1+3 ) ) {  triangle( 55,195  ,  65,205  ,  55,215 ); } 
      /*  up     */ if ( ( curr_y1 ) < ( prev_y1-3 ) ) {  triangle( 30,190  ,  40,180  ,  50,190 ); }
      /*  down   */ if ( ( curr_y1 ) > ( prev_y1+3 ) ) {  triangle( 30,220  ,  40,230  ,  50,220 ); }
      /*  center */ if ( b.length >=  1 )                  ellipse( 40,205  ,  20,20             );
   /*led 2*/
      /*  left   */ if ( ( curr_x2 ) < ( prev_x2-3 ) ) {  triangle(  95,205  ,  105,195  ,  105,215 ); }
      /*  right  */ if ( ( curr_x2 ) > ( prev_x2+3 ) ) {  triangle( 135,195  ,  145,205  ,  135,215 ); } 
      /*  up     */ if ( ( curr_y2 ) < ( prev_y2-3 ) ) {  triangle( 110,190  ,  120,180  ,  130,190 ); }
      /*  down   */ if ( ( curr_y2 ) > ( prev_y2+3 ) ) {  triangle( 110,220  ,  120,230  ,  130,220 ); }
      /*  center */ if ( b.length >=  2 )                  ellipse( 120,205  ,  20,20               );
   /*led 3*/
      /*  left   */ if ( ( curr_x3 ) < ( prev_x3-3 ) ) {  triangle( 175,205  ,  185,195  ,  185,215 ); }
      /*  right  */ if ( ( curr_x3 ) > ( prev_x3+3 ) ) {  triangle( 215,195  ,  225,205  ,  215,215 ); } 
      /*  up     */ if ( ( curr_y3 ) < ( prev_y3-3 ) ) {  triangle( 190,190  ,  200,180  ,  210,190 ); }
      /*  down   */ if ( ( curr_y3 ) > ( prev_y3+3 ) ) {  triangle( 190,220  ,  200,230  ,  210,220 ); }
      /*  center */ if ( b.length >=  3 )                  ellipse( 200,205  ,  20,20               );
   /*led 4*/
      /*  left   */ if ( ( curr_x4 ) < ( prev_x4-3 ) ) {  triangle( 255,205  ,  265,195  ,  265,215 ); }
      /*  right  */ if ( ( curr_x4 ) > ( prev_x4+3 ) ) {  triangle( 295,195  ,  305,205  ,  295,215 ); } 
      /*  up     */ if ( ( curr_y4 ) < ( prev_y4-3 ) ) {  triangle( 270,190  ,  280,180  ,  290,190 ); }
      /*  down   */ if ( ( curr_y4 ) > ( prev_y4+3 ) ) {  triangle( 270,220  ,  280,230  ,  290,220 ); }
      /*  center */ if ( b.length >=  4 )                  ellipse( 280,205  ,  20,20               );
    }
  }
}


//--------------------------------------------------
// draw video
//--------------------------------------------------
void drawCamera()
{
  int[] img = m.image(); //get the normal image of the camera
  loadPixels();
  for(int i=0;i<320*240;i++)  //loop through all the pixels
  { 
    pixels[i] = img[i]; //building pixels array
  }
  updatePixels();  //draw each pixel to the screen
}


//--------------------------------------------------
// mouse handling
//--------------------------------------------------
void mousePressed()
{
  if ( button.pressed )  m.settings();          //click the window to get the settings
  button.pressed = false ;
}

public void stop()
{
  m.stop();            //stop the object
  super.stop();
}


//--------------------------------------------------------
// button class 
//---------------------------------------------------------
class Button
{
  int x, y;
  int w, h;

  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  
  void pressed() 
  {
    if(over && mousePressed) 
    {
     m.settings();           //camera settings
     mousePressed = false ;  //mouse is unpressed
     } 
   }
  boolean overRect( int x, int y, int width, int height ) 
  {
  if( mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height ) 
    return true;
  else 
    return false;
  }  
}
class ImageButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }
  void update() 
  {
    over();
    pressed();
    if(pressed) 
      currentimage = down;
    else if (over)
      currentimage = roll;
    else 
      currentimage = base;
  }
  void over() 
  {
    if( overRect(x, y, w, h) ) 
      over = true;
    else 
      over = false;
  }
  void display() 
  {
    image(currentimage, x, y);
  }
}
