float xspeed = 4.8;  // Velocidade da movimentação em X
float yspeed = 4.2;  // Velocidade da movimentação em Y
float xpos, ypos;    // Para o módulo de movimentação, essas serão as variáveis responsáveis pela posição da figura   
int xdirection = 1;  // Esquerda ou direita
int ydirection = 1;  // Topo ou base

float easing = 0.05;
float targetX, targetY;

float x, y;


/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
  CÓDIGOS REFERENTE À INTERAÇÃO COM O BOTÃO ESQUERDO DO MOUSE. 
  MOVIMENTA RELÓGIO
*/

void MovimentaRelogio(){
  background(102, 205, 170);
  targetX = mouseX;
  targetY = mouseY;
  loadPixels();
  pulseira.loadPixels();
  
  float dx = targetX - x;
  x += dx*easing;
  float dy = targetY - y;
  y += dy*easing;
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(x, y, 275, 270);
  
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(x, y, 270, 265);
  
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(x, y, 265, 260);
  image(pulseira, (x - 125), (y - 224));
  
  
  strokeWeight(1);
  stroke(255, 100, 0);
  fill(0, 0, 0);
  ellipse(x, y, 260, 255);
  fill(128.01, 128.01, 128.01, 85);
  ellipse(x, y, 260, 255);
  textFont(ind, 10);
  fill(255, 0, 75);
  textAlign(CENTER);
  text("GOMES & FRINHANI", x, y-53);
  mickeyMov();
  dataMov();
  ponteiroHorasMov();
  ponteiroMinutosMov();
  ponteiroSegundosMov();
  indicadoresSecundariosMov();
  indicadoresPrimariosMov();
  indicadoresTerciariosMov();
}

void mickeyMov(){
  noStroke();
  fill(0, 0, 0);
  ellipse(x, y, 50, 50);
  ellipse(x-27, y-23, 30, 30);
  ellipse(x+28, y-23, 30, 30);
}

void dataMov(){
  String d = String.valueOf(dia);
  String m = String.valueOf(mes);
  String year = String.valueOf(ano);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(x-80, y-16, 20, 20);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(d, x-70,y);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(x+60, y-16, 20, 20);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(m, x+70, y);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(x-21, y+55, 40, 25);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(year, x, y+74);
}

void indicadoresPrimariosMov(){
  int cont = 0;
  for (float i = 0; i < 2*PI; i+= PI/2){
   float Px = x + cos(i) * (raio-150);
   float Py = y + sin(i) * (raio-150);
   if (cont == 0){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    text("3", Px, Py);
   }
   else if(cont == 1){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    text("6", Px, Py);
   }
   else if(cont == 2){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    text("9", Px, Py);
   }
   else if(cont == 3){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    text("12", Px, Py);
   }
   cont++;
 }
}

void indicadoresSecundariosMov(){
  for (float f = 0; f < degrees(2 * PI); f += degrees(ang)) {
    float Vx = x + cos(radians(f)) * (raio-150);
    float Vy = y + sin(radians(f)) * (raio-150);
    if (f != 0 && f != degrees(PI/2) && f != degrees(3*PI/2) && f != degrees(PI)){
      noStroke();
      fill(128.01, 128.01, 128.01);
      ellipse(Vx, Vy, 1.5, 1.5); 
    }
  }
}

void indicadoresTerciariosMov(){
   for (float i = 0; i < degrees(2 * PI); i += degrees(PI/6)){
     float Px = x + cos(radians(i)) * (raio-150);
     float Py = y + sin(radians(i)) * (raio-150);
     if (i !=0 && i != degrees(PI/2) && i != degrees(3*PI/2) && i != degrees(PI)){
       noStroke();
       fill(0, 0, 0);
       ellipse (Px, Py, 3, 3);
     }
   }
}

void ponteiroHorasMov(){
  float Xh = x + cos(posPonteiroHoras) * 80;
  float Yh = y + sin(posPonteiroHoras) * 80;
  strokeWeight(5);
  stroke(128, 128, 128);
  line(x, y, Xh, Yh);
}

void ponteiroMinutosMov(){
  float Xm = x + cos(posPonteiroMinutos) * 112;
  float Ym = y + sin(posPonteiroMinutos) * 112;
  strokeWeight(5);
  line(x, y, Xm, Ym);
}

