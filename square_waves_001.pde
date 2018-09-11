// https://www.openprocessing.org/sketch/388175
// Square Waves
// by David Crooks

Agent[] agents;
int  numPerSide =20;
int a=1;
float theta=0;
PVector center, vertex;

void setup() {
  size(3500,3500);
  background(0);
  noStroke();
  fill(0);
  
//  noLoop();
 
  float unit= width/float(numPerSide);
  agents= new Agent[numPerSide*numPerSide];
  
  for (int i = 0; i< numPerSide; i++)
  {
    for (int j = 0; j< numPerSide; j++)
    {
      agents[i*numPerSide+j] = new Agent(i*unit,j*unit, unit,unit, i*j  );
    }
  }
}

void draw() {
   background(255);

   for (int i =0; i< numPerSide*numPerSide; i++)
   {
    agents[i].display();
    agents[i].evolve(1);
   }
   save("test-20-" + frameCount + " .png");
   println("saved test-20-" + frameCount + " .png");
  // exit();
}

PVector goldenPoint(int n)
{
  float theta = 2.39996*n;
  float r=sqrt(n);
  return new PVector(r*sin(theta),r*cos(theta));
}

class Agent {
  float x, y,w,h,lamda;

  Agent() { 
    x=1;
    y=1;
  }
  
  Agent(float x_pos, float y_pos,float wd,float ht,float l) {
    x = x_pos;
    y = y_pos;
    w=wd;
    h=ht;
    lamda=l;
  }
  
  void evolve(float dt) {
    lamda=(lamda+dt)%w;
  }
  
  void display() {
    noStroke();
    fill(0);
    quad(x,y+lamda, x+lamda,y+h,x+w,y+h-lamda,x+w-lamda, y );
  }
}
