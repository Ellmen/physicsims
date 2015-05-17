
//Variables that determin the position of the rocket
float y = 0; //the rockets position
float yVel = 0;
float yAccel=0;
float force;
float time=10;
float mass=140;
//other variables
float accel;
float tFin;//time when finished accelerating
float velFin;//velocity when finished accelerating
float counter=0;//counts each frame (60 frames in a second)
int frames=0;//counts screens rocket has passed
float dis=0;//the current distance traveled up
float dis2=0;//max distance while accelerating
float disUp;//the maximum distanced traveled up
float space=0;//equals 1 when rocket is in space
float stop=0;//saves highest point reached by rocket
float down=0;//says if rocket is going down
float red=64;
float green=222;
float blue=255;
float op=280;
boolean display=false;
//random star/cloud x/y values
int ranA;
int ranB;
int ranC;
int ranD;
int ranE;
int ranF;
int ranG;
int ranH;
int ranI;
int ranJ;

int[][]posi;//array for storing cloud/star positions 

int pointer = 0;
String [] vals = new String[10];//stores values for textboxes
boolean start = false; 
//creates the textboxs
Textbox speed = new Textbox(245, 615, 0);
Textbox fuel = new Textbox(380, 615, 1);
Textbox weight = new Textbox(520, 615, 2);




void setup()//sets up sim (screen size, frame rate, ect.)
{
  vals[0] = "";
  vals[1] = "";
  vals[2] = "";
  size(1100, 700);
  frameRate(60);
  y = height;
}






void cloud(int x, int y) //function for drawing clouds
{
  fill(255, op);
  ellipseMode(CENTER);
  ellipse(150+x, 100+y, 70, 70);
  ellipse(120+x, 75+y, 70, 70);
  ellipse(100+x, 100+y, 70, 70);
  ellipse(70+x, 75+y, 70, 70);
  ellipse(50+x, 100+y, 70, 70);
}





void star(int x, int y) //function for drawing stars
{
  fill(255, 249, 64);
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(0+x, -50+y);
  vertex(14+x, -20+y);
  vertex(47+x, -15+y);
  vertex(23+x, 7+y);
  vertex(29+x, 40+y);
  vertex(0+x, 25+y);
  vertex(-29+x, 40+y);
  vertex(-23+x, 7+y);
  vertex(-47+x, -15+y);
  vertex(-14+x, -20+y);
  endShape(CLOSE);
}





///////////////////////////////////////////////////////////////////////////////



