Veiculo nave;

void setup()
{
  size(500,500);
  nave = new Veiculo();
}


void draw()
{
  background(0);
  nave.display();
  nave.movimenta();
}
