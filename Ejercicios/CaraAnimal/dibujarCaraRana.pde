// variables posicion
int posX=250;
int posY=150;

// fondo
size(500,300);
background(255);

// cara
stroke(0);
strokeWeight(5);
fill (60,220,40);
ellipse (posX, posY, 200, 130);

// Ojos
strokeWeight(3);
fill (255);
ellipse (posX-50, posY-50, 50, 50);
ellipse (posX+50, posY-50, 50, 50);
fill (0);
ellipse (posX-50, posY-50, 15, 15);
ellipse (posX+50, posY-50, 15, 15);

// boca
fill (225,75,115);
ellipse (posX, posY+30, 140, 10);

// nariz
fill (0);
ellipse (posX-10, posY, 3, 10);
ellipse (posX+10, posY, 3, 10);
