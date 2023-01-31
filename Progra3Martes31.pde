float x=20;
float y=20;
color c=color(0);
float velocidad=1;

void setup(){
  size(200,200);
}

void draw(){
  background(230,100,23);
  mover();
  desplegar();
  //noLoop();
}

void mover(){
  x=x+velocidad;
  y=y+velocidad;
  if(x>width&&y>width){
    x=0;
    y=0;
  }
}

void desplegar(){
  fill(c);
  rect(x,y,30,10);
}
