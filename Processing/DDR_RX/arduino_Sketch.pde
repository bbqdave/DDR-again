
/*

int norm1;
int norm2;
int norm3;
int norm4;
int norm5;

int thresh = 10;

int patCount = 0;
int petCount = 0;

int timeStamp1;
int timeStamp2;
int petTime;

void setup(){
 Serial.begin(9600);  
   calibrate();
}


void loop(){
  
  readHead();
  readPet();
  pulseEyes();
  

//  Serial.println(petCount);
  

  
  
}






void serialPrint5(){
  Serial.print(touchRead(A1));
  Serial.print("   ");
  Serial.print(touchRead(A2));
  Serial.print("   ");
  Serial.print(touchRead(A3));
  Serial.print("   ");
  Serial.print(touchRead(A4));
  Serial.print("   ");
  Serial.println(touchRead(A5));
  }
  



void rainbow(){
  for (int x = 0; x < 150; x++){
   dispRGB(x+40, 0, 100-x);
  delay(3); 
  }
  for (int x = 150; x > 0 ; x--){
   dispRGB(x+40, 0, 100-x);
  delay(3); 
  } 
}

void greenFlash(){
  for(int i = 0; i < 100; i+=2){
    dispRGB(i/2,i,0);
    delay(10);
  }
   for(int i = 0; i < 50; i+=2){
    dispRGB(50-i,100,0);
    delay(10);
  }
 for(int i = 0; i < 20; i++){
  dispRGB(0,100,0);
  delay(220/i);
  dispRGB(0,0,0);
  delay(220/i);
}

}



  void dispRGB(int r, int g , int b){
 analogWrite(3, 255-r);
 analogWrite(5, 255-g);
 analogWrite(4, 255-b);
}

void flashRedXtimes(int x){
  for(int t = 0; t < x; t++){
  for(int i = 0; i <100; i++){
     dispRGB(i, 0, 0 );
     delay(3);
   }
    for(int i = 100; i > 0; i--){
     dispRGB(i, 0, 0 );
     delay(3);
   } 
  }
}

void calibrate(){
  delay(500);
  norm1 = touchRead(A1);
  norm2 = touchRead(A2);
  norm3 = touchRead(A3);
  norm4 = touchRead(A4);
  norm5 = touchRead(A5);
  delay(500);
}

void readHead(){
   if (touchRead(A5)-norm5 > thresh){
     while(touchRead(A5)-norm5 > thresh){
       patCount = patCount+1;
       dispRGB(0, 0, 100-patCount);
//       Serial.println(patCount);
       delay(7);
     if(patCount > 100){
       patCount = 0;
//       Serial.println("pat");
Serial.print(1, BYTE);                                //Send a PAT to processing
       greenFlash();
      while(touchRead(A5)-norm5 > thresh){
        delay(5);
      }
       break;
     }
     }
     patCount = 0;
     dispRGB(0, 0, 0);  
}
  }
  
  void readPet(){  
  if (touchRead(A1)-norm1 > thresh){
  petCount = 1;
  timeStamp1 = millis();
  }
  if (petCount == 1){
  if (touchRead(A2)-norm2 > thresh && touchRead(A1)-norm1 < thresh){  
  petCount = 2;
  }
  }
  if (petCount == 2){
  if (touchRead(A3)-norm3 > thresh && touchRead(A2)-norm2 < thresh){  
  petCount = 3;
  }
  }
  if (petCount == 3){
  if (touchRead(A4)-norm4 > thresh && touchRead(A3)-norm3 < thresh){  
  petCount = 4;
  timeStamp2 = millis();
  petTime = timeStamp2-timeStamp1;
  sendByte();
  flashRedXtimes(1);
  petCount = 0;
  }
  }
}


void pulseEyes(){
  if(millis()%2000<1000){
 dispRGB(0, millis()%2000/20, 100-millis()%2000/20);
  }
  else{
 dispRGB(0, 100 - millis()%2000/20, millis()%2000/20);
  }
}

void  sendByte(){
    Serial.print(petTime+2, BYTE);               // send 1 to Processing
//   delay(500);
  }


*/
