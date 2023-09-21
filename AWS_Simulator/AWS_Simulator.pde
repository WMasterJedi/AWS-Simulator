import processing.sound.*;
int val = 0;
int startB = 0;
int val2 = 0;
int TSOlit = 0;
int MC = 0;
int MG = 0;
int black = 0;
int startingup = 0;
int WStart = 0;
int MCStart = 0;
int MGStart = 0;
int stop = 1;
int stop2 = 1;
int clearplay = 0;
int startup = 0;
int startupstart;
int resetpressed = 0;
int start = 0;
SoundFile warn;
SoundFile clear;
SoundFile click;
SoundFile clickWB;
SoundFile clickTSO;
PImage d0;
PImage d1;
PImage d2;
PImage d3;
PImage TPWSpanel;
PImage TPWSpanellit;
PImage TPWSpanelTSO;

void setup() 
{
  size(850,550);
  d0 = loadImage("Image/Dial/d0.png");
  d1 = loadImage("Image/Dial/d1.png");
  d2 = loadImage("Image/Dial/d2.png");
  d3 = loadImage("Image/Dial/d3.png");
  TPWSpanel = loadImage("Image/TPWS/tpwspanel.png");
  TPWSpanellit = loadImage("Image/TPWS/tpwspanellit.png");
  TPWSpanelTSO = loadImage("Image/TPWS/tpwspanelTSO.png");
  warn = new SoundFile(this, "Audio/Speaker/warn.wav");
  clear = new SoundFile(this, "Audio/Speaker/clear.wav");
  click = new SoundFile(this, "Audio/Dial/click.wav");
  clickWB = new SoundFile(this, "Audio/Dial/clickWB.wav");
  clickTSO = new SoundFile(this, "Audio/TPWS/TSOclick.wav");
}

void keyPressed() {
  if (key == 'm') {
    startupstart++;
    if(startupstart >= 2){
      startupstart = 0;
    }
  }
  
}

void draw()
{
  if (key == 'q' && keyPressed) {
    resetpressed = 1;
  } else{
    resetpressed = 0;
  }
  if (key == 'g' && clearplay == 1 && keyPressed) {
    MG = 1;
  } else{
    MG = 0;
  }
  if (key == 'c' && clearplay == 1 && keyPressed) {
    MC = 1;
  } else{
    MC = 0;
  }
  if(MG == 1){
    if(MGStart == 0){
      MGStart = 1;
      if(black == 0){
        stop2 = 0;
        clickWB.play();
      }
      clear.play();
    }
  }
  if(MC == 1){
    if(MCStart == 0){
      MCStart = 1;
      warn.play();
      WStart = 1;
    }
  }
  if(WStart == 1){
    if(resetpressed == 1){
      WStart = 0;
      warn.stop();
      if(black == 1){
        stop = 0;
        click.play();
      }
      MCStart = 0;
    }
  }
  if(MG == 0){
    MGStart = 0;
  }
  if(startupstart == 0){
    stop = 1;
    startB = 0;
    stop2 = 1;
    startup = 0;
    clearplay = 0;
    background(55);
    imageMode(CENTER);
    if(TSOlit == 1){
      image(TPWSpanelTSO, 600, 150, 400, 191);
    }
    if(TSOlit == 0){
      image(TPWSpanel, 600, 150, 400, 191);
    }
    image(d0, 150, 150, 200, 200);
    val = 0;
  }
  if(startupstart == 1){
    if(startB == 0){
      startB = 1;
      startingup = 1;
      stop2 = 0;
      clickWB.play();
    } 
    if(startup == 0 && black == 1){
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
    image(d2, 150, 150, 200, 200);
    if(startingup == 1){
      image(TPWSpanellit, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 0){
      image(TPWSpanel, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 1){
      image(TPWSpanelTSO, 600, 150, 400, 191);
    }
  }
  if(val == 8){
    image(d1, 150, 150, 200, 200);
    if(startingup == 1){
      image(TPWSpanellit, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 0){
      image(TPWSpanel, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 1){
      image(TPWSpanelTSO, 600, 150, 400, 191);
    }
  }
  if(val == 12){
    startingup = 0;
    image(d0, 150, 150, 200, 200);
    if(startingup == 1){
      image(TPWSpanellit, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 0){
      image(TPWSpanel, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 1){
      image(TPWSpanelTSO, 600, 150, 400, 191);
    }
    black = 0;
    stop = 1;
    val = 0;
  }
  if(stop2 == 0){
    val2 += 4;
    background(55);
    imageMode(CENTER);
  }
  if(val2 == 4){
    image(d1, 150, 150, 200, 200);
    if(startingup == 1){
      image(TPWSpanellit, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 0){
      image(TPWSpanel, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 1){
      image(TPWSpanelTSO, 600, 150, 400, 191);
    }
  }
  if(val2 == 8){
    image(d2, 150, 150, 200, 200);
    if(startingup == 1){
      image(TPWSpanellit, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 0){
      image(TPWSpanel, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 1){
      image(TPWSpanelTSO, 600, 150, 400, 191);
    }
  }
  if(val2 == 12){
    image(d3, 150, 150, 200, 200);
    if(startingup == 1){
      image(TPWSpanellit, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 0){
      image(TPWSpanel, 600, 150, 400, 191);
    }
    if(startingup == 0 && TSOlit == 1){
      image(TPWSpanelTSO, 600, 150, 400, 191);
    }
    black = 1;
    stop2 = 1;
    val2 = 0;
  }
}

boolean isMouseOver(int x, int y, int w, int h){
  if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
    return  true;
  }
  return false;
}

void mousePressed(){
  if(isMouseOver(655, 115, 60, 60) == true){
    clickTSO.play();
    TSOlit++;
    if(TSOlit >= 2){
      TSOlit = 0;
    }
    if(TSOlit == 1){
      background(55);
      imageMode(CENTER);
      image(TPWSpanelTSO, 600, 150, 400, 191);
      if(black == 1){
        image(d3, 150, 150, 200, 200);
      }
      if(black == 0){
        image(d0, 150, 150, 200, 200);
      }
    }
    if(TSOlit == 0){
      background(55);
      imageMode(CENTER);
      image(TPWSpanel, 600, 150, 400, 191);
      if(black == 1){
        image(d3, 150, 150, 200, 200);
      }
      if(black == 0){
        image(d0, 150, 150, 200, 200);
      }
    }
  }
}
