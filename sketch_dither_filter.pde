//Declaration of a Capture object
PImage my_image;

//Light value for each pixel
float lumiere = 0;
//Total average light
float totallux = 0;

color couleur = int(random(360));

/*int[] couleurR = {255, 6, 80};
int[] couleurG = {0, 200, 100};
int[] couleurB = {0, 0, 103};*/

int rx = 1, ry = 1, a = 1, x;
float randomx, randomy, resox = 1, resoy = 1;

int nb = 6; // ! WARNING ! Make sure to change this number otherwise it will overwrite the previously saved file.

void setup(){
  //fullScreen();
  size(805, 966);
  frameRate(30); //FPS 
  background(255); //24, 13, 53
  noStroke();
  
}//end setup

void draw(){
  //load image
  my_image = loadImage("image1.jpeg"); 
    
  //Double-loop
  //the resolution of the final image: x+=2 and y+=2 the higher it is the less precise it is
  for(int x=0 ; x < my_image.width ; x+=resox){
    if (couleur == 360){
      couleur = 0;
      couleur ++;
    } else {
      couleur ++;
    }
    
    for(int y=0 ; y < my_image.height ; y+=resoy){
      //Recovery of the pixel color information
      color couleurLocale = my_image.get(x,y);
      
      //Recovery of red, green and blue values
      float r1 = red(couleurLocale); //value between 0 and 255
      float v1 = green(couleurLocale); //value between 0 and 255
      float b1 = blue(couleurLocale); //value between 0 and 255
      
      //Calculation of the amount of white on this pixel
      lumiere = r1 + v1 + b1; //results between 0 and 765
      //lumiere = map(lumiere, 0, 765, 0, 100); //adapt the light value to a percentage
      
      textSize(100);
      if(lumiere <= mouseX){ //150
        fill(0);//dark 60, 145, 230 / 191, 233, 165
        //fill(couleurR[int(random(0,2))], couleurG[int(random(0,2))],couleurB[int(random(0,2))]);
      } else {
        fill(255);//light 24, 13, 53
      }     
     
      rect(x, y, rx, ry);
      
      randomx = int(random(1, 5));
      randomy = int(random(1, 5));
      //I add this pixel value to the total of all pixels
      totallux += lumiere ;
      }//end for loop 2
    }//end for loop 1
    
    //Percentage of all pixels
    totallux /=  76800; //Pixels = 320 x 240 /= : divided
    
    //display
    fill(0);
    
}//end draw
  

//To switch from pixel mode to normal mode
void mousePressed(){
  //pixel mode
  if(a == 1){
     rx = 3;
     ry = 3;
     
     resox = 2;
     resoy = 5;
     
     a++;
     
  //normal mode
  } else if (a == 2){
   rx = 3;
   ry = 3;
     
   resox = 5;
   resoy = 2;
     
   a++;
  } else {
    rx = 5;
    ry = 2;
   
    resox = 3;
    resoy = 3;
    a=1;
  }
 
 draw();
}
 
 
void keyPressed(){
  saveFrame("screenshots/img"+ nb +".jpg");
  nb++;
  
}
  
