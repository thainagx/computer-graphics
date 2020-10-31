PImage img;

void setup() {
  size(360, 450);
  img = loadImage("olaf.jpg");
  noLoop();
}

void draw(){
  loadPixels();
  img.loadPixels();
  float angulo = radians(45);
  float w_med, h_med, X, Y;
  int pos, novo;
  for(int y = 0; y < width; y++){
    for(int x = 0; x < height; x++){
      pos = x + y * width;
      w_med = x - width * 0.5;
      h_med = y - height * 0.5;
      X = ((w_med * (-sin(angulo))) + (h_med * cos(angulo)));
      Y = ((w_med * cos(angulo)) + (h_med * sin(angulo)));
      X = X + width * 0.5;
      Y = Y + height * 0.5;
      novo = int(X) + int(Y) * width;
      if(X <= width && X >= 0 && Y <= height && Y >= 0) pixels[novo] = img.pixels[pos];
    }
  }
  updatePixels();
  save("olaf-rotate.jpg");
}
