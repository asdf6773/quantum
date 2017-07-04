class particle {
  // color c;
  float r, g, b;
  trailer t;
  PVector x;
  PVector v;
  PVector f;
  float lifespan;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  particle() {
    // c = color(random(10,60),50,random(100,255));
    r = random(100, 160);
    g = 255;
    b= 255;
    // x = new PVector(random(mouseX-30, mouseX+30), random(mouseY-30, mouseY+30));
    x = new PVector(random(width), random(height));
    v = new PVector();
    f = new PVector();
    t = new trailer(r, g, b);
    lifespan = 100.0;
    maxspeed = random(2, 3);

    maxforce=  random(0.2, 0.3);
  }
  void update() {
    //r = map(mouseX,0,width,0,255);
    //b = map(mouseY,0,height,0,255);
    //g = map(mouseY,0,height,0,255);
    v.add(f);
    f = new PVector(0, 0);
    x.add(v);

    if ((x.x>=10)&&(x.y>=10)&&(x.x<=width-10)&&(x.y<=height-10)) {
      t.update(int(x.x), int(x.y), r, g, b);
    }
    // point(int(x.x), int(x.y));
    v.limit(6.5);
    f.mult(0);
    lifespan-=1.0;
  }


  void follow(FlowField flow) {
    // What is the vector at that spot in the flow field?
    PVector desired = flow.lookup(x);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, v);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    f.add(force);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}