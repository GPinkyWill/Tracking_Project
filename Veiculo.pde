class Veiculo
{
 //variaveis
 
 float maxForce, maxSpeed, r;
 PVector pos, vel, acc;
 
 
 //construtor
 Veiculo(int x,int y)
 {
   pos = new PVector(x,y);
   vel = new PVector(0,0);
   acc = new PVector(0,0);
   maxSpeed = 6;
   maxForce = 0.1;
   r = 16;
 }
 //funções
 
   PVector follow(path)
   {
     
     //path following algorithm 
     
     //Step 1 calculate future position
     PVector future = vel.copy();
     future.mult(20);
     future.add(pos);
     fill(255,0,0);
     noStroke();
     circle(future.x, future.y, 16);
     
     //Step 2 Is future on path?
     PVector target = findProjection(path.start, future, path.end);
     fill(0,255,0);
     noStroke();
     circle(target.x, target.y, 16);
     
     float d = dist(future,target);
     if(d > path.radius)
     {
       return seek(target);
     }
     else
     {
       return new PVector(0,0);
     }
     
   }
   
   PVector static seek( PVector target, boolean arrival = false)
   {
     PVector force = new Vector().sub(target, pos);
     float desiredSpeed = maxSpeed;
     if(arrival)
     {
       float slo
     }
   }
 
   
}
