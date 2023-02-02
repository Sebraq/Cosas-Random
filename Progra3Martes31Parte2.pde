float x=0;
float y=100;
color c=color(0);
float velocidad1=0.2;
float velocidad2=0.5;
float velocidad3=0.3;
float velocidad4=0.2;
color c3 = color(51, 102, 153);
color c4=color(255, 255, 0);
color c5=color(255, 0, 255);
color c6=color(140, 23, 54);

class Carro {
  color c;
  float xPos;
  float yPos;
  float xVel;
  void desplegar(int v,int z, color c) {
    fill(c);
    rect(x+v, y+z, 30, 10);
  }
  void mover(float xVel) {
    x=x+xVel;
    if (x>width) {
      x=0;
    }
  }
}

Carro Subaru;//Cons1
Carro Mitsubishi;//Cons2
Carro Honda;//Cons3
Carro Mazda;//Cons4

void setup() {
  size (600, 600);
  
  Subaru=new Carro();//iniciar objeto.
  Mitsubishi=new Carro();//iniciar objeto.
  Honda=new Carro();//iniciar objeto.
  Mazda=new Carro();//iniciar objeto.
}

void draw() {
  
  background(230,100,23);
  Subaru.mover(velocidad1);
  Subaru.desplegar(54,20, c3);
  //
  Mitsubishi.mover(velocidad2);
  Mitsubishi.desplegar(2,40, c4);
  //
  Honda.mover(velocidad3);
  Honda.desplegar(35,60, c5);
  //
  Mazda.mover(velocidad4);
  Mazda.desplegar(20,80, c6);
}
