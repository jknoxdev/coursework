import JMyron.*;
import java.lang.*;

JMyron m;          // create a camera object
ImageButtons button;// create a button object

PFont font;

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
  m.trackColor(255,255,255,32);//R, G, B, and range of similarity
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

int prev_x  = 0;
int prev_x1 = 0;
int prev_x2 = 0;
int prev_x3 = 0;
int prev_x4 = 0;
int prev_y  = 0;
int prev_y1 = 0;
int prev_y2 = 0;
int prev_y3 = 0;
int prev_y4 = 0;
int curr_x  = 0;
int curr_y  = 0;
int[] move_x ;
int[] move_y ;
int move_index = 0;
boolean moving      = false;
boolean movingLeft  = false;
boolean movingRight = false;
boolean movingUp    = false;
boolean movingDown  = false;

void draw()
{
  button.update();
  button.display();
   
  
  m.update();//update the camera view
  drawCamera();//draw the camera to the screen
  int[][] b = m.globBoxes();//get the box points
 
 // global variables used:
 // int curr_x ;
 // int prev_x ;
  
 
  //--------------------------------------------------
  // draw all image overlays upon led detection
  //--------------------------------------------------
  for(int i=0 ; i<b.length ; i++)
  {
    fill( 128, 128, 128, 128); // bounding boxes
   //rect( b[i][0] , b[i][1] , b[i][2] , b[i][3] );
   
    prev_x4 = prev_x3;   
    prev_x3 = prev_x2;
    prev_x2 = prev_x1;
    prev_x1 = prev_x ;   
    prev_x = curr_x  ;
   
    prev_y4 = prev_y3;
    prev_y3 = prev_y2;
    prev_y2 = prev_y1;
    prev_y1 = prev_y ; 
    prev_y = curr_y  ;
    curr_x = b[0][0] ; 
    curr_y = b[0][1] ;
     
    //delay( 500 );
    
    //fill( 0,255,0 );
    //text( prev_x , 90,90);
    //text( curr_x , 90,110);
    
   /* fill( 255 ); //font
    textFont(font, 12); 
  
    //Coordinate and framerate display 
    if( b.length >=  1 ) { text( "LED1: ", 10, 20  ); text(  b[0][0], 45, 20  ); text(  ","    , 67, 20  ); text(  b[0][1], 75, 20  );  }
    if( b.length >=  2 ) { text( "LED2: ", 10, 40  ); text(  b[1][0], 45, 40  ); text(  ","    , 67, 40  ); text(  b[1][1], 75, 40  ); }
    if( b.length >=  3 ) { text( "LED3: ", 10, 60  ); text(  b[2][0], 45, 60  ); text(  ","    , 67, 60  ); text(  b[2][1], 75, 60  ); }
    if( b.length >=  4 ) { text( "LED4: ", 10, 80  ); text(  b[3][0], 45, 80  ); text(  ","    , 67, 80  ); text(  b[3][1], 75, 80  ); }
    text( frameRate, 275, 230 );
  */
    
  
    noStroke(); // direction indicator
    if( i == 0 )
    {
     
      
    fill(  255,255,255,128 ); //set to white at half transparency
   // triangle( 10,205  ,  20,195  ,  20,215 ); 
   // triangle( 50,195  ,  60,205  ,  50,215 );  
   // triangle( 25,190  ,  35,180  ,  45,190 ); 
   // triangle( 25,220  ,  35,230  ,  45,220 ); 
 
     
      /*direction*///triangle( x1,y1  ,  x2,y2  ,  x3,y3 );
      /*  left   */ if ( ( curr_x ) < ( prev_x-3 ) ) { movingLeft   = true;/* triangle( 10,205  ,  20,195  ,  20,215 ); */}  else movingLeft  = false; 
      /*  right  */ if ( ( curr_x ) > ( prev_x+3 ) ) { movingRight  = true;/* triangle( 50,195  ,  60,205  ,  50,215 ); */}  else movingRight = false; 
      /*  up     */ if ( ( curr_y ) < ( prev_y-3 ) ) { movingUp     = true;/* triangle( 25,190  ,  35,180  ,  45,190 ); */}  else movingUp    = false;
      /*  down   */ if ( ( curr_y ) > ( prev_y+3 ) ) { movingDown   = true;/* triangle( 25,220  ,  35,230  ,  45,220 ); */}  else movingDown  = false;
      ///*  center */   ellipse( 35,205  ,  20,20             );
      
    
        }
   //ellipse( 35,205  ,  20,20 );
  
  if( movingLeft || movingRight || movingUp || movingDown ) moving = true ;
  
  
  }
  //--------------------------------------------------
  // draw all image overlays regardless of led detection
  //--------------------------------------------------
  if( moving ) //store each coordinate from motion
  {
    fill( 255, 255, 0, 128 );
    ellipse( prev_x,  prev_y, 8, 8 );  //fill( 255, 255, 0,  192 );   
    ellipse( prev_x1, prev_y1, 8, 8 ); //fill( 255, 255, 0,  128 );
    ellipse( prev_x2, prev_y2, 8, 8 ); //fill( 255, 255, 0,  64);
    ellipse( prev_x3, prev_y3, 8, 8 ); //fill( 255, 255, 0, 32);
    ellipse( prev_x4, prev_y4, 8, 8 ); //fill( 255, 255, 0,  16);
    stroke( 255,255,0,128 );
    //line( prev_x, prev_y, prev_x1, prev_y1 ); 
    //line( prev_x1, prev_y1, prev_x2, prev_y2 );
    noStroke();
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
