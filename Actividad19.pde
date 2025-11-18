// ACTIVIDAD 19 - PWD 7° 2° A
// Gráficos, Animaciones e Interactividad en Processing

// 🌟 Variables de movimiento
float bolaX, bolaY;
float velocidadX = 4;
float velocidadY = 3;
float tamBola = 50;

// 🎨 Colores iniciales
float rojo = 0;
float verde = 200;
float azul = 255;

// 📷 Variables para imágenes
PImage bg;
PImage logoImg;

// 🔢 Extras
int contadorClicks = 0;
boolean mostrarFiguraExtra = false;

void setup() {
  size(800, 600);
  
  // Posición inicial
  bolaX = width / 2;
  bolaY = height / 2;
}

void draw() {
  // Fondo degradado diferente
  dibujarFondo();

  // Logo decorativo
  dibujarLogo();

  // Bola que se mueve
  fill(rojo, verde, azul);
  noStroke();
  ellipse(bolaX, bolaY, tamBola, tamBola);

  // Rastro
  fill(rojo, verde, azul, 70);
  ellipse(bolaX - velocidadX*2, bolaY - velocidadY*2, tamBola*0.8, tamBola*0.8);

  // Actualizar posición
  bolaX += velocidadX;
  bolaY += velocidadY;

  // Rebotes
  if (bolaX > width - tamBola/2 || bolaX < tamBola/2) velocidadX *= -1;
  if (bolaY > height - tamBola/2 || bolaY < tamBola/2) velocidadY *= -1;

  // Iniciales TA
  dibujarIniciales();

  // Figura extra si hay click
  if (mostrarFiguraExtra) dibujarFiguraExtra();

  // Contador
  fill(255);
  textSize(16);
  text("Clicks: " + contadorClicks, 10, 30);
  text("Velocidad: " + nf(abs(velocidadX),1,1), 10, 50);
}

// Fondo con otro estilo
void dibujarFondo() {
  for (int i = 0; i < height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(color(10, 50, 90), color(200, 100, 200), inter);
    stroke(c);
    line(0, i, width, i);
  }
}

// Logo decorativo circular
void dibujarLogo() {
  pushMatrix();
  translate(width - 60, 60);
  fill(255, 150, 0);
  noStroke();
  for (int i = 0; i < 12; i++) {
    float angle = TWO_PI / 12 * i;
    float rx = cos(angle) * 25;
    float ry = sin(angle) * 25;
    ellipse(rx, ry, 10, 10);
  }
  popMatrix();
}

// Iniciales TA
void dibujarIniciales() {
  stroke(255);
  strokeWeight(8);
  strokeCap(ROUND);
  fill(255, 180);

  // T
  line(60, 150, 140, 150); // horizontal
  line(100, 150, 100, 250); // vertical

  // A
  line(180, 250, 230, 150); // diagonal izquierda
  line(280, 250, 230, 150); // diagonal derecha
  line(205, 200, 255, 200); // barra horizontal

  // Decoración
  fill(150, 255, 150, 120);
  noStroke();
  ellipse(100, 130, 20, 20);
  ellipse(230, 130, 20, 20);

  // Texto
  fill(255);
  textSize(14);
  text("Mis Iniciales: T A", 150, 290);
}

// Figura extra en el mouse
void dibujarFiguraExtra() {
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(frameCount * 0.08);
  fill(255, 255, 100, 200);
  noStroke();
  
  for (int i = 0; i < 6; i++) {
    pushMatrix();
    rotate(TWO_PI / 6 * i);
    ellipse(0, 25, 20, 25);
    popMatrix();
  }
  
  fill(255, 100, 200);
  ellipse(0, 0, 20, 20);
  popMatrix();
}

// Interactividad con mouse
void mousePressed() {
  rojo = random(255);
  verde = random(255);
  azul = random(255);

  velocidadX *= 1.15;
  velocidadY *= 1.15;

  velocidadX = constrain(velocidadX, -8, 8);
  velocidadY = constrain(velocidadY, -8, 8);

  mostrarFiguraExtra = !mostrarFiguraExtra;

  contadorClicks++;
  tamBola = 70;
}

void mouseReleased() {
  tamBola = 50;
}

// Interacción con teclado
void keyPressed() {
  if (key == 'r' || key == 'R') {
    bolaX = width / 2;
    bolaY = height / 2;
    velocidadX = 4;
    velocidadY = 3;
    rojo = 0;
    verde = 200;
    azul = 255;
    contadorClicks = 0;
    mostrarFiguraExtra = false;
  }

  if (key == ' ') {
    velocidadX = random(-5, 5);
    velocidadY = random(-5, 5);
  }
}

