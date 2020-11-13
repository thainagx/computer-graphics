int horas = hour(); // Captura as horas do sistema
int minutos = minute(); // Captura os minutos do sistema
int segundos = second(); // Captura os segundos do sistema
int dia = day(); // Captura o dia do sistema
int mes = month(); // Captura o mês do sistema
int ano = year(); // Captura o ano do sistema

float posPonteiroHoras = ((horas * PI)/6) + ((3 * PI) / 2); // determina a posição do ponteiro das horas
float posPonteiroMinutos = ((minutos * PI) / 30) + ((3 * PI) / 2); // determina a posição do ponteiro dos minutos
float posPonteiroSegundos = ((segundos * PI) / 30) + ((3 * PI) / 2); // determina a posição do ponteiro dos segundos

float ang = ((2 * PI) / 60);

void Relogio(){
  desenhaRelogio();
  
  //Realiza a mudança de angulação do ponteiro dos minutos
  if(minutos != minute()){
    minutos = minute();
    posPonteiroMinutos = ((minutos * PI) / 30) + ((3 * PI) / 2);
  }
  //Realiza a mudança de angulação do ponteiro das horas
  if(horas != hour()){
    horas = hour();
    posPonteiroHoras = ((horas * PI) / 6) + ((3 * PI) / 2);
  }
  //Realiza a mudança de angulação do ponteiro dos segundos
  if(segundos != second()){
    segundos = second();
    posPonteiroSegundos = ((segundos * PI) / 30) + ((3 * PI) / 2);
  }
  
}

void desenhaRelogio(){
  background(102,205,170);
  loadPixels();
  pulseira.loadPixels();
  image(pulseira, ((width * 0.5) - 119), ((height * 0.5) - 261));
  
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(((width * 0.5) + 10), 263, 275, 270);
  
  strokeWeight(1);
  stroke(255, 100, 0);
  fill(0, 0, 0);
  ellipse(((width * 0.5) + 10), 263, 260, 255);
  fill(128.01, 128.01, 128.01, 85);
  ellipse(((width * 0.5) + 10), 263, 260, 255);
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

void mickey(){
  noStroke();
  fill(0, 0, 0);
  ellipse(((width * 0.5) + 10), 263, 50, 50);
  ellipse((((width * 0.5) + 10) - 27), 240, 30, 30);
  ellipse((((width * 0.5) + 10) + 28), 240, 30, 30);
}

void data(){
  String d = String.valueOf(dia);
  String m = String.valueOf(mes);
  String y = String.valueOf(ano);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect((((width * 0.5) + 10) - 80), 247, 20, 20);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(d, (((width * 0.5) + 10) - 70), 263);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect((((width * 0.5) + 10) + 60), 247, 20, 20);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(m, (((width * 0.5) + 10) + 70), 263);
  stroke(128.01, 128.01, 128.01, 85);
  fill(0, 0, 0);
  rect((((width * 0.5) + 10) - 21), 318, 40, 25);
  textFont(ind, 16);
  fill(128.01, 128.01, 128.01, 200);
  textAlign(CENTER);
  text(y, ((width * 0.5) + 10), 337);
}

void ponteiroHoras(){
  float Xh = ((width * 0.5) + 10) + cos(posPonteiroHoras) * 80;
  float Yh = 263 + sin(posPonteiroHoras) * 80;
  strokeWeight(5);
  stroke(128, 128, 128);
  line(((width * 0.5) + 10), 263, Xh, Yh);
}

void ponteiroMinutos(){
  float Xm = ((width * 0.5) + 10) + cos(posPonteiroMinutos) * 112;
  float Ym = 263 + sin(posPonteiroMinutos) * 112;
  strokeWeight(5);
  line(((width * 0.5) + 10), 263, Xm, Ym);
}

void ponteiroSegundos(){
  float Xs = ((width * 0.5) + 10) + cos(posPonteiroSegundos) * 112;
  float Ys = 263 + sin(posPonteiroSegundos) * 112;
  strokeWeight(2);
  stroke(100, 250, 50);
  line(((width * 0.5) + 10), 263, Xs, Ys);
  fill(0, 0, 0);
  ellipse(((width * 0.5) + 10), 263, 5, 5);
}

void indicadoresPrimarios(){
  int cont = 0;
  for (float i = 0; i < 2*PI; i+= PI/2){
   float Px = ((width * 0.5) + 10) + cos(i) * (raio-150);
   float Py = 263 + sin(i) * (raio-150);
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
    textAlign(CENTER);
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
    textAlign(CENTER);
    text("12", Px, Py);
   }
   cont++;
 }
}

void indicadoresSecundarios(){
  for (float f = 0; f < degrees(2 * PI); f += degrees(ang)) {
    float Vx = ((width * 0.5) + 10) + cos(radians(f)) * (raio-150);
    float Vy = 263 + sin(radians(f)) * (raio-150);
    if (f != 0 && f != degrees(PI/2) && f != degrees(3*PI/2) && f != degrees(PI)){
      noStroke();
      fill(128.01, 128.01, 128.01);
      ellipse(Vx, Vy, 3, 3); 
    }
  }
}

void indicadoresTerciarios(){
   for (float i = 0; i < degrees(2 * PI); i += degrees(PI/6)){
     float Px = ((width * 0.5) + 10) + cos(radians(i)) * (raio-150);
     float Py = 263 + sin(radians(i)) * (raio-150);
     if (i !=0 && i != degrees(PI/2) && i != degrees(3*PI/2) && i != degrees(PI)){
       noStroke();
       fill(0, 0, 0);
       ellipse (Px, Py, 6,6);
       
     }
   }
}
