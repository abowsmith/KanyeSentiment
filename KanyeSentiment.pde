// Import Wordcram, install into Processing library (default will be
// home/documents folder=>Processing/libraries from http://wordcram.org
import wordcram.*;
import wordcram.text.*;

WordCram wordCram;
PImage img;
int faceCount = 0;
int drawMode = 1; // by default, draw faces

void setup(){
  recentTweets();
  size(1000, 1000);
  background(255);
  
  faces = new ArrayList<PImage>(numFaces);

  jsonToTxt();
  initWordCram();

}

void draw() {
  float sentiment;
  Entry_Pair<Integer, Integer> coordinates;
  
  faceCount++;
  if (drawMode == 1) {
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
  else { // Draw WordCloud
    if (wordCram.hasMore()) {
      wordCram.drawNext();
    }
  }
}

// Draw WordCloud on MouseClick
void mouseClicked() {
  if (drawMode == 1)
  {
    drawMode = 2;
    colorMode(HSB);

    initWordCram();
  }
  else {
    drawMode = 1;
    colorMode(RGB);
    faceCount = 0; // start redrawing faces
  }

  background(255);
}