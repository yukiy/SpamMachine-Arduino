int mortorEn1=  2;
int mortorUp=   3;
int mortorDown= 4;

int mortorEn2=  5;
int mortorLeft= 6;
int mortorRight=7;

int mortorEn3=  8;
int mortorCC=   9;
int mortorCW=  10;

int bigSwPin= 11;
boolean bigSw= false;
int firstPush=0;

int upPin= 14;
int downPin= 15;
int rightPin= 16;
int leftPin= 17;
int ccPin= 18;
int cwPin= 19;



void setup()
{
  Serial.begin(9600);

  for(int i=0; i < 10; i++){
    pinMode(i,OUTPUT);
  }

  pinMode(11, INPUT);
  pinMode(13, OUTPUT);

  for(int i=14; i < 19; i++){
    pinMode(i,INPUT);
  }
}


void loop()
{

  int up= analogRead(upPin);
  int right= analogRead(rightPin);
  int down= analogRead(downPin);
  int left= analogRead(leftPin);
  int cc= analogRead(ccPin);
  int cw= analogRead(cwPin);


//    Serial.print("Up: ");
//    Serial.print(up);
//    Serial.print(" ");
//    Serial.print("Down: ");
//    Serial.print(down);
//    Serial.print(" ");
//    Serial.print("Left: ");
//    Serial.print(left);
//    Serial.print(" ");
//    Serial.print("Right: ");
//    Serial.print(right);
//    Serial.print(" ");
//    Serial.print("Cc: ");
//    Serial.print(cc);
//    Serial.print(" ");
//    Serial.print("Cw: ");
//    Serial.println(cw);

  if(up>0){
    digitalWrite(mortorUp, LOW);
  } 
  else{
    //Serial.println("Up");
    digitalWrite(mortorEn1, HIGH);
    digitalWrite(mortorUp, HIGH);
    digitalWrite(mortorDown, LOW);
  }

  if(down>0){
    digitalWrite(mortorDown, LOW);
  } 
  else{
    //Serial.println("Down");
    digitalWrite(mortorEn1, HIGH);
    digitalWrite(mortorUp, LOW);
    digitalWrite(mortorDown, HIGH);
  }

  if(left>0){
    digitalWrite(mortorLeft, LOW);
  }
  else{
    //Serial.println("Left");
    digitalWrite(mortorEn2, HIGH);
    digitalWrite(mortorLeft, HIGH);
    digitalWrite(mortorRight, LOW);
  }

  if(right>0){
    digitalWrite(mortorRight, LOW);
  } 
  else{
    //Serial.println("Right");
    digitalWrite(mortorEn2, HIGH);
    digitalWrite(mortorLeft, LOW);
    digitalWrite(mortorRight, HIGH);

  }

  if(cc>0){
    digitalWrite(mortorCC, LOW);
  } 
  else{
    //Serial.println("CC");
    digitalWrite(mortorEn3, HIGH);
    digitalWrite(mortorCC, HIGH);
    digitalWrite(mortorCW, LOW);
  }

  if(cw>0){
    digitalWrite(mortorCW, LOW);
  } 
  else{
    //Serial.println("CW");
    digitalWrite(mortorEn3, HIGH);
    digitalWrite(mortorCC, LOW);
    digitalWrite(mortorCW, HIGH);
  }


  if(digitalRead(bigSwPin) > 0)
  {
    bigSw= true;
    //Serial.println("bigSW");
    //Serial.println(digitalRead(bigSwPin));
    if(firstPush<4){
      Serial.print(1,DEC);
      firstPush++;
    }
  }
  else{
    if(bigSw){
      delay(5);
      Serial.print(0,DEC);
      bigSw= false;
      firstPush= 0;
    }
  }


  if(Serial.available()>0){
    int fromP5= Serial.read();
    if(fromP5==2){
      Serial.print(fromP5,DEC);
      digitalWrite(13,HIGH);
    }
  }
  else{
    Serial.flush();
    digitalWrite(13,LOW);  
  }
  delay(50);
}











