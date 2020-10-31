PImage img;

void setup(){
  // Define as dimensões da tela
  size(400, 400);
  // Carrega a imagem selecionada
  img = loadImage("tarefa-03-img.png");
}

void draw(){
  // Exibe a imagem selecionada
  image(img, 0, 0);
  // Carrega os pixels para habilitar o acesso e as alterações nos mesmos
  loadPixels();
  // Carrega os pixels da imagem
  img.loadPixels();
  // Percorre os pixels nas colunas
  for(int y = 0; y < height; y++ ){
    // Percorre os pixels na linha
    for(int x = 0; x < width; x++ ){
      // Calcula a posição do pixel
      int pos = x + y * width;
      // Guarda o valor do componente red do pixel
      float r = red(img.pixels[pos]);
      // Guarda o valor do componente green do pixel
      float g = green(img.pixels[pos]);
      // Guarda o valor do componente blue do pixel
      float b = blue(img.pixels[pos]);
      // Faz a inversão de cor no pixel
      pixels[pos] = color(255-r, 255-g, 255-b);
    }
  }
  // Conclui o processo de acesso aos pixels da matriz
  updatePixels();
}

void mousePressed(){
  save("tarefa-03-img-invertida.png");
}
