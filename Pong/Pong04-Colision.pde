/*
Movimiento de la pelota, movimiento paddle y colision
 */

// variables de la pelota
float ballX=0; // posicion x pelota
float ballY=0; // posicion y pelota
float ballR=25; // radio pelota
float velX=random(1, 2); // desplazamiento x pelota
float velY=random(1, 2);  // desplazamiento y pelota

// variables paddle
float paddleX=0;
float paddleY=0;
float paddleH=20;
float paddleW=100;

void setup() {
  // definimos el tamaño de la pantalla
  size(400, 800);
  background(0);
  // situamos la pelota en función de la pantalla
  ballY=height*1/5;
  ballX=width/2;
  // situamos el paddle
  paddleY=height*4/5;
  paddleX=width/2;
}

void draw() {

  // redibujamos el fondo
  background(0);

  // dibuja pelota
  fill(230);
  ellipse(ballX, ballY, ballR*2, ballR*2);

  // dibuja paddle
  fill(230, 60, 60);
  rect(paddleX, paddleY, paddleW, paddleH);
  stroke(0, 230, 20);
  //line(paddleX, 0, paddleX, height);
  //line(paddleX+paddleW, 0, paddleX+paddleW, height);
  //line(0.0, paddleY, width, paddleY);
  //line(0.0, paddleY+paddleH, width, paddleY+paddleH);

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
  
  // deteccion padle pelota
  collision();
}

void collision() {
  // detección paddle pelota eje X
  if ((ballX +ballR> paddleX) && (ballX-ballR< paddleX+paddleW)) {
    // detección paddle pelota eje Y
    if ((ballY+ballR>paddleY)&&(ballY+ballR<paddleY+paddleH/4)) {
        velY=velY*-1;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (paddleX<width-paddleW)paddleX=paddleX+paddleW/4;
    } 
    if (keyCode == LEFT) {
      if (paddleX>0)paddleX=paddleX-paddleW/4;
    }
  }
}
