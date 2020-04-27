## **Howdy!**

# About this project!

#### Click the image below to view the project video or click [here](https://www.youtube.com/watch?v=RCPPRbW1Fzc)

[![terra EarthXHack Info Video](http://img.youtube.com/vi/RCPPRbW1Fzc/0.jpg)](https://www.youtube.com/watch?v=RCPPRbW1Fzc "terra EarthXHack Video")

# EarthXHack -- *terra*

* * *

### About Us

Hackers (DevPost Usernames):

-   Dylan Theriot (@Doubled #7628)
    
-   Anooj Shah (@anoojshah #7132)
    
-   Yonathan Zetune (@y00z #6248)
    

### Inspiration

With so much information on how society needs to act according to climate statistics and environmental statements, it's sometimes hard to understand how someone, as an individual, should act and can contribute, especially for the younger demographic of adults and teens. That's what we sought our to accomplish with *terra*. Terra is a complete platform which gives people the opportunity to share their personal contributions towards helping the environment. Whether is through volunteering at a recycling plant or just cleaning up your local park, *terra* is where all creators and activists can go, no matter their demographic or popularity. This is *terra*, a social network that reaches out to friends, connects you with activities in your community, and allows you to **challenge** others on the platform as well in order to earn points and claim them in exchange for a donation to your favorite environmental foundation. Compete, Change, Challenge. This is *terra*.

### What it does

Terra allows user to login in and are greeted with an abundance of possible areas to explore. The project is user-facing through an iOS / Android application. Using this application, they get access to the following **implemented / integrated** key functionality:

![Alt Text](https://media.giphy.com/media/cj8ZgXcy7UkdHk9pfd/giphy.gif)
![Alt Text](https://media.giphy.com/media/ih4FaM5QDCsxifD6eN/giphy.gif)
![Alt Text](https://media.giphy.com/media/S5VCqIbHKsfZ7nbUei/giphy.gif)

### Create a Post
    
Using the post tab on the bottom navigation bar, users can select a picture from their device as seen in the demo. This can be either from their camera or from their photo library. The photo is then combined with user inputs using form fields that the user can type in. Once ready, it is then uploaded and processed server-side where it can be distributed across other devices. A simple yet effective way to share your contributions to the terra community.

### See Friends and Popular Posts
    
We were focused on making terra accessible to the younger demographic as often times, they can be left out in the question of how to *"be more environmentally friendly"* or *"act on climate"*, simply due to their age and lack of resources. With terra, the power and resources are brought straight to their phone. Additionally, people ***love*** being able to connect with their friends and understand how they are contributing as well. With this in mind, we focused on bringing this front and center and in terra's ***"newsfeed"*** tab, we have accomplished just that; An absolutely simple and elegant feed of all creator and friends you follow and their posts . With an abundance of information, the feed provides posts with **true**, **live** profile pictures, main images, content from *"create post"*, likes, comments, location, but most importantly a ***#terra-tag***. A terra-tag is just another way people can create connection through fun, gameified challenges, explained below.
        
### An Awesome *Point-Based* System that *Just Makes Sense*
    
When we came up with terra, one concern with many projects and apps is *adoption and retention*, or the thought of "how do we bring users in and keep them engaged". That what we were addressing with the platform. The answer to this question was to "gamify" the entire platform. In order to do this we knew that a simple game or puzzle wasn't going to last long. The solution was to rethink how a social platform could not only benefit the environment and user, but could multiply their impact from doing so. This was done through **#terra-tags**. In short, think of **#terra-tags** as a trend or hashtag that users can do themselves. Some great examples are #SpreadKnowledge and #communityRecycling. With these tags, users can not only create posts with them attached, but also **challenge** their friends and creators to do that same as them. The same goes the other way; their friends can challenge them to do the same. But how does this effectively keep them on the platform? Well each challenge is timed, meaning that the faster they complete the challenge the more **terra-points** they would effectively earn. However, more terra-points can be earned through gaining traction through people interacting with you post and increasing the number of "likes" on it which is represented through the leaf button on each post. The likes, the more points, the higher you rank on the leaderboard
        
### What Can I Use My Points For?

Where this all comes together is how these points can be used and really ultimately keeping them on the platform. This is where the points redemption page comes in. Users are able to donate their points to foundations like the Arbor Foundation where a certain amount of points equates to a dollar amount donated. This if effectively possible with Ads integrations and sponsors in order to keep users doing good for their community and allowing younger people to multiply their impact just from their own actions!
        
### How We Built It / Challenges We Ran Into

This project combined so many different technologies and systems in order to reach our envisioned implementation and functionality, planning diligently in order to be able to provide as much live and true data as possible. The main user-facing app is built using Flutter, a cross-platform mobile development framework that allows for beautiful UI/UX while being able to compile down natively to ARM code for the phone on both **iOS** and **Android**. The app connects several APIs: **Google Maps API**, **imgbb API**, and our **custom backend**. Image handling was by far the most complex technically to figure out as it requires multiple APIs in order to accurately track in such a short period of time. Originally, we were converting the images to base64 on the client-side, then uploading that string to the custom backend to be stored in **mongoDB**. However, once the connections were done, it was unfortunately too much for the app to pull down, especially with so many posts. So, we moved to storing the images using the **imgBB** API. Imgbb is a site where you can store photos in the cloud and gives you back a url in the **JSON**. So, we send the base64 string to the API endpoint when a post is created and it hands back a URL which then sent, using a POST **request**, back to our custom backend where the link is them stored and can be delivered back to the app whenever needed. A complex implementation, but worked beautifully. The backend was built using **Flask**, connects to **mongoDB** and is deployed onto **Heroku** in order to access the endpoint client-side.
  

### What we are proud of:

We are super proud of how much we learned in the span of a few short days. We picked up some new APIs and learned how to properly manage data throughout an entire application all while supporting the movement of EarthXHack!

### What We learned

Being able to work remotely has taught us all a lot about how to efficiently communicate and update one another. In addition, we learned about how to work with several new technologies and how to really integrate everything in order to make a deliverable product at the end of the day that we are proud of.

### What's next for terra?

We hope to get sponsors and users on the app in order to start the chain toward an overall cleaner and more knowledgeable community locally and worldwide!