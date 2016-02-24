//# Use TextBlob for the sentiment analysis
//from textblob import TextBlob
//import twitter
//import json
//import time

//#Setting up Twitter API
//api = twitter.Api(
//    consumer_key='Kr3dOt9h35ZZQFUDj4Q8XFT9s',
//    consumer_secret='lvSuuFUBxfKHWV0p7tblPMTy0g6t4W2RhvmKmUyEyxrGIDyyzD',
//    access_token_key='701641218116071424-U7rup1OdyOUgIhhojlsYKDSZoEDTge2',
//    access_token_secret='6NkD72rrdP9vG6Ka6DijpCztu26S4F1Id5mUC0NBDXQqH'
// )
//myList = []
//currentId=0; # Keep track of Id to pull in previous tweets (using Twitter API "paging")
//tweets = {}  # Use dictionary as hashtable for tweets we've already seen

//# Run initial search, looking for recent tweets of Kayne's Debt
//search = api.GetSearch(term='kayne west debt', lang='en', result_type='recent', count=100)
//# Set the currentId going into loop
//currentId = search[0].id
//# Go through roughly 2000 tweets (20 pages)
//for i in range(1, 20):
//    # For each tweet returned in search
//    for t in search:
//        # If we are going down in Id, make certain we track the ID of the lowest tweet we've gotten
//        if (t.id < currentId):
//            currentId = t.id

//        # If we've already seen this tweet, get next
//        if tweets.has_key(t.text):
//            continue
//        # Mark this tweet as seen
//        tweets[t.text] = 1

//        # Print out what we've seen
//        print t.text

//        # Run the sentiment analysis for each sentence in the tweet. Take the average
//        blob = TextBlob(t.text)
//        total = 0
//        for sentence in blob.sentences:
//            total += sentence.sentiment.polarity
//        score = total / len(blob.sentences)

//        # Set up the dictionary for JSON storage
//        myElement = {'ID' : t.id, 'Time' : t.created_at, 'Author' : t.user.screen_name, 'Text' : t.text, 'SentimentScore' : score}

//        # Add the dict as array entry for the tweet
//        myList.append(myElement)

//    # Wait a bit before calling into Twitter API again right away (conditions of use and all that)
//    time.sleep(1)

//    # Call the search again, but this time, for tweets older than our lowest ID
//    search = api.GetSearch(term='kayne west debt', lang='en', count=100, max_id=currentId)

//    # If no more tweets, bail out.
//    if (len(search) == 0):
//        print "No more Items!"
//        break

//# Add a JSON wrapper around our array, and then save it.
//myJson = {'Tweets' : myList}
//with open('kanyeTweets.json', 'w') as outFile:
//    json.dump(myJson, outFile)