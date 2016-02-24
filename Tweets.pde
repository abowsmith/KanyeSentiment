void jsonToTxt() {
    
  // Open PrintWriter to output the tweets to text file
  PrintWriter output = createWriter("data/KayneTweets.txt");

  // Load the JSON file as a JSON object
  processing.data.JSONObject jsonFile = loadJSONObject("data/KanyeTweets.json");
  
  // Get the array of tweet objects from the JSON
  tweets = jsonFile.getJSONArray("Tweets");

  // Iterate through each tweet, and print the text to file
  for(int i = 0; i < tweets.size(); i++) {
    processing.data.JSONObject tweet = tweets.getJSONObject(i);
    output.println(tweet.getString("Text"));
  }
  output.flush();
  output.close();
}

// Create the WordCram from the output text file
void initWordCram() {
  wordCram = new WordCram(this)
      .fromTextFile("data/KayneTweets.txt")
      .sizedByWeight(10, 90)
      .withColors(color(0, 250, 200), color(30), color(170, 230, 200));
}

float getSentiment(int tweetNumber) {
  // returns
  // a float between negative 1 and 1.
  processing.data.JSONObject tweet = tweets.getJSONObject(tweetNumber);
  return tweet.getFloat("SentimentScore");
}