void  draw()    //does this function every frame. Basicly a big while loop with lots of if loops in it
{                      
  if (frames>=7)             //first section of draw only deals with drawing the back grounds
    space=1;

  else
    space=0;

  if (frames==0)
  {
    background(red, green, blue);
    rectMode(CORNER);
    fill(65, 236, 37);
    rect(1, height-169, 1100, 350);
  }


  if (frames>0&&frames<6)
  {
    background(red, green, blue);
    if (yVel<0)//takes random variables for star positions
    {
      cloud(ranA, ranB);
      cloud(ranC, ranD);
      cloud(ranE, ranF);
      cloud(ranG, ranH);
    }
    if (yVel>=0)//on way back down takes positions from array to show same positions
    {
      cloud(posi[frames-1][0], posi[frames-1][1]);
      cloud(posi[frames-1][2], posi[frames-1][3]);    
      cloud(posi[frames-1][4], posi[frames-1][5]);  
      cloud(posi[frames-1][6], posi[frames-1][7]);
    }
  }


  if (frames==6)
  {
    background(red, green, blue);
  }

  if (frames>=7&&frames!=8)
  {
    background(21, 32, 46);
    if (yVel<0)   
    {   
      star(ranA, ranB);
      star(ranC, ranD);
      star(ranE, ranF);
      star(ranG, ranH);
      star(ranI, ranJ);
    }
    if (yVel>=0)
    {
      star(posi[frames-1][0], posi[frames-1][1]);
      star(posi[frames-1][2], posi[frames-1][3]);    
      star(posi[frames-1][4], posi[frames-1][5]);  
      star(posi[frames-1][6], posi[frames-1][7]);
      star(posi[frames-1][8], posi[frames-1][9]);
    }
  }

  if (frames==8)
  {

    background(21, 32, 46);
    star(500, 680);
    star(450, 450);
    star(870, 650);
    star(915, 400);
    star(300, 300);
    star(300, 300);
    star(150, 170);
    star(150, 170);
    star(15, 90);
  }
  fill(255);







  /////////////////////////////////////////////////////////////////////////////////////////////////








  //this section of draw deals with rocket motion 


  if (frames==0&&y>498&&yVel>0)//resets variables when back at ground lvl
  {
    start=false;
    yVel=0;
    vals[0]="";
    vals[1]="";
    vals[2]="";
    counter=0;
  }


  if (mousePressed && frames == 0) {//the start botton
    start = button(80);
  }


  if (frames == 0) {                  //does this when at ground lvl
    boolean b = button(80);
    textSize(16);
    fill(0);
    text("Start", 86, height*0.9-5);
    text("Force(N)", 216, 655);
    text("Time(sec)", 349, 655);
    text("Weight(kg)", 488, 655);
    speed.make();
    fuel.make();
    weight.make();
  }



  if (start) 
  {//does these while the rocket ship is moving
    force = (float)speed.val();//means force value is pointing to text box
    time = (float)fuel.val();
    mass=(float)weight.val();
    yAccel=-(((force/mass)-9.81)/60);
    velFin=((force/mass)-9.81)*time; 
    disUp=(((.5*((force/mass)-9.81)*time*time)-(-(velFin*velFin)/(2*9.81)))*6)/700;
  }





  if (counter==1)//does this at start of sim
  {   
    dis=0;
    down=0;
    posi=new int[(int)disUp+3][10];
    accel=-yAccel;
    dis2=(.5*((force/mass)-9.81)*time*time);
    display=false;
  }







  if (counter>=0&&counter!=time*60)//does this while rocket accelerates upwards
  {
    rectMode(CENTER);

    if (y<50)//resets the rocketship back to the bottom of the screen and counts screens
    {
      y=height;
      frames++;
      blue-=15;
      red-=15;
      green-=10;
      op-=25;

      // creates the random positiones for the clouds in the next frame
      posi[frames-1][0]=( ranA=(int)random(50, 900));
      posi[frames-1][1]=( ranB=(int)random(50, 550));
      posi[frames-1][2]=( ranC=(int)random(50, 900));
      posi[frames-1][3]=( ranD=(int)random(50, 550));
      posi[frames-1][4]=( ranE=(int)random(50, 900));
      posi[frames-1][5]=( ranF=(int)random(50, 550));
      posi[frames-1][6]=( ranG=(int)random(50, 900));
      posi[frames-1][7]=( ranH=(int)random(50, 550));
      posi[frames-1][8]=( ranI=(int)random(50, 900));
      posi[frames-1][9]=( ranJ=(int)random(50, 550));
    }
    if (start ) { //reavaluates the rockets position
      y += yVel*6;
      yVel += yAccel/60;
      counter++;
    }
    stroke(0);       //draws the rocketship
    strokeWeight(1);
    fill(240, 24, 24);
    beginShape();
    vertex(510, y-30);
    vertex(525, y-56);
    vertex(540, y-30);
    vertex( 510, y-30);
    endShape(CLOSE);

    beginShape();
    vertex(490, y+30);
    vertex(525, y-5);
    vertex(560, y+30);
    vertex( 490, y+30);
    endShape(CLOSE);

    fill(255);
    rect(525, y, 30, 60);
  }






  if (display==true)//a situation that allows text to be shown
  {
    rectMode(CENTER);
    if (space==0)
      fill (0);
    else
      fill(48, 220, 224);
    textSize(13);   
    text("Stopped Acceleration At: "+ dis2+"m", 1, 30);
  }






  if (counter>=time*60)//takes affect when rocket stops accelerating upwards
  {   
    display=true;//allows for text to be shown

    fill(255);

    if (y<50&&down==0)//resets the rocketship back to the bottom of the screen and counts screens
    {
      y=height;
      frames++;
      blue-=15;
      red-=15;
      green-=10;
      op-=25;
      // creates the random positiones for the clouds in the next frame
      posi[frames-1][0]=( ranA=(int)random(50, 900));
      posi[frames-1][1]=( ranB=(int)random(50, 550));
      posi[frames-1][2]=( ranC=(int)random(50, 900));
      posi[frames-1][3]=( ranD=(int)random(50, 550));
      posi[frames-1][4]=( ranE=(int)random(50, 900));
      posi[frames-1][5]=( ranF=(int)random(50, 550));
      posi[frames-1][6]=( ranG=(int)random(50, 900));
      posi[frames-1][7]=( ranH=(int)random(50, 550));
      posi[frames-1][8]=( ranI=(int)random(50, 900));
      posi[frames-1][9]=( ranJ=(int)random(50, 550));
    }
    if (yVel>=0&&y>height-10)//resets the rocketship to the top of the screen and counts down screens
    {
      y=14;

      frames--;
      down=1;
      blue+=15;
      red+=15;
      green+=10;
      op+=25;
    }

    if (start) {//reavaluates rocket position
      y += yVel*6;
      yVel += 0.1635/60;
    }
    stroke(0);//draws rocket
    strokeWeight(1);
    fill(240, 24, 24);
    beginShape();
    vertex(510, y-30);
    vertex(525, y-56);
    vertex(540, y-30);
    vertex( 510, y-30);
    endShape(CLOSE);

    beginShape();
    vertex(490, y+30);
    vertex(525, y-5);
    vertex(560, y+30);
    vertex( 490, y+30);
    endShape(CLOSE);

    fill(255);
    rect(525, y, 30, 60);
  }









  if (frames < 1) {
    fill(0);
  }


  if (yVel<0)//does this while rocket ship is going up
  {
    if (space==0)
      fill (0);
    else
      fill(48, 220, 224);
    textSize(13);
    text(dis, 1, y-40);//prints the current height of the rocket

    dis-=yVel;//changes the distance that moves with the rocket
    stop=y-40;//saves the highrest point reached by the rocket
  }




  if (yVel>=0&&down==0)//prints max height before it has gone down a screen
  {
    if (space==0)
      fill (0);
    else
      fill(48, 220, 224);
    textSize(13);
    text(dis, 1, stop);
  }




  if (yVel>=0&&down==1)//prints max hight once it has gone down a frame
  {
    if (space==0)
      fill (0);
    else
      fill(48, 220, 224);
    textSize(13);   
    text("Max Height: "+ dis+"m", 1, 50);
  }


 text("Acceleration: "+ (int)(accel*60)+ "m/s*s", 1, 10);// prints acceleration

 
  if (frames == 0 && y> 500)//keep rocket at ground level
  {
    y = 500;
    if (yVel > 0)
    {
      yVel = 0;
    }
  }
}







