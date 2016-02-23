//import java.util.Random;

//final Random seed = new Random();
//final int height_border = 325; // the height of the img...
//final int width_border = 215;
//final int numFaces = 150;
//String file_path = "KanyeNoSmile.png";
//ArrayList<PImage> faces;
//int redCount;
//int blueCount;
//// Creates new random (x,y) coordinates for Kanye face
//// To access x, use .getKey(); to access y, use .getValue().

//Entry_Pair<Integer, Integer> randomCoordinates() {
//  int x = Math.abs(seed.nextInt(width - width_border));
//  int y = Math.abs(seed.nextInt(height - height_border));
//  return new Entry_Pair<Integer, Integer>(x, y);
//}

//float getSentiment(int tweetNumber) {
//  // returns
//  // a float between negative 1 and 1.
//  return seed.nextFloat() * (1.0 - -1.0) + -1.0;
//}

//void affectFace(PImage img, float sentiment) {
//  // TODO -- JUHEE EDIT THIS
//  // do some logic here to img to change its appearance
//  img.resize(150,200);
//  if(sentiment < 0)
//  {
//    tint(200, 50, 50);
//    rotate(random(6));
//    redCount++;
//  }
//  else if(sentiment > 0)
//  {
//    tint(25, 25, 250);
//    rotate(random(6));
//    blueCount++;
//  }
//}

PImage img;
int faceCount = 0;

void setup(){
  size(1000, 1000);
  
  faces = new ArrayList<PImage>(numFaces);
  
  // Draw ONCE

}

void draw() {
  float sentiment;
  Entry_Pair<Integer, Integer> coordinates;
  
  faceCount++;
  if (faceCount <= numFaces) {
  
    System.out.println(faceCount);
    img = loadImage(file_path);
    
    delay(50);
    
    sentiment = getSentiment(faceCount);
    affectFace(img, sentiment);
    coordinates = randomCoordinates();
    image(img, coordinates.getKey(), coordinates.getValue());
  }
  else {
  
 // Draw the bar chart of positive/negative tweets 
   noStroke();
   rect(10,30,redCount,30); 
   fill(250, 50, 50);
     
   rect(10,70, blueCount,30); 
   fill(50, 50, 250);
  }
}