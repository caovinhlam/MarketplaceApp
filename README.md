## Setup

1. yarn
2. yarn build
3. yarn build:css
4. bundle install
5. rails db:migrate
   ### Important to run this for categories
6. rails db:seed (For development)

## Issue and why does it need solving?

The issue is that there isn't many web applications that can help people create and organise events with other people such as study groups, parties or reoccuring sport socials to name a few. 
Allowing the host to manage their own sessions and seeing who and how many people are attending will greatly aid them in making sound decisions for their preperation of the event.

This app solves this issue by allowing the user to create, edit and delete sessions that they have created. Other users can sign up to available events and cancel their signup anytime if they choose not to attend anymore.

## URL 
https://t2a2-session-app.herokuapp.com/

## Github
https://github.com/caovinhlam/MarketplaceApp

## Description

### Features

Account Management:
- [x] Users can create an account
- [x] Users can login/logout
- [ ] User profiles can be edited
- [ ] User can upload an image for a profile picture

Sessions:
- [x] Users can Create study sessions
- [x] Users can Edit, Delete sessions that they have created
- [x] Users can pick a category for their session
- [x] Users can upload an image for their session
- [x] Users can signup to available sessions
- [ ] Users can cancel a session they've signed up to

### Sitemap

![Image of an Sitemap for my Web Application](./app/assets/images/Sitemap.png)

### Target Audience
Any users who want to create events or participate them.

