class Button {
  // Member Variables
  float x, y, w, h;
  char val;
  boolean hover;
  color c1, c2;

  //Constructor
  Button(float x, float y, float w, float h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    hover = false;
    c1 = color(#634D71);
    c2 = color(#E69DE8);
  }


  // Member Methods
  void display() {
    if (hover == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 3);
    fill(255);
    textAlign(CENTER);
    textSize(13);
    text(val, x, y);
  }

  void mouseOver (float tempX, float tempY) {
    if (tempX>x-w/2 && tempX<x+w/2 && tempY>y-h/2 && tempY<y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
