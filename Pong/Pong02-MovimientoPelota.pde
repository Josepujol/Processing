/*
Movimiento de la pelota
*/

// variables de la pelota
float ballX=0; // posicion x pelota
float ballY=0; // posicion y pelota
float ballR=25; // radio pelota
float velX=random(1, 2); // desplazamiento x pelota
float velY=random(1, 2);  // desplazamiento y pelota

void setup() {
  // definimos el tamaño de la pantalla
  size(400, 800);
  background(0);
  // situamos la pelota en función de la pantalla
  ballY=height/4;
  ballX=width/2;
}

void draw() {

  // redibujamos el fondo
  background(0);

  // dibuja pelota
  fill(230);
  ellipse(ballX, ballY, ballR*2, ballR*2);

  //Movimiento pelota
  ballX=ballX+velX;
  ballY=ballY+velY;

  // Rebote paredes laterales
  if (ballX<0+ballR || ballX> width-ballR) {
    velX=velX*-1;
  }
  
    // Rebote paredes verticales
  if (ballY<0+ballR || ballY> height-ballR) {
    velY=velY*-1;
  }
}
