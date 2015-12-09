public int stage = -1; //Stage -1 = Splashscreen, Stage 0 = Menu, Stage 1 = Help, Stage 2 = Game, Stage 3 = Next Level, Stage 4 = Game Over, Stage 5 = End of Game

boolean devSplash = true; //Switch for developers to save time

boolean inMenuHelp, inMenuPlay; //To check when the cursor is in the button frame

int splashColor = 0;

void setup() {
  PFont font;
  font = loadFont("CustomFont.vlw");
  textFont(font);
  size(600, 400);
  background(0, 0, 0);
  frameRate(30);
}

void draw() {
  if(stage == -1) {
    splash();
  }
  
  if(stage == 0) {
    menu();
  }
  
  if(stage == 1) {
    helpMenu();
  }
  
  if(stage == 2) {
    game();
  }
}

void helpMenu() {

}

void game() {

}

void splash() { // Will be on for 6 seconds (Really 5.96), Implemented a developer switch to save time
if(!devSplash) {
  background(splashColor, splashColor, splashColor);
  if(splashColor == 179) stage = 0;
  splashColor++;
} else stage = 0;
}

void mousePressed() {
  if(inMenuPlay) {
    cursor(ARROW);
    stage = 2;
  }
  
  if(inMenuHelp) {
    cursor(ARROW);
    stage = 1;
  }
}

void menu() {
  background(179, 179, 179);
  textAlign(CENTER);
  fill(255, 255, 255);
 text("Shoot the Question?", 300, 50);
 cursor(ARROW);
 drawButtons();
 detectOverlay();
}

void detectOverlay() { // Detects if the mouse is over a button and shows an overlay.
inMenuPlay = false;
inMenuHelp = false;
    if (mouseX > 195 && mouseX < 395 && mouseY > 90 && mouseY < 190) { // Play Button
      fill(0, 240, 240);
      strokeWeight(30);
      stroke(0, 240, 0);

      // PLAY
      rect(195, 90, 200, 100, 20);

      fill(240, 0, 0);

      // PLAY
      text("Play", 290, 150);

      cursor(HAND);
      inMenuPlay = true;
    }

    if (mouseX > 195 && mouseX < 395 && mouseY > 250 && mouseY < 350) { // Help Button
      fill(0, 240, 240);
      strokeWeight(30);
      stroke(0, 240, 0);

      // HELP
      rect(195, 250, 200, 100, 20);

      fill(240, 0, 0);

      // HELP
      text("Help", 290, 310);

      cursor(HAND);
      inMenuHelp = true;
    }
}

void drawButtons() {
  strokeWeight(15);
  stroke(0, 255, 0);
  fill(0, 255, 255);
  
  //Play Button
  rect(195, 90, 200, 100, 20); //Please note: text should be 60 pixels down with these rectangle sizes
  fill(0, 0, 255);
  text("Play", 290, 150);
  
   fill(0, 255, 255);
  //Help Button
  rect(195, 250, 200, 100, 20);
   fill(0, 0, 255);
   text("Help", 290, 310);
}
