import processing.sound.*;
import processing.serial.*;

Serial myPort;

AudioIn input;
Amplitude analyzer;
Reverb reverb;
float thingy = 0;


void setup() { 
  size(500, 500);
  myPort = new Serial (this, "COM4", 9600);
  reverb = new Reverb(this);
  
  
  input = new AudioIn(this, 1);
  input.start();
  analyzer = new Amplitude(this);
  
  analyzer.input(input);
  reverb.process(input);
  input.play();
}

void draw() {
  background(255);
  
  float vol = analyzer.analyze();
  fill(127);
  stroke(0);
  
  ellipse(width/2, height/2, 20+vol*400, 20+vol*400);
    float roomSize = map(mouseX, 0, width, 0, 1.0);
  reverb.room(roomSize);

  // Change the high frequency dampening parameter
  float damping = map(mouseX, 0, width, 0, 1.0);
  reverb.damp(damping);

  // Change the wet/dry relation of the effect
  float effectStrength = map(mouseY, 0, height, 0, 1.0);
  reverb.wet(effectStrength);



}

void serialEvent (Serial myPort)
{
    thingy = float(myPort.readStringUntil('\n'));
}
