void setup(){
  size(1000,600);
  p = 10;
  lx = width/2; ly = height/2;
  ldx = -1; ldy = 1;
  px = p*3; py = height-p*3;
  pdx = 1; pdy = -1;
}
int p;
int lx,ly;
int ldx,ldy;
int px,py;
int pdx,pdy;

void stairs(){
  for(int i=1;i<6;i++){
    stroke(255);
    strokeWeight(5);
    line(0,100*i,width,100*i);
  }
}

void ladder(int x,int y,int lp){
  stroke(255);
  strokeWeight(1);
  fill(#5A3635);
  rect(x,y,lp,lp*10);
  rect(x+lp*9,y,lp,lp*10);
  rect(x,y+lp,lp*10,lp);
  rect(x,y+lp*4,lp*10,lp);
  rect(x,y+lp*7,lp*10,lp);
}

void pacman(int a,int b,int pp,int dx){
  if(dx==1){
    strokeWeight(2);
    noStroke();
    fill(#FFFF00);
    arc(a,b,pp*5,pp*5,radians(30),radians(330));
    stroke(255);
    fill(0);
    ellipse(a+pp,b-pp,pp,pp);
  }else if(dx==-1){
    strokeWeight(2);
    noStroke();
    fill(#FFFF00);
    arc(a,b,pp*5,pp*5,PI+radians(30),HALF_PI+radians(60));
    stroke(255);
    fill(0);
    ellipse(a-pp,b-pp,pp,pp);
  }
}

void draw(){
  background(#0000FF);
  stairs();
  
  lx=lx+3*ldx;
  ly=ly+3*ldy;
  if(lx<0 || lx+p*10>width){
    ldx=-ldx;
  }if(ly<0 || ly+p*10>height){
    ldy=-ldy;
  }
  ladder(lx,ly,p);
  
  px=px+5*pdx;
  if(px-p*3<0 || px+p*3>width){
    pdx=-pdx;
  }
  pacman(px,py,p,pdx);
}
