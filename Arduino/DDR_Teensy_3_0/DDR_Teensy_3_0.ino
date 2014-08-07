#include "SPI.h"
#include "Adafruit_WS2801.h"

uint8_t dataPin  = 18;    // Yellow wire on Adafruit Pixels d2
uint8_t clockPin = 19;    // Green wire on Adafruit Pixels  d3

// Set the first variable to the NUMBER of pixels. 25 = 25 pixels in a row
Adafruit_WS2801 strip = Adafruit_WS2801(25, dataPin, clockPin);

float  Ainit;
float  Binit;
float  Cinit;
float  Dinit;
float changeA;

float ratio;            //how hard the trigger has to be hit
float sens;

int numOfAnalogInputs = 4;



void setup() {
   Serial.begin(9600); 
  strip.begin();
  strip.show();
  
  delay(500);
  
   Ainit = analogRead(0); 
   Binit = analogRead(1);
   Cinit = analogRead(2);
   Dinit = analogRead(3);
  delay(500);
}

int getInitialReading(int analogInput){
    if(analogInput == 0){
      return(Ainit);
    }
    if(analogInput == 1){
      return (Binit);
    }
    
    if(analogInput == 2){
      return(Cinit);
    }
    
    if(analogInput == 3){
      return(Dinit);
    }
}
void loop() {
 
  sens = map(analogRead(A7), 0, 1024, 1010, 1500);     // sensitivity dictated by pot on A7
 
 ratio = sens/1000;          //turn sensitivity into the ratio to compare w init
 Serial.println(ratio);
 
 int len = strip.numPixels();
 for(int i=0;i<numOfAnalogInputs;i++){
   float reading = analogRead(i);
   float initReading = getInitialReading(i);
   float value = reading/initReading;
   uint32_t color;
   if(value > ratio){
     color = Wheel(50*i+random(0,30));
     Serial.print(i, BYTE);
   }else{
     color = 0;
   }
   int loopStart = 6*i;
   // loop for that group in lights
   for(int x= loopStart;x<loopStart+6;x++){
     strip.setPixelColor(x,color);
     strip.show();
  //   Serial.println(value);
   }
 }
 
//strip.show();
  
  delay(100);
}







/* Helper functions */

// Create a 24 bit color value from R,G,B
uint32_t Color(byte r, byte g, byte b)
{
  uint32_t c;
  c = r;
  c <<= 8;
  c |= g;
  c <<= 8;
  c |= b;
  return c;
}

//Input a value 0 to 255 to get a color value.
//The colours are a transition r - g -b - back to r
uint32_t Wheel(byte WheelPos)
{
  if (WheelPos < 85) {
   return Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  } else if (WheelPos < 170) {
   WheelPos -= 85;
   return Color(255 - WheelPos * 3, 0, WheelPos * 3);
  } else {
   WheelPos -= 170; 
   return Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
}
