int count = 3;
int len;
float l;
PVector vect,vect1,vect2,vect3;
float opacity [] = new float [7];
int [] angles = new int [7+1];
float [] magnitudes = new float [7+1];
filter[] list;


void setup() {
  size(1200, 600);
  stroke(0);
  list = new filter[8];
  }

void draw() {
  background(30);
  len = 1200/(count+1);
   for (int w=0; w<count; w++) {
    list[w] = new filter((w*len), height/2, 40, len, w);
    list[w].display();
    list[w].source();
    list[w].vectors();
    list[w].buttons();
  } 
}

class filter {
  int x, y, r, t, num,z;
  float diff,m,w,h,q,n;
  filter(int Tx, int Ty, int Tr, int Tt, int A) {
    x = Tx;//CONSTRUCTOR Tx=xlocation,Ty=yLocation,Tr=BoxSize 
    y = Ty;//Tt=xTranslation, A= FilterNumber
    r = Tr;
    t = Tt;
    num = A;
    q = 1200/(count+1);
  }

  void source() {
    if (n == 0){
    noStroke();
    fill(200);
    ellipse(25,height/2,12,20);
    rect(50, height/2, 50, 20);//SourceBox
    beginShape();
    vertex(70,height/2-10);
    vertex(70+20,height/2-20);
    vertex(70+20,height/2+20);
    vertex(70,height/2+10);
    endShape(CLOSE);
    fill(100);
    rect(50+15, height/2, 10, 20);//SourceBox
    fill(200);
    stroke(0);
    ellipse(90,height/2,8,39);
    noStroke();
    fill(255, 255, 51,200);
    rect(69+(t-50)/2, height/2, t-86, 10);
    fill(200);
    }
  }

  void display() {
    opacity[0] = 255/2;
    if (mousePressed && mouseX >(x+t)-46 && mouseX < (x+t)+46 && mouseY > (height/2 - 100) && mouseY < (height/2 - 50)){
      angles[num] = ((mouseX - (x+t)) * 2);
    }//DEFINING PARAMETER FOR MOUSE LOCATION
    
    if (mousePressed && mouseX >45 && mouseX < 140 && mouseY > (50) && mouseY < (110)){
      for (int e = 0; e < 8; e++){
      angles[e] = 0;
      }
      l = 0;
    }//DEFINING PARAMETER FOR MOUSE LOCATION
    
     if (mousePressed && mouseX >width/2-46 && mouseX < width/2+46 && mouseY > height*0.85-15 && mouseY <  height*0.85+15){
      l = (mouseX-(width/2)+45);
      
    }//DEFINING PARAMETER FOR MOUSE LOCATION

    pushMatrix();//SLIDERS
    translate(x+t,y);
    stroke(0);
    fill(255);
    rect(0,-75,90,10);
    fill(150);
    rect(angles[num]/2,-75,5,15);
    
    if (num >= 1) {
      diff = radians((abs(angles[num]-angles[num-1])));
      opacity[num] = opacity[num-1]*sq(cos(diff)); // Sets amplitude
    }
    fill(255, 255, 51, opacity[num]);
    noStroke();
    if (num > 0) {
      if (opacity[num] < 7) {
        translate(0,0);
      }
      else {
        translate(0,0);
      }
    }
    rectMode(CORNER);
    if (num+1 < count) {
      rect(0, -5, q, 10);//LIGHTS
    }
    else {
      rect(0, -5, width, 10);//LAST LIGHT
    }
    
    popMatrix();
    
    pushMatrix();
    translate(x+t, y);//FILTER CONSTRUCTION
    rectMode(CENTER);
    fill(0,0);
    stroke(225);
    rotate(radians(angles[num]));
    rect(0, 0, r, r);//BOX
    for (int h=-20; h<20; h+=5) {
      line(h, -r/2, h, +r/2);//SLITS
    }
    popMatrix();
    
  }
  
  void vectors(){
    magnitudes[0] = 30;
    pushMatrix();//FILTER VECTOR
    translate(x+t, y+130);
    textSize(32);
    text(angles[num],-20,-250);
    stroke(30,144,255);
    vect = PVector.fromAngle(radians(angles[num]-90));
    vect1 = PVector.fromAngle(radians(angles[num]-90));
    if (num == count-1){
      stroke(30,144,255);
    }
    w = vect.heading();
    vect.setMag(magnitudes[num]);
    vect1.setMag(magnitudes[0]);
    m = vect.mag();
    line(-vect1.x,-vect1.y,vect1.x,vect1.y);
    popMatrix();
    
    pushMatrix();
    translate(x+t+q/2, y+130);
    if (num == count -1){
    stroke(0,225,0); // sets color for last vector
    }
    line(-vect.x,-vect.y,vect.x,vect.y);
    popMatrix();
     
    pushMatrix();//FILTER PROJETION ADJACENT
    if (num <count-1){
    translate(x+t+q/2, y+130);
    vect2 = PVector.fromAngle((radians(angles[num+1]-90)));
    h = (abs(vect2.heading()-vect.heading()));
    vect2.setMag(m*cos(h));
    magnitudes[num+1] = vect2.mag();
    stroke(0,255,0);
    popMatrix();
    
    pushMatrix();
    translate(x+t+q/2-vect.x, y+130-vect.y);
    line(0,0,vect2.x*2,vect2.y*2);//CORRECT LINE
    stroke(255,0,0);
    line(vect2.x*2,vect2.y*2,vect.x*2,vect.y*2);//WRONG LINE
    }
    popMatrix();
   
    pushMatrix();//# Of Sliders Slider
    translate(width/2, height*0.85);
    stroke(0);
    fill(200);
    textSize(32);
    text("# of Filters",-250,8);
    fill(255);
    rect(0,0,90,10);
    fill(80);
    popMatrix();
    
    pushMatrix();
    translate(width/2-45, height*0.85);
    fill(125);
     rect(l,0,5,15);//SLIDERS
     n = int(l/15);
     
     count = 2 + int(n);
     popMatrix();
  }
  void buttons(){
    stroke(0);
    fill(150);
    rectMode(CENTER);
    fill(200);
    textSize(32);
    text(round(((opacity[count-1]/255)*100))+"%",950,100);
    fill(255);
    rect(90,87.5,95,40);
    if (mousePressed && mouseX >815 && mouseX < 1115 && mouseY > (50) && mouseY < (110)){
    z = 1000;
    }
    else{
      z = 0;
    }
    rect(965+z,87.5,300,40);
    fill(0);
    textSize(32);
    text("Reset",47.5,100);
    text("% Light Transmitted",825+z,100);
    
}
}