///////////////////////////////////////////////////////////


//extra code for textboxes and buttons, done by Rees

void keyReleased() {
  textSize(32);

  if (vals[pointer].length() < 10) {
    vals[pointer] += (key-48);
    if (keyCode == BACKSPACE) {
      vals[pointer] = vals[pointer].substring(0, vals[pointer].length()-2);
    }
    if (keyCode == ENTER) {
      vals[pointer] = vals[pointer].substring(0, vals[pointer].length()-1);
      start = true;
    }
  }
}

class Textbox {
  int x, y;
  int add = 0;
  int num;
  Textbox(int Tx, int Ty, int Tnum) {
    x = Tx;
    y = Ty;
    num = Tnum;
  }

  void make() {
    rectMode(CENTER);

    textAlign(CENTER, CENTER);
    textSize(25);
    fill(200);
    if (vals[num].length() >2) {
      add = vals[num].length();
    } else {
      add = 0;
    }
    rect(x, y, 40+(10*add), 40);
    fill(0);
    if (vals[num].length() > 0) {
      text(vals[num], x, y);
    } else {
      text("__", x, y);
    }


    textAlign(LEFT);
    check();
  }

  float val() {
    float e = 0;
    boolean neg = false;
    //println(vals[num].length());
    int w = vals[num].length();
    String q = "";
    for (int x = 0; x < w; x++) {
      if (vals[num].charAt(x) == '-') {
        neg = true;
        //w--;
      } else {
        q+= vals[num].charAt(x);
      }
    }
    //println(vals[num]);
    if (q.length() > 0) {
      e = parseFloat(q);
    }

    //e = (int)vals[num].charAt(0)-48*pow(10,2)+);
    if (vals[num].length() > 0 ) {
      if (neg == false) {
        return e;
      } else {
        return -e;
      }
    } else {
      return 0;
    }
  }

  void check() {
    rectMode(CENTER);
    int r = 50;
    if ( mousePressed && (mouseX < x+r/2 && mouseX > x-r/2) && (mouseY < y+r/2 && mouseY > y-r/2)) {
      pointer = num;
      vals[pointer] = "";
    }
  }
}

boolean button(int x) {
  rectMode(CORNER);
  int r = 50;
  rect(x, height*0.85, r, r);
  if ( mousePressed &&(mouseX < x+r && mouseX > x) && (mouseY < height*0.85+r && mouseY > height*0.85)) {
    return true;
  } else {
    return false;
  }
}

