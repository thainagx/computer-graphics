// ALUNA: THAINA GOMES DE ARAUJO
// MATRÍCULA: 2017102026
// MATÉRIA:; COMPUTAÇÃO GRÁFICA
// PRIMEIRA AVALIAÇÃO

PFont f;

void setup(){
  size(700, 600);
  f = createFont("Arial",16,true);
}

void draw(){
  menu();
  desenhoOriginal();
  if (mouseButton == LEFT) {
    inverteCores();
  } 
  else if (mouseButton == RIGHT) {
    deslocaImagem();
  }
  else if (keyPressed) {
    circuloDegrade();
  }
}

void menu(){
  fill(0);
  noStroke();
  quad(0, 0, 0, 100, 700, 100, 700, 0);
  
  textFont(f, 14);       
  fill(255);
  textAlign(CENTER);
  text("======================= MENU DE OPÇÕES =======================", 350, 20);
  
  textFont(f, 12);       
  fill(255);
  textAlign(LEFT);
  text("PRESSIONE O BOTÃO ESQUERDO DO MOUSE: INVERTE AS CORES DA BANDEIRA", 110, 40);
  
  textFont(f, 12);       
  fill(255);
  textAlign(LEFT);
  text("PRESSIONE O BOTÃO DIREITO DO MOUSE: DESLOCA DESENHOS DA BANDEIRA", 110, 60);
  
  textFont(f, 12);       
  fill(255);
  textAlign(LEFT);
  text("PRESSIONE t OU T: FAZER UM DEGRADÊ NO CÍRCULO", 110, 80);
}

void desenhoOriginal() {
  // Desenha o retângulo
  fill(0, 150, 0);
  stroke(255);
  strokeWeight(4);
  quad(0, 100, 0, 600, 700, 600, 700, 100);
  
  // Desenha o losângo
  fill(255, 255, 0);
  noStroke();
  quad((0.125 * width), ((0.5 * 500) + 100), (0.5 * width), ((0.125 * 500) + 100), (0.875 * width), ((0.5 * 500) + 100), (0.5 * width), ((0.875 * 500) + 100));
  
  //Desenha o círculo
  fill(0, 0, 100);
  noStroke();
  ellipseMode(CENTER);
  ellipse((0.5 * width), ((0.5 * 500) + 100), (0.3333 * width), (0.3333 * width));
  
  // Escreve frase
  textFont(f, 20);       
  fill(255, 255, 0);
  textAlign(CENTER);
  text("ORDEM E PROGRESSO", (0.5 * width),((0.5 * 500) + 100));
  save("BandeiraOriginal.png");
}

void inverteCores(){
  loadPixels();
    // Percorre os pixels nas colunas
    for(int y = 0; y < height; y++ ){
      // Percorre os pixels na linha
      for(int x = 0; x < width; x++ ){
        // Calcula a posição do pixel
        int pos = x + y * width;
        // Guarda o valor do componente red do pixel
        float r = red(pixels[pos]);
        // Guarda o valor do componente green do pixel
        float g = green(pixels[pos]);
        // Guarda o valor do componente blue do pixel
        float b = blue(pixels[pos]);
        // Faz a inversão de cor no pixel
        pixels[pos] = color(255-r, 255-g, 255-b);
      }
    }
    // Conclui o processo de acesso aos pixels da matriz
    updatePixels();
    save("BandeiraInvertida.png");
}

void deslocaImagem(){
  // Desenha o retângulo
    fill(0, 150, 0);
    stroke(255);
    strokeWeight(4);
    quad(0, 100, 0, 600, 700, 600, 700, 100);
    
    // Desenha o losângo
    fill(255, 255, 0);
    noStroke();
    quad((0.25 * width), ((0.5 * 500) + 100), (0.625 * width), ((0.125 * 500) + 100), width, ((0.5 * 500) + 100), (0.625 * width), ((0.875 * 500) + 100));
    
    //Desenha o círculo
    fill(0, 0, 100);
    noStroke();
    ellipseMode(CENTER);
    ellipse((0.625 * width), ((0.5 * 500) + 100), (0.3333 * width), (0.3333 * width));
    
    // Escreve frase
    textFont(f, 20);       
    fill(255, 255, 0);
    textAlign(CENTER);
    text("ORDEM E PROGRESSO", (0.625 * width), ((0.5 * 500) + 100));
    
    save("BandeiraDeslocada.png");
}

void circuloDegrade(){
  if (key == 't' || key == 'T') {
      // Desenha o retângulo
      fill(0, 150, 0);
      stroke(255);
      strokeWeight(4);
      quad(0, 100, 0, 600, 700, 600, 700, 100);
      
      // Desenha o losângo
      fill(255, 255, 0);
      noStroke();
      quad((0.125 * width), ((0.5 * 500) + 100), (0.5 * width), ((0.125 * 500) + 100), (0.875 * width), ((0.5 * 500) + 100), (0.5 * width), ((0.875 * 500) + 100));
      
      //Desenha o círculo maior
      fill(0, 0, 100, 100);
      noStroke();
      ellipseMode(CENTER);
      ellipse((0.5 * width), ((0.5 * 500) + 100), (0.3333 * width), (0.3333 * width));
      
      //Desenha o círculo médio
      fill(0, 0, 100, 140);
      noStroke();
      ellipseMode(CENTER);
      ellipse((0.5 * width), ((0.5 * 500) + 100), (0.2222 * width), (0.2222 * width));
      
      //Desenha o círculo pequeno
      fill(0, 0, 100, 200);
      noStroke();
      ellipseMode(CENTER);
      ellipse((0.5 * width), ((0.5 * 500) + 100), (0.1111 * width), (0.1111 * width));
      
      // Escreve: ORDEM
      textFont(f, 20);       
      fill(255, 255, 0);
      textAlign(CENTER);
      text("ORDEM", (0.5 * width),((0.35 * 500) + 100));
      
      // Escreve: E
      textFont(f, 20);       
      fill(255, 255, 0);
      textAlign(CENTER);
      text("E", (0.5 * width),((0.5 * 500) + 100));
      
      // Escreve: PROGRESSO
      textFont(f, 20);       
      fill(255, 255, 0);
      textAlign(CENTER);
      text("PROGRESSO", (0.5 * width), ((0.65 * 500) + 100));
      
      //save("BandeiraTransparencia.png");
    }
}
