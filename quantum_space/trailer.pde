class trailer {
  
  float r, g, b;
  PVector circlePosition;
  ArrayList<PVector> circleTrail;
  int trailSize =20;
  trailer(float tr, float tg, float tb) {
    circlePosition = new PVector(width*0.5, width*0.5);
    circleTrail = new ArrayList<PVector>();
    // ct=c;
    r=tr;
    g=tg;
    b=tb;
  }

  void update(int posX, int posY, float tr, float tg, float tb) {
    int trailLength;
    r=tr;
    g=tg;
    b=tb;
    circlePosition = new PVector(posX, posY);
    circleTrail.add(circlePosition);

    trailLength = circleTrail.size() - 2;
    //println(trailLength);

    for (int i = 0; i < trailLength; i++) {
      PVector currentTrail = circleTrail.get(i);
      PVector previousTrail = circleTrail.get(i + 1);
      //  stroke(random(100,255),0,random(0,255), 255*i/trailLength);
      strokeWeight(map(float(i),0,30,0.1,5));
      stroke(r, g, b, 255*i/trailLength);
      line(
        currentTrail.x, currentTrail.y, 
        previousTrail.x, previousTrail.y
        );
    }

    // ellipse(circlePosition.x, circlePosition.y, 10, 10);

    if (trailLength >= trailSize) {
      circleTrail.remove(0);
    }
  }
}