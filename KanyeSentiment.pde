// Import Wordcram from http://wordcram.org
// Import twitter4j from http://twitter4j.org
import wordcram.*;
import wordcram.text.*;
import java.util.*;
import twitter4j.*;

WordCram wordCram;
PImage img;
int faceCount = 0;
int drawMode = 1; // by default, draw faces
processing.data.JSONArray tweets;
final Random seed = new Random();
final int height_border = 325; // the height of the img...
final int width_border = 215;
final int numFaces = 150;
String file_path = "Kanye_Talking.png";
ArrayList<PImage> faces;

// Keep track of red and blue (negative/positive) and show bar chart at the end
int redCount;
int blueCount;

void setup(){
  faces = new ArrayList<PImage>(numFaces);

  // Call into twitter to get the recent tweets and display to the console as example of API from Processing
  recentTweets();

  // Pull in the full set of tweets from JSON file we exported by calling into API from Python, and then
  // running the sentiment analysis on top
  jsonToTxt();
  
  size(1000, 1000);
  background(255);
}

void draw() {
  float sentiment;
  Entry_Pair<Integer, Integer> coordinates;
  
  faceCount++;
  if (drawMode == 1) {
    if (faceCount <= numFaces) {
  
      img = loadImage(file_path);

      // Get the sentiment for the tween, and color the face accordingly.
      sentiment = getSentiment(faceCount);
      affectFace(img, sentiment);

      // Place the face randonly, and draw it.
      coordinates = randomCoordinates();
      image(img, coordinates.getKey(), coordinates.getValue());

      // Wait for 50ms before drawing the next head.
      delay(50);
  }
    else {

 // Draw the bar chart of positive/negative tweets.
      noStroke();
      rect(10,30,redCount,30); 
      fill(250, 50, 50);
         
      rect(10,70, blueCount,30); 
      fill(50, 50, 250);
    }
}
  else { // Draw WordCloud.
    if (wordCram.hasMore()) {
      wordCram.drawNext();
    }
  }
}

// Draw WordCloud on MouseClick.
void mouseClicked() {
  if (drawMode == 1)
  {
    drawMode = 2; // Word Cloud
    
    // Use the Hue/Saturation/Brightness mode as this works best with WordCram.
    colorMode(HSB); 

    initWordCram(); // Start new word cloud.
  }
  else {
    drawMode = 1; // Faces
    
    // Switch back to Red/Green/Blue for drawing faces.
    colorMode(RGB);
    faceCount = 0; // Start redrawing faces.
  }

  background(255); // Clear the screen to white.
}