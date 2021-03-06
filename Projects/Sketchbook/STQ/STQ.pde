import fisica.*;

public int stage = -1; //Stage -1 = Splashscreen, Stage 0 = Menu, Stage 1 = Help, Stage 2 = Game, Stage 3 = Next Level, Stage 4 = Game Over, Stage 5 = End of Game

boolean devSplash = true; //Switch for developers to save time

boolean inMenuHelp, inMenuPlay; //To check when the cursor is in the button frame

String factArray[] = {"15 people built Asia", "I have a nose"};

boolean launch = false; //Used for launching question

int launchX = 0;
int launchY = 0;

int a = 100;

int splashColor = 0;
int barrelRotation = 0;

void setup() {
  PFont font;
  font = loadFont("CustomFont.vlw");
  textFont(font);
  size(600, 400);
  background(0, 0, 0);
  frameRate(30);
}

void draw() {
  textSize(48);
  if(stage == -1) {
    splash();
  }
  
  if(stage == 0) {
    menu();
  }
  
  if(stage == 1) {
    help();
  }
  
  if(stage == 2) {
    play();
    
    drawBoxes((int) random(1, 5));
    
    if(launch) {
      if(a <= 450) {
      launchQuestion(a, launchY);
      int index = (int) random(2);
       raiseFact(300, 350, index);
      a += 4;
      } else launch = false;
    }
  }
}

void keyPressed() {
  if(keyCode == ENTER) {
    if(stage == 1) {
      stage = 0;
    }
  }
  
  if(keyCode == UP) {
    if(barrelRotation <= 75) // Gives 18 possible positions for firing (Going up)
    barrelRotation += 5;
  }  
  if(keyCode == DOWN) {
    if(barrelRotation >= 0) // Gives 18 possible positions for firing (Going down)
    barrelRotation -= 5;
  }
  if(stage == 2) {
  if(keyCode == 32) {
    //For code when you have to fire in game
    if(!launch) launch = true;
    
  }
  }
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

void play() {
   background(245, 245, 245);
   drawCannon();
}

void drawCannon() {
  int realX;
  int realY;
  
  //Draw the cannon
  int x, y = 0;
  realX = 5;
  realY = 350;
  noStroke();
  fill(179, 179, 179);
  rect(realX, realY, 100, 50);
  rect(realX + 10, realY - 25, 80, 25);
  
  //Drawing the barrel
  strokeWeight(20);
  stroke(179, 179, 179);
  fill(179, 179, 179);
  line(realX + 80, realY, (realX + 80) + 90 - barrelRotation, realY - barrelRotation);
  launchX = 90 - barrelRotation;
  launchY = realY - barrelRotation;
}

void help() {
  background(179, 179, 179);
  fill(255, 255, 255);
  textAlign(CENTER);
  textSize(48);
  text("Help", 300, 50);
  
  textSize(20);
  text("Use the up and down arrow keys to aim the cannon.", 300, 150);
  text("When you hit an image, it will give you a fact.", 300, 200);
  text("After you get all the facts, the level will end.", 300, 250);
  text("If you move your barrel while it flies, it follows!", 300, 300);
  text("Press enter to exit and hit space to fire!", 300, 350);
}

void splash() { // Will be on for 6 seconds (Really 5.96), Implemented a developer switch to save time
if(!devSplash) {
  background(splashColor, splashColor, splashColor);
  if(splashColor == 179) stage = 0;
  splashColor++;
} else stage = 0;
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
      fill(0, 255, 255);
      strokeWeight(15);
      stroke(0, 240, 0);

      // PLAY
      rect(195, 90, 200, 100, 20);

      // PLAY
      fill(255, 0, 0);
      text("Play", 290, 150);

      cursor(HAND);
      inMenuPlay = true;
    }

    if (mouseX > 195 && mouseX < 395 && mouseY > 250 && mouseY < 350) { // Help Button
      fill(0, 255, 255);
      strokeWeight(15);
      stroke(0, 240, 0);

      // HELP
      rect(195, 250, 200, 100, 20);

      // HELP
      fill(255, 0, 0);
      text("Help", 290, 310);

      cursor(HAND);
      inMenuHelp = true;
    }
}

void drawButtons() {
  strokeWeight(5);
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

  void launchQuestion(int x, int y) {
      textSize(40);
      fill(0);
      text("?", x, y);
      if(x == 448) {
        launch = false;
        a = 100;
      }
  }
  
  void raiseFact(int boxX, int boxY, int index) {
    int y = boxY;
    String fact = factArray[index];
    
    textSize(20);
    fill(0, 0, 0);
    
    if(y > 10) {
    text(fact, boxX + 30, y);
    y--;
    }
  }
  
  void drawBoxes(int sequence) {
    
  }