float AtomX,AtomY;
float Rspeed = 0;
float c = 0.6;
float r = 0.1;
float t = r;
float d = c;
float radius = 10;
float endR = -110;
float Spos [] = new float [3];
float s = 0;
float l = 2;
boolean start = false;
void setup(){
  size(1300,600);
  
}

void draw(){
  background(150);
 
  endR = -100 +-abs(slider(800,0,"Radius"))*1.8;
 
  c = (((slider(950,1,"Electric Field"))/90));
  if( c < 0.05){
    c = 0;
  }
  r = 0.05 + ((slider(1100,2,"Magnetic Field"))/270);
  
   if(start == true){
  t = r;
  d = c;
   }
   l = 50*r;
  if(button(450)&& mousePressed){
    start = false;
     Rspeed = 0;
     AtomX = 0;
     AtomY = 0;
     radius = 10;
     s = 0;
  }
  if(button(600)&& mousePressed){
  start = true;
  }
 if(start == true && AtomY > endR+50){
  
  radius += c;
  Rspeed += r;
  }
  
  translate(width/2-400,height/2);
  fill(200);
  rectMode(CORNER);
  rect(0,endR,width,65);
  rectMode(CENTER);
  ellipse(0,0,-endR*2,-endR*2);//CYCLETRON CIRCLE
  for(int x = -1; x < 2; x++){
    for(int y = -1; y < 2; y++){
      fill(100);
    line(endR*x*0.5-l,-l+endR*y*0.5,endR*x*0.5+l,l+endR*y*0.5);
    line(endR*x*0.5-l,l+endR*y*0.5,endR*x*0.5+l,-l+endR*y*0.5);
    }
  }
  fill(200);
  rect(0,0,30,height);//PARALLEL ELECTRIC PLATES
  for(int y=0; y < 15; y++){
    line(-10,-350+y*(700/15),10,-350+y*(700/15));
   
    if(AtomY < 0){
      line(0,-350+y*(700/15)-10,10,-350+y*(700/15));
      line(0,-350+y*(700/15)+10,10,-350+y*(700/15));
    }
    if(AtomY > 0){
      line(-10,-350+y*(700/15),0,-350+y*(700/15)+10);
      line(-10,-350+y*(700/15),0,-350+y*(700/15)-10);
    }
  }
  
 
 
  if(AtomY < endR+50){
   c = 0;
   r = 0;
   AtomX+= radius*t ;
  }
  else{
  
  AtomX = cos(Rspeed)*radius;
  AtomY = sin(Rspeed)*radius;
  line(AtomX,AtomY,AtomX/2,AtomY/2);
  line(AtomX/2,AtomY/2,AtomX/1.5-5,AtomY/1.5-5);
  line(AtomX/2,AtomY/2,AtomX/1.5+5,AtomY/1.5-5);
  }
  if (AtomX > width-200){
    start = false;
    if(s < round((radius*t)*3)){
    s+=8;
    fill(255,0,0);
    ellipse(width-(width/2-400),endR+30,s,s); 
    }
  }
  ellipse(0,0,10,10);
  textSize(20);
  fill(255,255,0);
  rect(300,92.5,20,20);
  fill(0,255,0);
  rect(450,92.5,20,20);
  fill(255);
  text("Negative",320,100);
  text("Neutral",480,100);
  text("Reset",130,240);
  text("Start",280,240);
  if(AtomY > endR+50)
    fill(255,255,0);
  else
    fill(0,255,0);
  ellipse(AtomX,AtomY,20,20);
  textSize(60);
  text("v = "+round(radius*t)+" m/s",700,100);
  
}

float slider(int SP2,int d, String Name){
  textSize(12);
  rectMode(CENTER);
   fill(200);
    rect(SP2, height*0.85,110,90);
       if (mousePressed && mouseX >SP2 - 45 && mouseX <SP2+45 && mouseY > height*0.85-15 && mouseY <  height*0.85+15){
           fill(200); 
           rect(SP2, height*0.85,110,90);
         Spos[d] = (mouseX-(SP2)+45);
       }
       fill(200);
        rect(SP2, height*0.85,90,10);
        fill(100);
       rect(SP2+Spos[d]-45, height*0.85,5,15);//SLIDERS
       text(Name,SP2-30,height*0.85-15);
         return Spos[d];
}

boolean button(int x){
  rectMode(CORNER);
  int r = 50;
  rect(x,height*0.85,r,r);
  if ( (mouseX < x+r && mouseX > x) && (mouseY < height*0.85+r && mouseY > height*0.85)){
    return true;
  }
  else{
    return false;
  }
}
