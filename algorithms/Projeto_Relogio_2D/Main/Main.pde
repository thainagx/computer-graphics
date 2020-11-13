PImage pulseira; // Utilizada para manipulação da imagem da pulseira do relógio
PFont ind; // Utilizada para criação de textos no programa

float raio = 260;



void setup(){
  
  // Configurações gerais da tela
  size(1000, 600);
  ind = createFont("Arial", 12, true);
  pulseira = loadImage("relogio.png");
  smooth(8);
  
  // Configurações do módulo de movimentação
  noStroke();
  frameRate(30);
  // Iniciando o módulo de movimentação no meio da tela
  xpos = width/2;
  ypos = height/2;
  
}

void draw(){
  
  Relogio();
  
  if (mousePressed){
    if (mouseButton == RIGHT){
      BolaRelogio();
    }
    else if (mouseButton == LEFT){
      MovimentaRelogio();
    }
  }
  else if (keyPressed) {
    if (key == 'c' || key == 'C') {
      Contorno(); 
    }
    else if (key == 'd' || key == 'D'){
      Degrade();
    }
    else if(key == 'i' || key == 'I'){
      Inverte();
    }
  }
}
