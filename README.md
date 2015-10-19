# r-bulletin: like v-bulletin but not as complex

## Learning Competencies

* Build a rails app from the ground up
* Use rails nested routes
* Use activerecord associations and delegation
* Practice using form helpers and url helpers
* Navigate a list of user stories and discuss/clarify requirements

## Summary
We're going to build a fairly simple online forum system, similar to v-bulletin or phpBB or one of the many others of that ilk. But we'll build it from scratch.

To get you started we have a number of models and tables already set up, but no routes, controllers or views. The full list of user stories is outlined below. See how far you get with this in a day. We'll revisit this app later in the phase, and use it as an example for our feature testing practice.

##Getting started
Clone this repo. cd into it and ```bundle install```. Then ```rake db:drop && rake db:create && rake db:migrate && rake db:seed```

Release 0: Implement the "as a visitor" user stories

Release 1: Implement registration and login.

Release 2: Allow logged in users to create new messages and conversations

Release 3: Convert the functionality added in release 2 to use ajax

Release 4: Implement the "watched conversation" user story, and the like button. 

You have some models already set up. Some of your releases will require you to add columns to existing tables and perhaps add tables. Use new migrations for these changes - don't edit the old ones.

User stories

###R0
* As a visitor I want to see a list of topics
* As a visitor I want to see a list of conversations in a topic
* As a visitor I want to read a conversation (see the messages in it.)
* As a visitor I want to see a list of recently active conversations

###R1
* As a visitor I want to register a new account with email, username and password
* As a user I want to log in

###R2
* As a logged in user, I want to add messages to existing conversations.
* As a logged in user, I want to start new conversations in a topic.
* As a logged in user, I want to see my most recent messages.
* As a logged in user, I want to see conversations I started.

###R3
Convert the add messages and start conversations functionality to use ajax

###R4
* As a logged in user, I want to like user messages.
* As a logged in user, I should only be able to like a message once.
* As a logged in user, I should be able to see a list of my likes.
* As a visitor viewing a conversation, I should see the like count on each message.

###R5
* As a logged in user viewing an existing conversation, I should be able to click a user name to see that user's most recent messages.
* As a logged in user looking at my or another user's messages, I want to click to see the rest of the conversation that contains the message.
* As a logged in user I should be able to maintain a list of "watched" conversations that I can get back to quickly later.

###Stretch releases (or things for later)
* As a visitor I want to register to log in with twitter (read up on omniauth.)
* As a visitor registered with twitter I want to choose a screen name different from my twitter handle.
* As a logged in user I want to be able to perform a word search that should return messages containing that word, along with topics and conversations whose title contains those words (have a look at ransack.)
* As a logged in user creating a message, I want to upload 1 to 4 pictures with my message (read up on paperclip / carrierwave)
* As a registered user, I should get a welcome email (take a look at actionmailer and activejob. For local development you might want to check out mailcatcher)
* As a user watching a conversation, I should get an email when someone posts a message in that conversation (look at cron.)
* As a user watching a conversation, I should be able to click a link in the mail say "enough already" with the emails and turn them off for a single conversation or all conversations.
