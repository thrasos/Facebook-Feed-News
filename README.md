# iOS Table Facebook Page News 

iOS facebook feed using a Table View Controller, swift 4


So you 've decided to use a facebook fan page's feed in your mobile app.
I don't know why you'd want to do this but I assume you do, so here goes:

This is a basic app that uses simple table view Controller and lists "Posts" form a fan page.
It's simple workaround in order to avoid installing or adding additional clutter in your project.
Basically it performs a GET request and retrieves the JSON from facebook based on your query.

## Facebook bureaucracy 

1. Go to developers.facebook.com

1.1 Login and create an app

1.2. Fill in the form and the privacy policy and make the app public.

2. Go to the access token facebook site and copy/paste the token for your app.
You might want to get a long lived access token or one without a an expiry date.

[here](https://medium.com/@Jenananthan/how-to-create-non-expiry-facebook-page-token-6505c642d0b1)

otherwise just go here and copy paste your short-lived access token.
 https://developers.facebook.com/tools/accesstoken/

## Add your properties in the code
3. Go to function getFacebookFeed()

and replace

"YOUR_FAN_PAGE" with the name of the fan page you wan to retrieve posts from.
"YOUR_ACCESS_TOKEN" with the access token of your app your got earlier.

depending on the permisions you have for your app and access token change facebookfeed at line 34 with your own.
for example:
```swift
    let facebookfeed: String = "https://graph.facebook.com/" + ContentCode + "/feed?fields=link,full_picture,name,created_time,type,shares,likes{pic_small,id,name},source,message,description,icon&access_token=" + AccessToken
```
	
	in our example you'll be retrieving:
	
	```
	link,full_picture,name,created_time,type,shares,likes{pic_small,id,name},source,message,description,icon
	
	```

you might need more or less so feel free to adjust accordingly. Have in mind that if you have additional properties without having persmissions for them FB might raise an objection( or two)
	
## Cocoapods used
	* (Alamofire)[https://cocoapods.org/pods/Alamofire]
	* (SwiftyJSON)[https://cocoapods.org/pods/SwiftyJSON]
	
	
