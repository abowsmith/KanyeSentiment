// Creates new random (x,y) coordinates for Kanye face
// To access x, use .getKey(); to access y, use .getValue().

Entry_Pair<Integer, Integer> randomCoordinates() {
  int x = Math.abs(seed.nextInt(width - width_border));
  int y = Math.abs(seed.nextInt(height - height_border));
  return new Entry_Pair<Integer, Integer>(x, y);
}

// Color in the face if we are able to determine if it is positive/negative from analysis done in
// in Python when we gathered the tweets up-front.
void affectFace(PImage img, float sentiment) {
  img.resize(150,200);
  if(sentiment < 0)
  {
    // Red if negative tweet, blue if positive
    tint(200, 50, 50);
    rotate(random(6));
    redCount++;
  }
  else if(sentiment > 0)
  {
    tint(25, 25, 250);
    rotate(random(6));
    blueCount++;
  }
}