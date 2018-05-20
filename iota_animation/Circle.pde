class Circle {

  float x;
  float y;
  float w;
  float h;

  float ox;
  float oy;
  float ow;
  float oh;

  float tx;
  float ty;
  float tw;
  float th;

  float steps = 0;
  float maxSteps = 30;

  public Circle(float ox, float oy, float ow, float oh, float tx, float ty, float tw, float th) {
    this.ox = ox;
    this.oy = oy;
    this.ow = ow;
    this.oh = oh;

    this.tx = tx;
    this.ty = ty;
    this.tw = tw;
    this.th = th;
  }

  void animate(PGraphics pg) {

    if (steps >= maxSteps) {
      steps = 0;
    }

    float dx = (tx - ox) / maxSteps;
    float dy = (ty - oy) / maxSteps;

    float dw = (tw - ow) / maxSteps;
    float dh = (th - oh) / maxSteps;

    if ((int)this.tw == 0 || (int)this.th == 0) {
      //println((int)this.tw, (int)this.th, (maxSteps / steps));

      pg.fill((steps/maxSteps) * 255);
      //fill(255, 0, 0);
      w = ow;
      h = oh;
      //w = ow + dw * steps;
      //h = oh + dh * steps;
    } else {
      pg.fill(0);
      w = ow + dw * steps;
      h = oh + dh * steps;
    }

    x = ox + dx * steps;
    y = oy + dy * steps;

    if (pg == null) {
      ellipse(x, y, w, h);
    } else {
      pg.ellipse(x, y, w, h);
    }

    steps++;
  }
}
