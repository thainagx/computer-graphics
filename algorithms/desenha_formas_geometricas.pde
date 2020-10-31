void setup(){
  // Define o tamanho da tela
  size(400, 400);
}

void draw(){
  // Define a cor de fundo da tela
  background(175, 238, 238);
  // Cria prédio
  create_building();
  // Cria janela1
  create_window(238, 201, 0, 73, 110, 40, 30, 93, 110, 93, 140, 1);
  //Cria janela2
  create_window(0, 0, 0, 136, 110, 40, 30, 0, 0, 0, 0, 0);
  // Cria janela 3
  create_window(238, 201, 0, 73, 150, 40, 30, 93, 150, 93, 180, 1);
  // Cria janela4
  create_window(238, 201, 0, 136, 150, 40, 30, 156, 150, 156, 180, 1);
  // Cria janela5
  create_window(0, 0, 0, 73, 190, 40, 30, 0, 0, 0, 0, 0);
  // Cria janela6
  create_window(238, 201, 0, 136, 190, 40, 30, 156, 190, 156, 220, 1);
  // Cria janela7
  create_window(238, 201, 0, 73, 230, 40, 30, 93, 230, 93, 260, 1);
  // Cria janela8
  create_window(238, 201, 0, 136, 230, 40, 30, 156, 230, 156, 260, 1);
  // Cria janela9
  create_window(238, 201, 0, 73, 270, 40, 30, 93, 270, 93, 300, 1);
  // Cria janela10
  create_window(0, 0, 0, 136, 270, 40, 30, 0, 0, 0, 0, 0);
  // Cria porta
  create_door();
  // Cria árvore
  create_tree();
}

void create_building(){
  // Define a cor do prédio
  fill(156, 156, 156);
  // Define as medidas e posicionamentos do prédio
  rect(50, 100, 150, 300);
}

void create_window(int r, int g, int b, float posX, float posY, float w, float h, float divX1, float divY1, float divX2, float divY2, int status){
  // Define cor da janela
  fill(r, g, b);
  // Define medidas e posição da janela
  rect(posX, posY, w, h);
  // Se o status da janela for 1, significa que está aberta, então, cria divisória da janela
  if(status == 1) create_window_partition(divX1, divY1, divX2, divY2);
}

void create_window_partition(float x1, float y1, float x2, float y2){
  // Define divisória da janela
  line(x1, y1, x2, y2);
}

void create_door(){
  // Define a cor da porta
  fill(108, 123, 139);
  // Define as medidas e posicionamentos da porta
  rect(100, 340, 50, 60);
  // Define divisória da porta
  line(125, 340, 125, 400);
  // Define cor da maçaneta1
  fill(0, 0, 0);
  // Define as medidas e posicionamento da maçaneta1
  circle(115, 370, 3);
  // Define cor da maçaneta2
  fill(0, 0, 0);
  // Define as medidas e posicionamento da maçaneta2
  circle(135, 370, 3);
}

void create_tree(){
  // Define cor do tronco da árvore
  fill(160, 82, 45);
  // Define medidas e posicionamento do tronco da árvore
  rect(300, 330, 20, 410);
  // Define cor da folhagem
  fill(60, 179, 113);
  circle(310, 320, 80);
}

void mousePressed(){
  save("tarefa-02.png");
}
