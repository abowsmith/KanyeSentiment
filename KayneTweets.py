from textblob import TextBlob
import twitter
import json
import time

#Setting up Twitter API
api = twitter.Api(
    consumer_key='Kr3dOt9h35ZZQFUDj4Q8XFT9s',
    consumer_secret='lvSuuFUBxfKHWV0p7tblPMTy0g6t4W2RhvmKmUyEyxrGIDyyzD',
    access_token_key='701641218116071424-U7rup1OdyOUgIhhojlsYKDSZoEDTge2',
    access_token_secret='6NkD72rrdP9vG6Ka6DijpCztu26S4F1Id5mUC0NBDXQqH'
 )
myList = []
currentId=0;
tweets = {}

search = api.GetSearch(term='kayne west debt', lang='en', result_type='recent', count=100)
currentId = search[0].id
print currentId
for i in range(1, 20):
    for t in search:
        if (t.id < currentId):
            currentId = t.id
        if tweets.has_key(t.text):
            continue
        tweets[t.text] = 1
        print t.id
        print t.text
        blob = TextBlob(t.text)
        total = 0
        for sentence in blob.sentences:
            total += sentence.sentiment.polarity
        score = total / len(blob.sentences)
        myElement = {'ID' : t.id, 'Time' : t.created_at, 'Author' : t.user.screen_name, 'Text' : t.text, 'SentimentScore' : score}
        myList.append(myElement)
    time.sleep(1)
    search = api.GetSearch(term='kayne west debt', lang='en', count=100, max_id=currentId)
    if (len(search) == 0):
        print "No more Items!"
        break

myJson = {'Tweets' : myList}
with open('kanyeTweets.json', 'w') as outFile:
    json.dump(myJson, outFile)




