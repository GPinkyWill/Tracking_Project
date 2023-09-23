class Caminho
{
  //variaveis
  PVector start, end;
  float radius = 20;
  
  
  //construtor
  
  Caminho(int x1, int y1, int x2, int y2)
  {
    start = new PVector(x1,y1);
    end = new PVector(x2,y2);
  }
  //funções
  void show()
  {
    stroke(255);
    strokeWeight(2);
    line(this.start.x, this.start.y, this.end.x, this.end.y);
    
    stroke(255,100);
    strokeWeight(radius*2);
    line(this.start.x, this.start.y, this.end.x, this.end.y);
  }



}
