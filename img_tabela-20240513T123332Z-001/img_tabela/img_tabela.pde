PImage groundTruth; // imagem da ground truth
PImage resultado; // imagem resultado da segmentação

int fp = 0; // contador de falsos positivos
int fn = 0; // contador de falsos negativos

void setup() {
  groundTruth = loadImage("gt5.png");
  resultado = loadImage("r5.jpg");
  
  // percorre todos os pixels das imagens
  for (int x = 0; x < groundTruth.width; x++) {
    for (int y = 0; y < groundTruth.height; y++) {
      // compara os valores dos pixels
      int gt = round(brightness(groundTruth.get(x, y))); // valor da ground truth arredondado para o inteiro mais próximo
      int res = round(brightness(resultado.get(x, y))); // valor do resultado
      
      // verifica se é falso positivo ou falso negativo
      if (res != 0 && gt == 0) { // falso positivo
        fp++;
      } else if (res == 0 && gt != 0) { // falso negativo
        fn++;
      }
    }
  }
  
  int somaFalsos = fp + fn;

  int quantidadePixels = groundTruth.width * groundTruth.height;
  String acuracia = String.format("%.2f", ((quantidadePixels - somaFalsos) * 100.0) / quantidadePixels); 
  println("Falso positivo: " + fp);
  println("Falso negativo: " + fn);
  println("Acurácia: " + acuracia + "%");
}
