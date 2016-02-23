import java.util.Random;

final Random seed = new Random();
final int border = 364; // the height of the img...
final int numFaces = 150;
String file_path = "Kanye_Talking.png";
ArrayList<PImage> faces;

// Creates new random (x,y) coordinates for Kanye face
// To access x, use .getKey(); to access y, use .getValue().

Entry_Pair<Integer, Integer> randomCoordinates() {
  int x = Math.abs(seed.nextInt(width - border));
  int y = Math.abs(seed.nextInt(height - border));
  return new Entry_Pair<Integer, Integer>(x, y);
}

float getSentiment() {
  // We have yet to load the sentiment data, so this
  // is a placeholder until that gets integrated...
  
  // Min-max scaling is performed by val * (max-min) + min
  // In this case, max is 1.0, min is -1.0, so this returns
  // a float between negative 1 and 1.
  return seed.nextFloat() * (1.0 - -1.0) + -1.0;
}

void affectFace(PImage img, float sentiment) {
  // TODO -- JUHEE EDIT THIS
  // do some logic here to img to change its appearance
}

void setup(){
  size(1000, 1000);
  
  faces = new ArrayList<PImage>(numFaces);
  
  // Draw ONCE
  PImage img;
  float sentiment;
  Entry_Pair<Integer, Integer> coordinates;
  for(int i = 0; i < numFaces; i++) {
    System.out.println(i);
    img = loadImage(file_path);
    
    sentiment = getSentiment();
    affectFace(img, sentiment);
    coordinates = randomCoordinates();
    image(img, coordinates.getKey(), coordinates.getValue());
  }
}

void draw() {
  // Do we leave the faces static? Or redraw them everytime...
}