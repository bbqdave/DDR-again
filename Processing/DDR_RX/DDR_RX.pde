
import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
int a;
int m = 400;

void setup() 
{
  size(m, m);
 
  String portName = Serial.list()[11];          //Teensy 3.1 is on port 10
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }
  
  
 // background(200);             // Set background to white
  

  if (val == 0) {            
 fill(20,150,0);
 rect(0, 0, m, m);
  } 

  if(val == 1) {           
   fill(200,20,0);
 rect(0, 0, m, m);
  }

 if (val == 2) {       
fill(180,0,180);
 rect(0, 0, m, m);
  } 

  if(val == 3) {       
   fill(20,50,190);
 rect(0, 0, m, m);
  }  
}



