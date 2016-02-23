import java.util.Random;

final Random seed = new Random();
final int height_border = 325; // the height of the img...
final int width_border = 215;
final int numFaces = 150;
String file_path = "Kanye_Talking.png";
ArrayList<PImage> faces;

int redCount;
int blueCount;

// Creates new random (x,y) coordinates for Kanye face
// To access x, use .getKey(); to access y, use .getValue().

Entry_Pair<Integer, Integer> randomCoordinates() {
  int x = Math.abs(seed.nextInt(width - width_border));
  int y = Math.abs(seed.nextInt(height - height_border));
  return new Entry_Pair<Integer, Integer>(x, y);
}

void affectFace(PImage img, float sentiment) {
  // TODO -- JUHEE EDIT THIS
  // do some logic here to img to change its appearance
  img.resize(150,200);
  if(sentiment < 0)
  {
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

//void setup(){
//  size(1000, 1000);
  
//  faces = new ArrayList<PImage>(numFaces);
  
//  // Draw ONCE
//  PImage img;
//  float sentiment;
//  Entry_Pair<Integer, Integer> coordinates;
//  for(int i = 0; i < numFaces; i++) {
//    System.out.println(i);
//    img = loadImage(file_path);
    
//    sentiment = getSentiment(i);
//    affectFace(img, sentiment);
//    coordinates = randomCoordinates();
//    image(img, coordinates.getKey(), coordinates.getValue());
//  }
//}

//void draw() {
//  // Do we leave the faces static? Or redraw them everytime...
//  noStroke();
//  rect(10,30,redCount,30); 
//  fill(250, 50, 50);
   
//  rect(10,70, blueCount,30); 
//  fill(50, 50, 250);
//}