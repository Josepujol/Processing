/*
 Programa en Processing para controlar el encendido de un LED conectado a Arduino
 con un pulsador en el PC mediante comunicacion a traves del puerto serie
 En Arduino hay que cargar el programa: Ejemplos--> Communication --> Physical Pixel
 Enero 2018
 Jose Pujol
 */

// se importa la libreria serial
import processing.serial.*;
Serial myPort;    // se crea el objeto myPort de tipo Serial                   

// variables pulsador
int xpos, ypos;  //posición pulsador
int alto=75;    // altura rectangulo
int longitud=100;  // longitud rectangulo
boolean overButton = false;    // comprueba si el raton enta encima del pulsador
int colorButton=125;  // color del pulsador en escala grises

// variables LED
boolean ledStatus=false;    // estado del led apagado-encendido
int radio=75;           // radio del circulo del led 
int colorRLED=100;      // canal rojo del color del led a baja intensidad

void setup() {
  size(500, 300);  // tamaño de la pantalla
  // establece los valores de la posicion del pulsador
  xpos = width/3;
  ypos = height/2;
  // imprime la lista de los puertos series 
  printArray(Serial.list());
  // selecciona el puerto 5 que en este caso es al que se conecta Arduino
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
}

void draw() {

  // dibujamos el fondo
  background(245);  
  // dibujamos el pulsador
  fill(colorButton);    // color de relleno del pulsador
  rectMode(CENTER);    // coordenadas en el centro del rectangulo
  rect(xpos, ypos, longitud, alto, 8);
  // dibujamos el LED
  fill(colorRLED, 0, 0);  // color del led
  ellipse(width*2/3, height/2, radio, radio);

  // si el raton está encima del pulsador
  if (mouseX > xpos-longitud/2 && mouseX < xpos+longitud/2 && 
    mouseY > ypos-alto/2 && mouseY < ypos+alto/2) {
    overButton = true;    // variable overButton a true
    colorButton=190;      // cambia el color del pulsador gris claro
  } else {
    overButton = false;    // variable overButton a false
    colorButton=150;      // cambia el color del pulsador gris oscuro
  }
}

// interrupcion en caso de presionarse el raton
void mousePressed() {
  // si el raton está sobre el pulsador
  if (overButton) { 
    // si el estado del led es true
    if (ledStatus) {
      ledStatus=false;  // cambiamos el estado a falso
      colorRLED= 100;  // apagamos el led de la animacion
      myPort.write('L');  // mandamos L por el puerto serie
    } else {
      ledStatus=true;    // cambiamos el estado a cierto
      colorRLED= 255;    // encendemos el led de la animacion
      myPort.write('H');  // mandamos H por el puerto serie
    }
  }
}

/*
  Physical Pixel

  An example of using the Arduino board to receive data from the computer. In
  this case, the Arduino boards turns on an LED when it receives the character
  'H', and turns off the LED when it receives the character 'L'.

  The data can be sent from the Arduino Serial Monitor, or another program like
  Processing (see code below), Flash (via a serial-net proxy), PD, or Max/MSP.

  The circuit:
  - LED connected from digital pin 13 to ground

  created 2006
  by David A. Mellis
  modified 30 Aug 2011
  by Tom Igoe and Scott Fitzgerald

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/PhysicalPixel
*/

const int ledPin = 13; // the pin that the LED is attached to
int incomingByte;      // a variable to read incoming serial data into

void setup() {
  // initialize serial communication:
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // see if there's incoming serial data:
  if (Serial.available() > 0) {
    // read the oldest byte in the serial buffer:
    incomingByte = Serial.read();
    // if it's a capital H (ASCII 72), turn on the LED:
    if (incomingByte == 'H') {
      digitalWrite(ledPin, HIGH);
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'L') {
      digitalWrite(ledPin, LOW);
    }
  }
}
