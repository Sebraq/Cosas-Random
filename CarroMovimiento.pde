float x=0;
float y=20;
float velocidad=3;


void setup()//incio
{
  size(500,400);
  
}

void draw()
{
  background(130,130,200);
   mover();
  desplegar();
}
void desplegar(){
  //
  line(0,300,500,300);
  fill(255,0,0);
  rect(x+30,225,110,55);
  ////
  fill(255,0,0);
  stroke(255,0,0);
  rect(x,250,40,30,20,15,10,5);
  //
  fill(255,0,0);
  stroke(255,0,0);
  rect(x+135,250,40,30,10);
  //
  stroke(0,0,0);
  fill(0);
  ellipse(x+25,285,30,30);
  fill(0);
  ellipse(x+145,285,30,30);
  ////
  fill(170);
  ellipse(x+25,285,15,15);
  fill(170);
  ellipse(x+145,285,15,15);
  ////
  fill(64, 207, 255);
  stroke(0);
  rect(x+40,230,40,20);
  fill(64, 207, 255);
  rect(x+90,230,40,20);
  
  fill(255, 128, 0);
  ellipse(x+5,260,7,7);
  
  fill(255, 255, 0);
  ellipse(x+170,260,7,7);
  
  line(x+120,225,x+100,200);
}

void mover(){
  x=x+velocidad;
  if(x>width){
    x=0;
  }
}
