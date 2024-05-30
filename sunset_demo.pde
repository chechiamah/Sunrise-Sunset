//show me how to do this step by step with the following code
float sunRadius;      // Sun's radius
color skyColor;  // Sky color
color skyColor2;
color skyColor3;
color skyColor4;
color skyColor5;
color skyColor6;
color sunColor;       // Sun color
float fadeSpeed = 1;  // Speed of the fade effect
int fadeDirection = 1; // Direction of the fade effect (1 = fade in, -1 = fade out)
float fadeInterval = 60 * 5; // Time interval for the fade effect (5 seconds)
float sunY;           // Sun's vertical position
PFont font;
void setup() {

  
  size(800, 600);
  
  font = loadFont("aAbstractGroovy-48.vlw");
  
  displayDensity(1);
  sunRadius = 200;
  skyColor = color(255, 153, 51); // Orange
  skyColor2 = color(250, 244, 64); // Orange
  skyColor3 = color(233, 205, 61); // Orange
  skyColor4 = color(225, 205, 61); // Orange
  skyColor5 = color(217, 190, 6); // Orange
  skyColor6 = color(202, 176, 6); // Orange
  sunColor = color(255, 255, 0); // Yellow
  sunY = height * 0.4; // Initial sun position
}

void draw() {
  // Calculate the fade amount based on time
  float fadeAmount = map(sin(frameCount * TWO_PI / fadeInterval), -1, 1, 0, 255);
  
  // Update sky and sun colors with fade effect
  skyColor = lerpColor(color(0, 0, 102), color(255, 102, 102), fadeAmount / 255.0);
  skyColor2 = lerpColor(color(0, 0, 102), color(255, 102, 123), fadeAmount / 254.0);
  skyColor3 = lerpColor(color(0, 0, 102), color(250, 106, 140), fadeAmount / 253.0);
  skyColor4 = lerpColor(color(0, 0, 102), color(250, 106, 158), fadeAmount / 252.0);
  skyColor5 = lerpColor(color(0, 0, 102), color(240, 111, 174), fadeAmount / 251.0);
  skyColor6 = lerpColor(color(0, 0, 102), color(240, 116, 190), fadeAmount / 250.0);
 
  sunColor = lerpColor(color(255, 255, 0), color(255, 102, 0), fadeAmount / 255.0);

  // Move the sun down as it fades
  sunY += fadeSpeed * fadeDirection;
  
  //// Reverse fade direction when the sun reaches the bottom
  //if (sunY > height * 0.75) {
  //  fadeDirection = -1;
  //}
  //if (sunY < height * 0.5) {
  //  sunY +=1;
  //  fadeDirection = 1;
  //}
  // Set background color
  background(skyColor);
  fill(skyColor2);
  //stroke(0);
  
  // set gradient colors 
  fill(skyColor2);
  //stroke(0);
  rect(0, 60, width, height);
  fill(skyColor3);
  rect(0, 120, width, height);
  fill(skyColor4);
  rect(0, 165, width, height);
  fill(skyColor5);
  rect(0, 200, width, height);
   fill(skyColor6);
  rect(0, 225, width, height);
  
  // Draw sun as a radial gradient
  for (int r = int(sunRadius); r >= 0; r--) {
    float gradient = map(r, 0, sunRadius, 0, 1);
    stroke(1);
    fill(red(sunColor), green(sunColor), blue(sunColor), 255 * gradient);
    noStroke();
    ellipse(width / 2, sunY, r * 2, r * 2);
  }
  
  float oceanY = height * 0.4 + map(noise(frameCount * 0.005), 0, 1, -10, 10);
  fill(0, 65, 106);
  rect(0, oceanY, width * 2.2, height * 0.2);
  
    // Draw ocean
    
  fill(0, 65,106);
  rect(0, height * 0.4, width * 2.2, height * 0.2);
  
  fill(18,97,128);
  strokeWeight(15);
  stroke(9, 101, 138);
  
  rect(0, height * 0.5, width * 2.2, height * 0.2);
  fill(0,105,148);
  
  strokeWeight(15);
  stroke(9, 101, 138);
  
  rect(0, height * 0.6, width * 2.2, height * 0.2);
  fill(0,110,145);
  
  //strokeWeight(15);
  //stroke(9, 153, 198);
  noStroke();
  
  rect(0, height * 0.7, width * 2.2, height * 0.2);
  fill(0, 120, 150);
  
  noStroke();
  //stroke(115, 175, 227);
  
  rect(0, height * 0.8, width * 2.2, height * 0.2);
  fill(0,125,155);
  
  //strokeWeight(15);
  //stroke(9, 101, 138);
  noStroke();
  rect(0, height * 0.9, width * 2.2, height * 0.2);
  
    // draw mountains 
 noStroke();
 fill(28,14,4);
 triangle(0, 100, 15, 240, 80, 240);
 triangle(125, 100, 55, 240, 220, 240);
 
 fill(99,81,71);
 triangle(-5, 100, -5, 240, 50, 240);
 triangle(95, 100, 25, 240, 190, 240);
 
// draw beach
 noStroke();
 fill(185, 177, 105);
 ellipse(725, 285, 509, 100);
ellipse(805, 325, 245, 80);

fill(240,230,140);
ellipse(725, 275, 484, 100);
ellipse(790, 315, 220, 80);

  // Reverse fade direction when the sun reaches the bottom
  if (sunY > height * 0.75) {
    fadeDirection = -1;
  }
  
  if (sunY > height * 0.7) {
    fill(102, 0, 0);
    textFont(font, 64);
    text("sunrise", 110, 500);
    
    fill(255, 153, 153);
    textFont(font, 64);
    text("sunrise", 120, 500);
  } 
  if (sunY < height * 0.6) {
    fill(0, 0, 64);
    textFont(font, 64);
    text("sunset", 110, 500);
    
    fill(102, 178, 255);
    textFont(font, 64);
    text("sunset", 120, 500);
  } 
  //if (sunY > height * 0.25 && sunY < height * 0.40) {
  //  fill(0, 0, 64);
  //  textFont(font, 64);
  //  text("sunset", 100, 500);
  //}
  
  //else {
  //  fill(0, 0, 64);
  //  textFont(font, 64);
  //  text("sunset", 100, 500);    
  //}
  
  //if (sunY > height * 0.625 ||sunY < height * 0.8 ) {
  //  fill(0, 0, 64);
  //  textFont(font, 128);
  //  text("sunrise", 200, 500);
  //}
  if (sunY < height * 0.5) {
    sunY +=1;
    fadeDirection = 1;
  }
}
