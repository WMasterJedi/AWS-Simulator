import processing.sound.*;
int val = 0;
int stop = 1;
int clearplay = 0;
int startuppress = 0;
int startup = 0;
int startupstart;
int resetpressed = 0;
int start = 0;
SoundFile warn;
SoundFile clear;
SoundFile click;
PImage d0;
PImage d1;
PImage d2;
PImage d3;

void setup() 
{
  size(850,550);
  d0 = loadImage("Image/Dial/d0.png");
  d1 = loadImage("Image/Dial/d1.png");
  d2 = loadImage("Image/Dial/d2.png");
  d3 = loadImage("Image/Dial/d3.png");
  background(55);
  imageMode(CENTER);
  image(d3, 350, 250, 200, 200);
  warn = new SoundFile(this, "Audio/Speaker/warn.wav");
  clear = new SoundFile(this, "Audio/Speaker/clear.wav");
  click = new SoundFile(this, "Audio/Dial/click.wav");
}

void keyPressed() {
  if (key == 'm') {
    startuppress = 1;
    startupstart++;
    if(startupstart >= 2){
      startupstart = 0;
    }
  } else{
    startuppress = 0;
  }
  if (key == 'q') {
    resetpressed = 1;
  } else{
    resetpressed = 0;
  }
}

void draw()
{
  if(startupstart == 0){
    stop = 1;
    startup = 0;
    clearplay = 0;
    background(55);
    imageMode(CENTER);
    image(d3, 350, 250, 200, 200);
    val = 0;
  }
  if(startupstart == 1){
    if(startup == 0){
      startup = 1;
      start = 1;
      warn.play();
    }
  }
  if(start == 1){
    if(resetpressed == 1){
      warn.stop();
      if(clearplay == 0){
        clearplay = 1;
        click.play();
        clear.play();
      }
      stop = 0;
      start = 0;
    }
  }
  if(stop == 0){
    val += 4;
    background(55);
    imageMode(CENTER);
  }
  if(val == 4){
    image(d2, 350, 250, 200, 200);
  }
  if(val == 8){
    image(d1, 350, 250, 200, 200);
  }
  if(val == 12){
    image(d0, 350, 250, 200, 200);
    stop = 1;
  }
}
