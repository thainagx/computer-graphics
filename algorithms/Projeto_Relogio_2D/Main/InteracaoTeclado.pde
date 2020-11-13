/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
  CÓDIGOS REFERENTE À INTERAÇÃO COM A TECLA C. 
  ALTERA CONTORNO DO RELÓGIO
*/
void Contorno(){
  desenhaRelogio();
  stroke(0, 0, 255);
  noFill();
  ellipse(((width * 0.5) + 10), 263, 275, 270);
              
  stroke(255, 0, 0);
  noFill();
  ellipse(((width * 0.5) + 10), 263, 270, 265);
            
  stroke(0, 255, 0);
  noFill();
  ellipse(((width * 0.5) + 10), 263, 265, 260);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
  CÓDIGOS REFERENTE À INTERAÇÃO COM A TECLA D. 
  FAZ DEGRADÊ NO RELÓGIO
*/

void Degrade(){
  background(102, 205, 170);
  loadPixels();
  pulseira.loadPixels();
  image(pulseira, ((width * 0.5) - 119), ((height * 0.5) - 261));
  noStroke();
      
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(((width * 0.5) + 10), 263, 275, 270);
          
  fill(0, 0, 0);
  ellipse(((width * 0.5) + 10), 263, 270, 265);
      
  fill(0, 0, 0);
  ellipse(((width * 0.5) + 10), 263, 265, 260);
   
  strokeWeight(1);
  fill(0, 0, 255, 50);
  ellipse(((width * 0.5) + 10), 263, 260, 255);
  fill(0, 0, 255, 100);
  ellipse(((width * 0.5) + 10), 263, 230, 225);
  fill(0, 0, 255, 150);
  ellipse(((width * 0.5) + 10), 263, 200, 195);
  fill(0, 0, 255, 170);
  ellipse(((width * 0.5) + 10), 263, 170, 165);
  fill(0, 0, 255, 200);
  ellipse(((width * 0.5) + 10), 263, 140, 135);
  fill(0, 0, 255);
  ellipse(((width * 0.5) + 10), 263, 140, 135);
  textFont(ind, 10);
  fill(255, 0, 75);
  textAlign(CENTER);
  text("GOMES & FRINHANI", ((width * 0.5) + 10), 210);
  mickey();
  data();
  indicadoresSecundarios();
  indicadoresTerciarios();
  indicadoresPrimarios();
  ponteiroHoras();
  ponteiroMinutos();
  ponteiroSegundos();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
  CÓDIGOS REFERENTE À INTERAÇÃO COM A TECLA I. 
  INVERTE CORES DO RELÓGIO
*/

void Inverte(){
  // Carrega os pixels para habilitar o acesso e as alterações nos mesmos
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
}
