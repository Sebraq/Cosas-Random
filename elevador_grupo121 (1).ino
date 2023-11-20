#include <LiquidCrystal.h>
#include <Servo.h>

int total;
int servo;
//int old=1;
int dt=100;
Servo servo1;
LiquidCrystal lcd(12,11,5,4,3,2);

void setup()
{
  lcd.begin(16,2);
  lcd.setCursor(3,0);
  lcd.print("No. de nivel");
  lcd.setCursor(8,1);
  total=1;
  lcd.print(total);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  servo1.attach(6);
  servo=36;
  servo1.write(servo);
}

void loop()
{
  int subir=digitalRead(A2);
  int bajar=digitalRead(A1);
  delay(dt);
  
  
  if(subir==HIGH){
    total+=1;
    servo+=36;
    servo1.write(servo);
    lcd.setCursor(8,1);
    lcd.print(total);
  }else if (bajar==HIGH){
    total-=1;
    servo-=36;
    servo1.write(servo);
    lcd.setCursor(8,1);
    lcd.print(total);
  }
  if(total>5){
    total=5;
    servo=180;
    servo1.write(servo);
    lcd.setCursor(8,1);
    lcd.print(total);
  }
  if (total<1){
    total=1;
    servo=36;
    servo1.write(servo);
    lcd.clear();
    lcd.setCursor(3,0);
    lcd.print("No. de nivel");
    lcd.setCursor(8,1);
    lcd.print(total);
  }
  
  //old=subir;
  
}