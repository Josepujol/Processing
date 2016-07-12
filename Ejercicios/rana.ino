// fondo
size(500,300);
background(255);

// cara
stroke(0);
strokeWeight(5);
fill (100,250,90);
ellipse (width/2, height/2, 200, 130);

// Ojos
strokeWeight(3);
fill (255);
ellipse (width/2-50, height/2-50, 50, 50);
ellipse (width/2+50, height/2-50, 50, 50);
fill (0);
ellipse (width/2-50, height/2-50, 15, 15);
ellipse (width/2+50, height/2-50, 15, 15);

// boca
fill (225,75,115);
ellipse (width/2, height/2+30, 140, 10);

// nariz
fill (0);
ellipse (width/2-10, height/2, 3, 10);
ellipse (width/2+10, height/2, 3, 10);
