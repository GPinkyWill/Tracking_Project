Veiculo nave;
Caminho path;

void setup()
{
  size(500,500);
  nave = new Veiculo(0,200);
  path = new Caminho(0,250,width,250);
}


void draw()
{
  background(0);
  
  PVector force = nave.follow(path);
  nave.applyForce(force);
  
  path.show();
  nave.update();
  nave.show();
  nave.edges();
}
