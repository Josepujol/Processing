/*
Dinámica para mover la pelota en horizontal 
*/

// variables de la pelota
float ballX=0;
float ballY=0;
float radio=25;
float vx=2;

void setup() {
  // definimos el tamaño de la pantalla
  size(600, 200);
  background(0);
  // situamos la pelota en función de la pantalla
  ballY=height/2;
  ballX=width/3;
}

void draw() {

  // redibujamos el fondo
  background(0);

  // dibuja pelota
  fill(230);
  ellipse(ballX, ballY, radio*2, radio*2);
  
   //Movimiento pelota
  ballX=ballX+vx;

  // Rebote paredes
  if (ballX<0+radio || ballX> width-radio) {
    vx=vx*-1;
  }
}