void ponteiroSegundosMov(){
  float Xs = x + cos(posPonteiroSegundos) * 112;
  float Ys = y + sin(posPonteiroSegundos) * 112;
  strokeWeight(2);
  stroke(100, 250, 50);
  line(x, y, Xs, Ys);
  fill(0, 0, 0);
  ellipse(x, y, 2.5, 2.5);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
  CÓDIGOS REFERENTE À INTERAÇÃO COM O BOTÃO DIREITO DO MOUSE. 
  BOLA RELÓGIO
*/

void BolaRelogio(){
  background(102,205,170);
  ellipseMode(RADIUS);
  // Altera a posição do desenho
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  // Teste para ver se a forma excede os limites da tela
  // Em caso afirmativo, inverta sua direção multiplicando por -1
  if (xpos > width-raio/2 || xpos < raio/2) {
    xdirection *= -1;
  }
  if (ypos > height-raio/2 || ypos < raio/2) {
    ydirection *= -1;
  }
    
  // Desenha o display do relógio
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(xpos, ypos, 137.5, 135);
  
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(xpos, ypos, 135, 132.5);
  
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(xpos, ypos, 132.5, 130);
  
  strokeWeight(1);
  stroke(255, 100, 0);
  fill(0, 0, 0);
  ellipse(xpos, ypos, 260*0.5, 255*0.5);
  fill(128.01, 128.01, 128.01, 85);
  ellipse(xpos, ypos, 260*0.5, 255*0.5);
  mickeyBola();
  dataBola();
  textFont(ind, 10);
  fill(255, 0, 75);
  textAlign(CENTER);
  text("GOMES & FRINHANI", xpos, ypos-53);
  ponteiroHorasBola();
  ponteiroMinutosBola();
  ponteiroSegundosBola();
  indicadoresSecundariosBola();
  indicadoresPrimariosBola();
  indicadoresTerciariosBola();
  
  ellipseMode(CENTER);
}
void ponteiroHorasBola(){
  float Xh = xpos + cos(posPonteiroHoras) * 80;
  float Yh = ypos + sin(posPonteiroHoras) * 80;
  strokeWeight(5);
  stroke(128, 128, 128);
  line(xpos, ypos, Xh, Yh);
}

void ponteiroMinutosBola(){
  float Xm = xpos + cos(posPonteiroMinutos) * 112;
  float Ym = ypos + sin(posPonteiroMinutos) * 112;
  strokeWeight(5);
  line(xpos, ypos, Xm, Ym);
}

void ponteiroSegundosBola(){
  float Xs = xpos + cos(posPonteiroSegundos) * 112;
  float Ys = ypos + sin(posPonteiroSegundos) * 112;
  strokeWeight(2);
  stroke(100, 250, 50);
  line(xpos, ypos, Xs, Ys);
  fill(0, 0, 0);
  ellipse(xpos, ypos, 2.5, 2.5);
}

void indicadoresPrimariosBola(){
  int cont = 0;
  for (float i = 0; i < 2*PI; i+= PI/2){
   float Px = xpos + cos(i) * (raio-150);
   float Py = ypos + sin(i) * (raio-150);
   if (cont == 0){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("3", Px, Py);
   }
   else if(cont == 1){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("6", Px, Py);
   }
   else if(cont == 2){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("9", Px, Py);
   }
   else if(cont == 3){
    noStroke();
    textFont(ind, 16);
    fill(255, 255, 255);
    textAlign(CENTER);
    text("12", Px, Py);
   }
   cont++;
 }
}

void indicadoresSecundariosBola(){
  for (float f = 0; f < degrees(2 * PI); f += degrees(ang)) {
    float Vx = xpos + cos(radians(f)) * (raio-150);
    float Vy = ypos + sin(radians(f)) * (raio-150);
    if (f != 0 && f != degrees(PI/2) && f != degrees(3*PI/2) && f != degrees(PI)){
      noStroke();
      fill(128.01, 128.01, 128.01);
      ellipse(Vx, Vy, 1.5, 1.5); 
    }
  }
}

void indicadoresTerciariosBola(){
   for (float i = 0; i < degrees(2 * PI); i += degrees(PI/6)){
     float Px = xpos + cos(radians(i)) * (raio-150);
     float Py = ypos + sin(radians(i)) * (raio-150);
     if (i !=0 && i != degrees(PI/2) && i != degrees(3*PI/2) && i != degrees(PI)){
       noStroke();
       fill(0, 0, 0);
       ellipse (Px, Py, 3, 3);
     }
   }
}

void dataBola(){
  String d = String.valueOf(dia);
  String m = String.valueOf(mes);
  String y = String.valueOf(ano);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(xpos-80, ypos-16, 20, 20);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(d, xpos-70,ypos);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(xpos+60, ypos-16, 20, 20);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(m, xpos+70, ypos);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect(xpos-21, ypos+55, 40, 25);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(y, xpos, ypos+74);
}

void mickeyBola(){
  noStroke();
  fill(0, 0, 0);
  ellipse(xpos, ypos, 50/2, 50/2);
  ellipse(xpos-27, ypos-23, 30/2, 30/2);
  ellipse(xpos+28, ypos-23, 30/2, 30/2);
}
