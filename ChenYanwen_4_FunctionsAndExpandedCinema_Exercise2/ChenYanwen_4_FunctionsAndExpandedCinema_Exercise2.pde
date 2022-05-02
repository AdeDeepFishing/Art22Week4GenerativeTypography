/*
 * Course: ART 22  - Computer Programming for the Arts
 * Assignment: Week 4 Practice 2 FunctionsAndExpandedCinema
 *
 * by Yanwen Chen
 *
 * Initiated: 2022/04/23
 * Last updated: 2022/04/23
 *
 * CITATIONS: List all sources you used for this assignment.
 * https://github.com/AmnonOwed/CAN_GenerativeTypography/blob/master/Image-Based/AggregateDrawing/AggregateDrawing.pde
 *
 * NOTE: This is where you write any notes you would like
 * to leave yourself or others using your code.
 *
 * Click the mouse to see the differents
 *
 * */

int drawSpeed = 300; // number of drawn shapes per draw() call
int drawMode = 0; // move through the drawing modes by clicking the mouse

color PGRAPHICS_COLOR = #C3E9E6;

int adjustNum=80;

PGraphics pg;

void setup() {
  //normally we dont put background in setup(), but this case is a little bit different
  background(#ffc8d2);
  size(1000, 800);

  colorMode(HSB, 360, 100, 100); // change to Hue-Saturation-Brightness color mode
  rectMode(CENTER);

  // create and draw to PPraphics (see Getting Started > UsingPGraphics example)
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.textSize(500);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  drawCYW();
  pg.endDraw();
}

void drawC() {
  pg.text("C", pg.width/2, pg.height/2-adjustNum);
}
void drawY() {
  pg.text("Y", pg.width/2, pg.height/2-adjustNum);
}
void drawW() {
  pg.text("W", pg.width/2, pg.height/2-adjustNum);
}
void drawCYW() {
  pg.text("CYW", pg.width/2, pg.height/2-adjustNum);
}


void draw() {

  // This for loop ensures the code is repeated 'drawSpeed' times
  for (int i=0; i<drawSpeed; i++) {
    // pick a random coordinate
    int x = (int) random(width);
    int y = (int) random(height);
    // check if the coordinate is inside the text (in the offscreen PGraphics)
    boolean insideText = (pg.get(x, y) == PGRAPHICS_COLOR);
    // if it is indeed, then draw a shape in the main screen
    if (insideText) {
      // switch based on the current draw mode (move through them by clicking the mouse)
      // each drawing mode has custom settings (stroke, fill, shape, rotation)
      pushMatrix();
      translate(x, y);
      switch (drawMode) {
      case 0:
        float er = random(5, 45);
        color ec = color(random(100), 50, 200);
        stroke(0);
        fill(ec);
        ellipse(0, 0, er, er);
        break;
      case 1:
        float td = random(3, 10);
        float tr = random(TWO_PI);
        color tc = color(random(180, 300), 100, random(50, 100));
        noStroke();
        fill(tc);
        rotate(tr);
        triangle(0, -td, -td, td, td, td);
        break;
      case 2:
        float rw = random(5, 20);
        float rh = random(5, 50);
        float rr = random(TWO_PI);
        color rc = color(random(20), random(70, 100), random(20, 100));
        stroke(0);
        fill(rc);
        rotate(rr);
        rect(0, 0, rw, rh);
        break;
      }
      popMatrix();
    }
  }
}

void mousePressed() {
  background(#ffc8d2); // clear the screen when changing drawing mode
  drawMode = ++drawMode%3; // move through 3 drawing modes (0, 1, 2)
}
