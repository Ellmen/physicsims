Particle e = new Particle();
int grg = 0;
void setup(){
  size(1000,600);
  background(100);
  frameRate(100);
}

void draw(){
 
  e.refresh();
  e.plate();
  e.slider();
   e.move();
  e.make(); 
 
  
 if (grg <1){
    background(100);
    grg++;
  }
  
}




class Particle{
  int Height = 600;
  boolean touching;
  int S1 = 90;
  int SP1 = 45;
  int SP2 = 500;
  float f = 0;
  float l = 0;
  float IvelocityX = 0;
  float velocityY = 0; 
  float velocityX = 20;
  float fieldS=1;
  float voltage = 500;
  float x = 70;
  float plateSep = 200;
  float plateSep1 = 100;
  //float plateSep2 = 200;
  float plateDis = 600 - plateSep*2;
  float radius = 12;
  float y = (Height - plateSep1 - plateSep)/2 + plateSep1;
  float t = y; 
  PVector p = new PVector(x,y);
  void make(){
     rectMode(CENTER);
    
    fill(255,255,0);
    if ((p.y > plateSep1+7.5 && p.y < height- plateSep-7.5) || p.x > width/2+250){
    
    ellipse(p.x,p.y,radius,radius);
    line(p.x-radius/4,p.y,p.x+radius/4,p.y);
   }
    pushMatrix();
     translate(-16,-50);
     fill(200);
     ellipse(36,height/2+11,10,10);
    rect(30,height/2+20,10,20);
   
    rect(50, height/2, 50, 20);//SourceBox
    beginShape();
    vertex(70,height/2-10);
    vertex(70+20,height/2-8);
    vertex(70+20,height/2+8);
    vertex(70,height/2+10);
    endShape(CLOSE);
    fill(100);
    rect(50+15, height/2, 10, 20);//SourceBox
    fill(200,200,200);
    stroke(0);
    ellipse(90,height/2,8,16);
    
    popMatrix();
  }
 
  void move(){
   
     x += velocityX;
     y += velocityY;
     p.set(x,y,0);
    if (p.y <= height - plateSep-20 && p.x >= width/2-250 &&  p.x <= width/2+250){
    velocityY += fieldS;
     
    }
    if(p.x< width/2+250 &&( p.y <= plateSep1+20 || p.y >= height - plateSep1 )|| p.x > width-100){
      velocityX = 0;
      velocityY = 0;
    }
    velocityX = IvelocityX;
    
  }
  
 
  void refresh(){
     
    if(mousePressed&&mouseX >850-30 && mouseX <850+30 && mouseY >height*0.85 - 30 && mouseY < height*0.85 + 30){
      background(100);
       x = 70;
       velocityX=0;
       velocityY = 0;
       y = (Height - plateSep1 - plateSep)/2 + plateSep1; 
       for(int p = width/2 - 250+10; p < width/2 + 250-2; p += 20){
     for(int y = 0; y < 3; y++){
      line(p,plateSep1+y*90-voltage/12+70,p,plateSep1+voltage/12+y*90+70);
      if (voltage < 0){
       line (p-5,plateSep1+y*90-voltage/12+70-5,p,plateSep1-voltage/12+y*90+70);
       line (p+5,plateSep1+y*90-voltage/12+70-5,p,plateSep1-voltage/12+y*90+70);
      }
      else if(voltage > 0){
        line (p-5,plateSep1+y*90-voltage/12+70+5,p,plateSep1+y*90-voltage/12+70);
       line (p+5,plateSep1+y*90-voltage/12+70+5,p,plateSep1+y*90-voltage/12+70);
      }
    }
      
    }
    }
    if (mousePressed && mouseX >35 && mouseX <55+S1 && mouseY > height*0.85-15 && mouseY <  height*0.85+15){
           background(100);
           if(x>100){x=8000;}
            for(int p = width/2 - 250+10; p < width/2 + 250-2; p += 20){
     for(int y = 0; y < 3; y++){
      line(p,plateSep1+y*90-voltage/12+70,p,plateSep1+voltage/12+y*90+70);
      if (voltage < 0){
       line (p-5,plateSep1+y*90-voltage/12+70-5,p,plateSep1-voltage/12+y*90+70);
       line (p+5,plateSep1+y*90-voltage/12+70-5,p,plateSep1-voltage/12+y*90+70);
      }
      else if(voltage > 0){
        line (p-5,plateSep1+y*90-voltage/12+70+5,p,plateSep1+y*90-voltage/12+70);
       line (p+5,plateSep1+y*90-voltage/12+70+5,p,plateSep1+y*90-voltage/12+70);
      }
    }
      
    }
    }
    fill(124,252,0);
    rect(850,height*0.85,60,60);
   
  }
   
