## Setup

1. yarn
2. yarn build
3. yarn build:css
4. rails db:migrate
5. rails db:seed (For development)

## Issue and why does it need solving?

The issue is that there isn't many web applications that can help people create and organise events with other people. Events such as study groups, parties or reoccuring sport socials to name a few.  

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
- [ ] Users can signup/cancel to available sessions

### Sitemap

![Image of an Sitemap for my Web Application](./app/assets/images/Sitemap.png)

### Target Audience
Students who want to organise study sessions with other students.

### Tech Stack
![HTML](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) &nbsp;&nbsp; ![SASS](https://img.shields.io/badge/SASS-hotpink.svg?style=for-the-badge&logo=SASS&logoColor=white) &nbsp;&nbsp; ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) &nbsp;&nbsp; ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) &nbsp;&nbsp; ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) &nbsp;&nbsp; ![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)

## User Stories
- As a USER I would like to CREATE an account
- As a USER I would like to LOGIN/LOGOUT
- As a USER I would like to change/reset my password
- As a USER I would like to UPLOAD an image
- As a USER I would like to UPDATE my profile picture
- As a USER I would like to VIEW/CREATE/EDIT/DELETE a study SESSION
- As a USER I would like to SIGNUP to a study SESSION
- As a USER I would like to CANCEL a SIGNUP to a study SESSION

## Explain the different high-level components (abstractions) in your app

## Detail any third party services that your app will use

## ERD and Schema

![Image of an Entity Relational Diagram](./app/assets/images/erd.png)

## Describe your projects models in terms of the relationships (active record associations) they have with each other
There is a many to many relationship between USERS and SESSIONS therefore a linking table needs to be created called USER_SESSIONS
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
- USERS can create zero to many SESSIONS
- A SESSION belongs to a User
- A USER can sign up to zero to many SESSIONS through USER_SESSION
- A SESSION can have one to many USERS signup through USER_SESSION
- A USER_SESSION belongs to a USER
- A USER_SESSION belongs to a SESSION

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