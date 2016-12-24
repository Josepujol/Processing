/*
Dinámica para mover la pelota en horizontal 
*/
// variables de la pelota
float ballPosx=0;
float ballPosy=0;
float ballRadio=25;
float ballVx=2;

void setup() {
  // definimos el tamaño de la pantalla
  size(600, 200);
  background(0);
  // situamos la pelota en función de la pantalla
  ballPosy=height/2;
  ballPosx=width/3;
}

void draw() {

  // redibujamos el fondo
  background(0);

  // dibuja pelota
  fill(230);
  ellipse(ballPosx, ballPosy, ballRadio*2, ballRadio*2);
  
   //Movimiento pelota
  ballPosx=ballPosx+ballVx;

  // Rebote paredes
  if (ballPosx<0+ballRadio || ballPosx> width-ballRadio) {
    ballVx=ballVx*-1;
  }
}
