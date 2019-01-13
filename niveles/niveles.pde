/* codigo base para crear diferentes niveles*/


// variable para seleccionar nivel
int level=0;

void setup() {
  size (300, 300);
}

void draw() {
  switch (level) {  
    case 0:
    presentation();
    break;
    case 1:
    game();
    break;
  }
}

void presentation() {
  background(220);
  fill(255,0,0);
  text("Pulsa s para comenzar",width/3,height/2);
}

void game(){
  background(10);
  text("Videojuego",width/3,height/2);
}

void keyPressed() {
  if (key=='s') {
     level=1;
  }
}
