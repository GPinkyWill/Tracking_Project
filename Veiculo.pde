class Veiculo
{
 //variaveis
 
 int largura, comprimento, posx, posy, velocidade;
 
 
 
 //construtor
 Veiculo()
 {
   largura = 20;
   comprimento = 30;
   posx = -20;
   posy = (int) random (height);
   velocidade = 5;
 }
 //funções
  void display()
  {
    stroke(0);
    fill(0,0,255);
    triangle(posx, posy - largura/2, posx, posy + largura/2, posx + comprimento, posy);
  }
  
  void movimenta()
  {
    posx += velocidade;
    if( posx > width + comprimento)
    {
     posx = (int) random (-50,-20);
     posy = (int) random (0 + largura/2, height - largura/2);
    }
  }
  
  
  
}