   void plate(){
    
    fill(192, 192, 192);
    rectMode(CENTER);
    rect(width/2,plateSep1,500,15);
    rect(width/2,height-plateSep,500,15);
    for(int r = width/2 - 250+10; r < width/2 + 250-2; r += 20){
      if (voltage< 0){

      line(r-3,plateSep1,r+3,plateSep1);
      line(r,plateSep1-3,r,plateSep1+3);
      
      line(r-3,height-plateSep,r+3,height-plateSep);
      }
      else if(voltage > 0) {
      line(r-3,height-plateSep,r+3,height-plateSep);
      line(r,height-plateSep-3,r,height-plateSep+3);
      
      line(r-3,plateSep1,r+3,plateSep1);
       
        }
      }
     
   }

    
    void slider(){
      
     
      fieldS = voltage/plateDis;
      fill(200);
     rect(S1, height*0.85,120,80);
       if (mousePressed && mouseX >35 && mouseX <55+S1 && mouseY > height*0.85-15 && mouseY <  height*0.85+15 ){
           
         
           fill(200); 
           rect(S1, height*0.85,120,80);
         l = (mouseX-(S1));
       }
      
       fill(200);
        rect(S1, height*0.85,110,10);
        fill(100);
       rect(S1+l, height*0.85,5,15);//SLIDERS
       //COMBO BREAKER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
       fill(200);
       rect(SP2, height*0.85,110,90);
       if (mousePressed && mouseX >SP2 - 45 && mouseX <SP2+45 && mouseY > height*0.85-15 && mouseY <  height*0.85+15){
           fill(200); 
           rect(SP2, height*0.85,110,90);
         f = (mouseX-(SP2)+45);
       }
       fill(200);
        rect(SP2, height*0.85,90,10);
        fill(100);
       rect(SP2+f-45, height*0.85,5,15);//SLIDERS
       
     
    fill(0);
       voltage = 600 * (l/90);
       IvelocityX = f/2;
          if(p.x< width/2+250 &&( p.y <= plateSep1+20 || p.y >= height - plateSep-20 )|| p.x > width-100){
            velocityX = 0;
            }
        if (voltage > 0){
       line(130,690,130,710);
       line (130-5,710-5,130,710);
       line (130+5,710-5,130,710);
        }
       else if(voltage < 0){
       line(130,690,130,710);
       line (130-5,690+5,130,690);
       line (130+5,690+5,130,690);
        }
        textSize(12);
       text("Voltage",70,height*0.85 - 20);
       text(abs(round(voltage))+" Volts",70,height*0.85 + 30);
        text("Initial Speed",460,height*0.85 - 20);
        if (IvelocityX == 0){
       text(round(IvelocityX )+" m/s",460,height*0.85 + 30);
        }
        else if(IvelocityX > 0 && IvelocityX < 10){
          text(round(IvelocityX)+"*10^5 m/s",460,height*0.85 + 30);
        }
        else{
          text((IvelocityX)/10+"*10^6 m/s",460,height*0.85 + 30);
        }
       textSize(36);
       text("GO", 824,height*0.85 + 20);
        
    }
 
}