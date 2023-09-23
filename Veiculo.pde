class Veiculo
{
 //variaveis
 
 float maxForce, maxSpeed, r;
 PVector pos, vel, acc;
 float cr,cg,cb;
 
 
 //construtor
 Veiculo(int x,int y)
 {
   pos = new PVector(x,y);
   vel = new PVector(0,0);
   acc = new PVector(0,0);
   maxSpeed = 4;
   maxForce = 0.1;
   r = 16;
   cr = int(random(50,200));
   cg = int(random(50,200));
   cb = int(random(50,200));
   
 }
 //funções
 
   PVector follow(Caminho path)
   {
     
     //path following algorithm 
     
     //Step 1 calculate future position
     PVector future = vel.copy();
     future.mult(20);
     future.add(pos);
     fill(255,0,0);
     noStroke();
     //circle(future.x, future.y, 16);
     
     //Step 2 Is future on path?
     PVector target = findProjection(path.start, future, path.end);
     fill(0,255,0);
     noStroke();
     //circle(target.x, target.y, 16);
     
     float d = PVector.dist(future,target);
     if(d > path.radius)
     {
       return seek(target, false);
     }
     else
     {
       return new PVector(0,0);
     }
     
   }
   
    PVector seek(PVector target, boolean arrival)
   {
     PVector force = new PVector();
     force = PVector.sub(target, pos);
     float desiredSpeed = maxSpeed;
     if(arrival)
     {
       float slowRadius = 100;
       float distance = force.mag();
       if(distance < slowRadius)
       {
         desiredSpeed= map(distance, 0, slowRadius, 0, maxSpeed);
       }
     }
     force.setMag(desiredSpeed);
     force.sub(vel);
     force.limit(maxForce);
     return force;
   }
   
   void applyForce(PVector force)
   {
     acc.add(force);
   }
   
   void update()
   {
     vel.add(acc);
     vel.limit(maxSpeed);
     pos.add(vel);
     acc.set(0,0);
   }
   void show()
   {
     stroke(cr,cg,cb);
     strokeWeight(2);
     fill(cr,cg,cb);
     push();
     translate(pos.x, pos.y);
     rotate(vel.heading());
     triangle(-this.r, -this.r/2, -this.r, this.r/2, this.r,0);
     pop();
   }
   
   void edges()
   {
     if(this.pos.x > width + this.r)
     {
       this.pos.x = -this.r;
       pos.y =  (int)random(height/2-200, height/2+200);
       println(pos.y);
     }
     else if(this.pos.x < -this.r)
     {
       this.pos.x = width + this.r;
       pos.y = random(height/2-100,height/2+100);
       
     }
     if(this.pos.y > height + this.r)
     {
       this.pos.y = -this.r;
     }
     else if (this.pos.y < -this.r)
     {
       this.pos.y = height + this.r;
     }
   }
   PVector findProjection(PVector pos, PVector a, PVector b)
   {
     PVector v1 = new PVector().sub(a,pos);
     PVector v2 = new PVector().sub(b,pos);
     v2.normalize();
     float sp = v1.dot(v2);
     v2.mult(sp);
     v2.add(pos);
     return v2;
   }
   
}
