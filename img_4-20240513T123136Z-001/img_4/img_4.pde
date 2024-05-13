void setup() {
  size(400, 300);
  noLoop();
}

void draw() {
  PImage img = loadImage("img_4.jpg");
  PImage img2 = createImage(img.width, img.height, RGB);
    
  // Filtro de escala de cinza
  for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int media = (int) (red(img.pixels[pos]) + 
                            green(img.pixels[pos]) + 
                            blue(img.pixels[pos])) / 3;
         img2.pixels[pos] = color(media);
     }
   }

  // Filtro de Limialização
  for(int y = 0; y < img.height; y++) {
    for(int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      if(red(img2.pixels[pos]) > 65 || y < 50 || y > 200 || x < 100 || x > 310) {
        img2.pixels[pos] = color(0);
      }
      else {
        img2.pixels[pos] = color(255);
      }
    }
  }
  
  image(img2, 0, 0);
  save("resultado.jpg");
}
