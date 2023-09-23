Veiculo [] nave = new Veiculo [20];
Caminho path;

void setup()
{
  size(1000,1000);
  
  path = new Caminho(0,height/2,width,height/2);
  
  for (int i = 0; i < nave.length; i++)
  {
    nave[i] = new Veiculo(0,(int)random(height/2-200,height/2+200));
    nave[i].vel.x =(int)random(-4,4);
  }
}


void draw()
{
  background(0);
  for (int i = 0; i < nave.length; i++)
  {
    PVector force = nave[i].follow(path);
    nave[i].applyForce(force);
  
   
    nave[i].update();
    nave[i].show();
    nave[i].edges();
  }
   path.show();
  
}
