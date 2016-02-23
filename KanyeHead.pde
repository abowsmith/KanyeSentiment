PImage img;
float sentiment_score = 0;

void setup(){
  size(800,500);
  img = loadImage("KanyeNoSmile.png");
  img.resize(150,250);
  //frameRate(5);
  
}

void draw() {
 
  //draw faces
  sentiment_score = random(-1,1);
  rotate(random(0,6));
  image(img, random(-50,750), random(-50,600));
  //sentiment
  if(sentiment_score < 0)
  {
      filter(GRAY);
  }
  else
  {
      filter(POSTERIZE,4);
  }

  
}