### Tech Stack
![HTML](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) &nbsp;&nbsp; ![SASS](https://img.shields.io/badge/SASS-hotpink.svg?style=for-the-badge&logo=SASS&logoColor=white) &nbsp;&nbsp; ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) &nbsp;&nbsp; ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) &nbsp;&nbsp; ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) &nbsp;&nbsp; ![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)

## User Stories
- As a USER I would like to CREATE an account so that all the sessions that I've created are stored and retrievable
- As a USER I would like to LOGIN/LOGOUT so that no one else can tamper with my sessions
- As a USER I would like to change/reset my password in case I forget my password or I feel that it's too weak
- As a USER I would like to UPLOAD an image so that the session has a visual appeal
- As a USER I would like to UPDATE my profile picture so that people can see who I am
- As a USER I would like to VIEW a SESSION so that I know what it looks like outside the editting page
- As a USER I would like to CREATE a SESSION so that other people may join
- As a USER I would like to EDIT a SESSION incase I need to change something in the future
- As a USER I would like to DELETE a SESSION incase I don't need it anymore
- As a USER I would like to SIGNUP to a SESSION so that I can keep track of when the event is
- As a USER I would like to CANCEL a SIGNUP to a SESSION incase I've changed my mind
- As a USER I would like to VIEW all SESSIONS that I have CREATED so I could keep track of the engagement and attendence
- As a USER I would like to VIEW all SESSIONS that I have signed up for so that I could keep track of when the events are

## Explain the different high-level components (abstractions) in your app
Active Record, Devise, Pundit, Active Storage, 
The Rails applications follows the MVC design pattern (Model, View, Controller) where each components has its own responsibility and serves a specific function for the web application. Therefore,  this makes the application more modular where making changes to one part of the application will not affect the other two. In MVC the model is the database of the application and in Rails, we use Active Record to abstract the database queries to the framework so that the developer does not have to worry about the syntax of a specific database. The controller is the logic base for the view and model where it can retrieve data and parse the data from the model and handle what contents are displayed on the view. Finally the view handles the user interface.

When a user types a URL to the web browser, a request gets made to the server where the Rails application is being hosted. These request can either be a GET, POST, PATCH, PUT, or DELETE. When the Rails application receives this request, it will first check if the URL routing exist and if it does then it will route it to the appropriate controller. From there the controller will decide if it needs to grab data from the model and will render the view accordingly. Once the view is rendered the request is sent back to the user's browser wher it will be displayed to the user.

## Detail any third party services that your app will use

Heroku is a cloud platform as a service and supports a lot of programming languages such as Java, Ruby, Python, PHP, Node.js and many more so that developers won't have to worry about which language to develop their application on. Being a polyglot platform, Heroku has a lot features that developers can use to build, run and scale their applications. When developers deploy their application into the Heroku servers, it runs on a virtual container called "Dynos" which gets executed on a reliable runtime environment. Developers can easily scale their app by either increasing the number of dynos or changing the type of dyno to run the app on. Heroku uses PostGreSQL to run its Cloud Database service. It's very easy for developers to deploy their application into Heroku as once Heroku's cli has been installed, developers can use git commands followed by heroku to push their repository into production.

Cloudinary allows users to upload, store, manage, deliver and manipulate images or videos for their web application. They provide their users a cloud-based image and video management service allowing them to do uploads and media manipulation without the need of software installation. Cloudinary uses a CDN providing their user a seamlessly and quick user experience when it comes to media upload and deliverance. Cloudinary provides a comprehensive API which developers can use to integrate into their web application and start using their services. Cloudinary also provides a GEM for RAILS that integrates well with Active Storage and with active storage's encrypted credentials feature, developers can easily start working with Cloudinary's web apis without worrying about their secret key or api key being accidently leaked.

## ERD and Schema

![Image of an Entity Relational Diagram](./app/assets/images/erd.png)

## Describe your projects models in terms of the relationships (active record associations) they have with each other

In the application there are 3 models which the application uses being the USER, SESSION and USER_SESSION model. There is a relationship between a USER and SESSION in that a user being a host can create a session and that session belongs to the user. Since the relationship is one to many being that sessions can be created by many users, we set the active record assocition as user has_many sessions and session belongs_to one user.

There is a unique relationship that USER has with SESSION in that a user being an attendee can signup to many sessions and that a session can have many attendees. Thus this creates a many to many relationship between USERS and SESSIONS and therefore a third model being a linking table needs to be created to create an relationship between the two models. This model is called USER_SESSIONS and will have the user id and session id as its foreign key so that it can link a single user to a single session. Therefore for our models we set this association up by having user has_many user_sessions followed with has_many sessions through user_sessions. This can also be done on the opposite with session in that a session has_many user_sessions followed with has_many users through user_sessions. Finally we set up the USER_SESSION model by having it belong_to both the USER and SESSION model.

```ruby
Model: USER
user  has_many :sessions, dependent: :destroy
      has_many :user_sessions
      has_many :sessions, through: :user_sessions
Model: SESSION
session  belongs_to :user
         has_many :user_sessions
         has_many :users, through: :user_sessions
Model: USER_SESSION
user_session  belongs_to :user
              belongs_to :session
```

## Discuss the database relations to be implemented in your application
- A USER may create zero, one or many SESSIONS as they desire but A SESSION can only be CREATED and OWNED by one USER
  - Zero to Many Relationship
- A USER can attend to zero, one or many SESSIONS as they desire and A SESSION can have zero, one or many USERS attending the session
  - Many to Many Relationship
  - A JOINT table must be created to link the two tables together, this table is called USER_SESSION
- A SESSION can only be described by a CATEGORY while a CATEGORY can be described by many SESSIONS
  - Many to One Relationship
- A SESSION can have zero, one or many IMAGES(Active_Storage_Blobs) and an IMAGE can be stored in zero, one or many SESSIONS
  - Many to Many Relationship
  - A JOINT table must be created to link the two tables together, this table is called Active_Storage_Attachments
- A Variant_Record is attached to an IMAGE when it is created 
  - One to One Relationship

## Describe the way tasks are planned and tracked in your project

I used a Kanban Board to plan and keep track of my progress of the project. Each column would indicate what stage a feature is in so that I that I can make an informed decision on which features to prioritise. With the columns I can easily see if I'm working on too many feautres since if there are too many feature cards in the "DOING" column. Trello is my choice of service since it's free, simple, minimalistic but has great features and a lot of templates to use from. I quickly chose a Kanban template that I was happy to use and everything was ready for me to use and I just needed to add the cards for my project. The functionality and features of the project were mainly based on the USER stories.

#### URL to my TRELLO
https://trello.com/b/8XXScrXO/t2a2-marketplace-project

## Wireframes

![Wireframe of the Home Page logged in](./app/assets/images/HomePage(LoggedIn).png)
<br/>

![Wireframe of the Home Page logged out](./app/assets/images/HomePage(LoggedOut).png)
<br/>

![Wireframe of the Show Page Page logged in](./app/assets/images/ShowPage(LoggedIn).png)
<br/>

![Wireframe of the Show Page Page logged out](./app/assets/images/ShowPage(LoggedOut).png)
<br/>

![Wireframe of the My Session Page logged in](./app/assets/images/MySessionPage(LoggedIn).png)
<br/>

![Wireframe of an Edit Page](./app/assets/images/EditPage(LoggedIn).png)
<br/>