// Criando uma variavel do tipo imagem
PImage img;

void setup(){
  // Define dimensões da tela
  size(350, 197);
  // Carrega imagem e guarda em "img"
  img = loadImage("tarefa-04.jpg");
  // Bloqueia loop da função draw
  noLoop();
}

void draw(){
  // Executa função para inverter a imagem na horizontal
  inverte_horizontal();
  // Executa função para inverter a imagem na vertical
  inverte_vertical();
}

void inverte_horizontal(){
  // Exibe a imagem selecionada
  image(img, 0, 0);
  // Carrega os pixels para habilitar o acesso e as alterações nos mesmos
  loadPixels();
  int pos1, pos2, aux;
  // Percorre os pixels nas colunas
  for(int y = 0; y < height-1; y++ ){
    // Percorre os pixels na linha
    for(int x = 0; x < (width/2); x++ ){
      // Calcula a posição do pixel
      pos1 = x + (y * width);
      // Calcula a posição do pixel que será invertido com o pixel atual
      pos2 = (width - x) + (y * width);
      // Guardando o pixel invertido na variável auxiliar
      aux = img.pixels[pos2];
      // Atribuindo o pixel atual no pixel invertido
      pixels[pos2] = img.pixels[pos1];
      // Atribuindo o pixel guardado em "aux" no pixel atual
      pixels[pos1] = aux;
    }
  }
  // Conclui o processo de acesso aos pixels da matriz
  updatePixels();
  // Salvando imagem invertida horizontalmente
  save("invertida-horizontal.jpg");
}

void inverte_vertical(){
  // Exibe a imagem selecionada
  image(img, 0, 0);
  // Carrega os pixels para habilitar o acesso e as alterações nos mesmos
  loadPixels();
  int pos1, pos2, aux;
  // Percorre os pixels nas colunas
  for(int y = 0; y < (height/2); y++ ){
    // Percorre os pixels na linha
    for(int x = 0; x < width; x++ ){
      // Calcula a posição do pixel
      pos1 = x + (y * width);
      // Calcula a posição do pixel que será invertido com o pixel atual
      pos2 = (width * (height - y)) - (width - x);
      // Guarda o pixel invertido na variável auxiliar
      aux = img.pixels[pos2];
      // Atribui o pixel atual no pixel invertido
      pixels[pos2] = img.pixels[pos1];
      // Atribui o pixel guardado em "aux" no pixel atual
      pixels[pos1] = aux;
    }
  }
  // Conclui o processo de acesso aos pixels da matriz
  updatePixels();
  // Salva imagem invertida verticalmente
  save("invertida-vertical.jpg");
}
