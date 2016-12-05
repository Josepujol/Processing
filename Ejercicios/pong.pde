/*
Pong
 */


float ballVx=1;
float ballVy=1;
float ballPosx=0;
float ballPosy=0;
float ballRadio=15;

float paletaPosx=250;
float paletaPosy=500;
float paletaAncho=50;
float paletaAlto=20;

void setup() {
  size(400, 600);
  background(125);
}

void draw() {

  // redibujamos el fondo
  background(125);

  // dibuja ball
 // stroke(0);
  fill(230);
  ellipse(ballPosx, ballPosy, ballRadio*2, ballRadio*2);

  // dibuja paleta

  paletaPosx=mouseX;
  fill(234,20,20);
  rectMode(CENTER);
  rect(paletaPosx, paletaPosy, paletaAncho, paletaAlto, 5);

  //Movimiento pelota
  ballPosx=ballPosx+ballVx;
  ballPosx=ballPosx+ballVx;

  // Rebote paredes
  if (ballPosx<0 || ballPosx> width-ballRadio) {
    ballVx=ballVx*-1;
  }
  if (ballPosy<0 || ballPosy> height-ballRadio) {
    ballVy=ballVy*-1;
  }

  // detección pelota paleta
  if (ballPosx> paletaPosx- paletaAncho/2- ballRadio && ballPosx< paletaPosx + paletaAncho/2- ballRadio)
  {
    if (ballPosy> paletaPosy- paletaAlto/2 - ballRadio && ballPosy< paletaPosy - ballRadio)
    {
      ballVy=ballVy*-1;
    }
  }
}

void keypressed() {
}
