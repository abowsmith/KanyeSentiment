import java.util.Random;

PImage img;
final Random seed = new Random();
Canvas_Builder canvas = new Canvas_Builder();
final int border = 364; // the height of the img...

// Creates new random (x,y) coordinates for Kanye face
// To access x, use .getKey(); to access y, use .getValue().

Entry_Pair<Integer, Integer> randomCoordinates() {
  int x = Math.abs(seed.nextInt(width - border));
  int y = Math.abs(seed.nextInt(height - border));
  return new Entry_Pair<Integer, Integer>(x, y);
}

//Sets method for changing face based on sentiment.

void processFace(PImage face) {
  // TODO: write logic to affect the face's rotation, size
  // and color contingent on the sentiment analysis performed.
  // Since face is a reference, it should be mutable and
  // shouldn't have to be returned, but that may not be the case...
}

void setup(){
  size(1000, 1000);
  
  
  // TODO: step one-- parse JSON, get all tweets. For each tweet,
  // use the canvas.addFace(tweet) method to add to the TreeMap.
  // EXAMPLE: canvas.addFace("I have no friends");
  
  // TODO: step two-- for each tweet, lookup the face using
  // canvas.lookupFace(tweet) and the processFace(face) method. Finally,
  // use the image(...) cmd to add to the actual canvas.
  // EXAMPLE: image(processFace(canvas.lookupFace("I have no friends")), xCoor, yCoor)
  // note: consider writing a function to generate a size based on sentiment.
  // note: use randomCoordinates() to get a pair of random (x,y) values for faces (see Entry_Pair class).
  

  canvas.addFace("I have no friends");
  Entry_Pair<Integer, Integer> coordinates = randomCoordinates();
  image(canvas.lookupFace("I have no friends"), coordinates.getKey(), coordinates.getValue());
}

void draw() {
  // TODO
}