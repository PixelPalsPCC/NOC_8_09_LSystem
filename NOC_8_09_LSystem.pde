// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

LSystem lsys;
Turtle turtle;

void setup() {
  size(600, 600);
  
  // Create an empty ruleset
   Rule[] ruleset = new Rule[2];
   // Fill with two rules (These are rules for the Sierpinksi Gasket Triangle)
   ruleset[0] = new Rule('F',"F--F--F--G");
   ruleset[1] = new Rule('G',"GG");
   // Create LSystem with axiom and ruleset
   lsys = new LSystem("F--F--F",ruleset);
   turtle = new Turtle(lsys.getSentence(),width*2,TWO_PI/3);
   

  /*
  Rule[] ruleset = new Rule[1];
   ruleset[0] = new Rule('F',"F[F]-F+F[--F]+F-F");
  //  ruleset[0] = new Rule['F',"FF+[+F-F-F]-[-F+F+F]");
   lsys = new LSystem("F-F-F-F",ruleset);
   turtle = new Turtle(lsys.getSentence(),width-1,PI/2);
   */

  // Rule[] ruleset = new Rule[1];
  // ruleset[0] = new Rule('F', "FF+[+F-F-F]-[-F+F+F]");
  // lsys = new LSystem("F", ruleset);
  // turtle = new Turtle(lsys.getSentence(), height/3, radians(25));
}

void draw() {
  background(255);  
  fill(0);
  //text("Click mouse to generate", 10, height-10);

  translate(width/2, height);
  rotate(-PI/2);
  turtle.render();
  noLoop();
}

int counter = 0;

void mousePressed() {
  if (counter < 5) {
    pushMatrix();
    lsys.generate();
    //println(lsys.getSentence());
    turtle.setToDo(lsys.getSentence());
    turtle.changeLen(0.5);
    popMatrix();
    redraw();
    counter++;
  }
}

