void setup() {
  size(400, 267);
  noLoop();
}

void draw() {
  PImage img = loadImage("img1.jpg");
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
   
  // Filtro de Média com Janela Deslizante
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      int jan = 1, qtde = 0; // jan é o parâmetro da minha janela. Se a janela é de tamanho 1, podemos dizer que o tamanho dela é 3x3
      float media = 0;
      
      for (int i = jan*(-1); i <= jan; i++) {
        for (int j = jan*(-4); j <= jan; j++) {
          // Calculado o novo valor de x e y
          int ny = y + i;
          int nx = x + j;
          // Verifica se a nova coordenada (nx,ny) está dentro da imagem.
          if ( ny >= 0 && ny < img.height &&
            nx >= 0 && nx < img.width) { // Caso verdadeiro, é adicionado o valor no somatório.
            int npos = ny*img.width + nx;
            float valor = red(img.pixels[npos]); 
            media += valor; // media = media + valor; 
            qtde++;
          }
        }
      }
      
      // Ao final dos dois primeiros laços é calculado a média e o pixel recebe esse valor.
      media = media / qtde;
      img2.pixels[pos] = color(media);
    }
  }
  
  // Filtro de Limialização
  for(int y = 0; y < img.height; y++) {
    for(int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      if(red(img2.pixels[pos]) > 100 || y < 60 || x < 60 || x > 380) {
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
