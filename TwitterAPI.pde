import twitter4j.*;

//Build an ArrayList to hold all of the words that we get from the imported tweets
ArrayList<String> recentTweets = new ArrayList();
 
void recentTweets() {
  
  //Credentials
  ConfigurationBuilder credentials = new ConfigurationBuilder();
  credentials.setOAuthConsumerKey("Kr3dOt9h35ZZQFUDj4Q8XFT9s");
  credentials.setOAuthConsumerSecret("lvSuuFUBxfKHWV0p7tblPMTy0g6t4W2RhvmKmUyEyxrGIDyyzD");
  credentials.setOAuthAccessToken("701641218116071424-U7rup1OdyOUgIhhojlsYKDSZoEDTge2");
  credentials.setOAuthAccessTokenSecret("6NkD72rrdP9vG6Ka6DijpCztu26S4F1Id5mUC0NBDXQqH");
 
   //Make the twitter object and prepare the query
  Twitter twitter = new TwitterFactory(credentials.build()).getInstance();
  Query query = new Query("kayne west debt");
  query.count(100);
 
  //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();
 
    for (int i = 0; i < tweets.size(); i++) {
      Status t = (Status) tweets.get(i);
      String msg = t.getText();
      println(msg);
       
      //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {

        //Put each word into the words ArrayList
       //words.add(input[j]);
      }
    };
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}