void recentTweets() {
  
  //Credentials for Twitter API
  ConfigurationBuilder credentials = new ConfigurationBuilder();
  credentials.setOAuthConsumerKey("Kr3dOt9h35ZZQFUDj4Q8XFT9s");
  credentials.setOAuthConsumerSecret("lvSuuFUBxfKHWV0p7tblPMTy0g6t4W2RhvmKmUyEyxrGIDyyzD");
  credentials.setOAuthAccessToken("701641218116071424-U7rup1OdyOUgIhhojlsYKDSZoEDTge2");
  credentials.setOAuthAccessTokenSecret("6NkD72rrdP9vG6Ka6DijpCztu26S4F1Id5mUC0NBDXQqH");
 
  //Connect to Twitter, and search for Kanye Debt tweets
  Twitter twitter = new TwitterFactory(credentials.build()).getInstance();
  Query query = new Query("kayne west debt");
  query.count(100);
 
  //Call the Twitter API to get the tweets
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();
 
    // Iterate through the tweets and display.
    for (int i = 0; i < tweets.size(); i++) {
      Status tweet = (Status) tweets.get(i);
      String text = tweet.getText();
      Date time = tweet.getCreatedAt();
      String user = tweet.getUser().getName();

      // Just print to the console. This is mostly just demo of calling the API from inside Processing.
      // For visuals, we need sentiment (done in Python library, and for WordCloud, more tweets than we can pull realtime.
      println(user + "(" + time + "): " + text + "\n");
    }
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}