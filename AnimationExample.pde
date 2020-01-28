PImage spritesheet;
PImage frame;

int totalFrames = 15;
int currentFrame = 0;
int frameWidth = 183;
int frameHeight = 122;
int millisecondsBetweenFrames = 50;
int lastFrame = 0;

// Spritesheet animation: The basic idea.
// Spritesheet animation is very old and still very popular in games, and is 
// the single most effective -- and relatively easy -- way of achieving 
// animation in 2D. It emulates a classical roll of film, pulling the film strip
// in front of the viewer one frame at a time at a fixed interval, showing the
// viewer only that one frame, which together creates the illusion of movement.
void setup() {
  size(800,600);
  spritesheet = loadImage("horsesheet.png");
}

void draw() {
  background(0,0,0);
  
  // When the difference between now and last time we updated the frame 
  // reaches the amount of time we want to pass between each frame, we 
  // update the frame again.
  if(millis() - lastFrame >= millisecondsBetweenFrames) {
    currentFrame++;
    // Since we're zero-indexed, the first frame of 10 would be 0, giving
    // us a range of frames 0-9, we'll wrap around immediately when reaching
    // the frame limit.
    if (currentFrame == totalFrames) {
      currentFrame = 0; 
    }
    // Mark this as the last time we updated the frame, so our if statement
    // above can check for it on the next go-around.
    lastFrame = millis();
  }
  // Here we use the get() method on PImage, which lets us "cut" a piece of
  // the image and put it into a new PImage. It takes the following arguments:
  // x: The X-coordinates from where we begin the cut
  // y: The Y-coordinates from where we begin the cut
  // width: how many pixels starting from x we want to cut out
  // height: how many pixels starting from y we want to cut out
  frame = spritesheet.get(frameWidth * currentFrame, 0, frameWidth, frameHeight);
  
  // Display the frame we have extracted in the middle of the screen
  image(frame, (width/2) - (frameWidth/2), (height/2) - (frameHeight/2));
}
