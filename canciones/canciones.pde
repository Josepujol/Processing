/* Ejemplo de como reproducir 2 canciones
 */

// importamos la librería
import ddf.minim.*;

// Declaramos objeto musica de tipo Minim
Minim musica;

// Declaramos las canciones de tipo Audioplayer
AudioPlayer cancion1;
AudioPlayer cancion2;



void setup()
{
  // creamos el objeto musica de tipo Minim
  musica = new Minim(this);
  // cargamos las canciones
  cancion1 = musica.loadFile("01.mp3");
  cancion2 = musica.loadFile("02.mp3");
}

void draw()
{
}

void keyPressed()
{
  // Si pulsamos a
  if (key== 'a') {
    // Reproducir 2 y pausar 1
    cancion1.pause();
    cancion2.play();
  }
  // Si pulsamos s
  if (key== 's') {
    // Reproducir 1 y pausar 2
    cancion2.pause();
    cancion1.play();
  }
}