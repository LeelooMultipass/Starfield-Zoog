// arrays for the starfield X, Y and radius + Zoog flying into space
float[] StarfieldX, StarfieldY, StarfieldR;

int numStars;
float maxRadius;
int k;

float zoogX;
float zoogY;

float eyeR;
float eyeG;
float eyeB;

void setup() {
  size(500, 500);
  numStars = 100;
  maxRadius = 2;
  k = 0;
  
  zoogX = width/2;    //zoog starts in the middle of the screen
  zoogY = height + 100;     //zoog starts below the screen
  smooth();
  
  //allocate Starfield arrays
  StarfieldX = new float[numStars];
  StarfieldY = new float[numStars];
  StarfieldR = new float[numStars];
  
  //fill Starfield arrays with random infomation 
  for(int i=0; i<numStars; i++) {
    StarfieldX[i] = random(width);
    StarfieldY[i] = random(height);
    StarfieldR[i] = random(maxRadius);
  }
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  for(int i=0; i< numStars; i++) {
    ellipse(StarfieldX[i], StarfieldY[i], 2*StarfieldR[i], 2*StarfieldR[i]);
  }
  fill(#ffcc66);
  ellipse(k/2, 600-k/2, 40, 40);
  k++;
  fill(#009933);
  rect(0, 450, 500, 50);
  
  //set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //body
  stroke(0);
  fill(150);
  //feature #1   zoogX and zoogY are used for the shape locations
  rect(zoogX,zoogY,20,100);
  
  //head
  stroke(0);
  fill(255);
  ellipse(zoogX,zoogY-30,60,60);
  
  //eyes
  //feature #2  eyeR,eyeG and eyeB are given random values and used in the fill() function
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR,eyeG,eyeB);
  
  ellipse(zoogX-19,zoogY-30,16,32);
  ellipse(zoogX+19,zoogY-30,16,32);
  
  //legs
  stroke(150);
  line(zoogX-10,zoogY+50,zoogX-10,height);
  line(zoogX+10,zoogY+50,zoogX+10,height);
  
  //zoog moves up
  zoogY = zoogY -1;
}
