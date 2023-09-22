Veiculo nave;
Caminho path;

void setup()
{
  size(500,500);
  nave = new Veiculo();
  path = new Caminho(0,250,width,250);
}


void draw()
{
  background(0);
  
  PVector force = nave.follow(path);
  nave.applyForce(force);
  
  path.display();
  nave.display();
  nave.movimenta();
}
