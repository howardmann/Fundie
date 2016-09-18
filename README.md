# Fundie
[Click here to see live Project (hosted on Heroku and Cloudinary)](http://prototypecrud.herokuapp.com/)

## Description
A crowd funding online marketplace where users can post and fund project ideas. Project inspiration from [Kickstarter](https://www.kickstarter.com/).  

Project designed and deployed within four days as part of General Assembly's Web Development Immersive bootcamp (week 6 project week).

## Features
Online marketplace model where users can find projects to **pledge** funds to or **create** their own new projects.

**Pledging**
- Users can find projects to fund across various categories ranging from Art to Technology
- All users begin with $5,000 in bank credit used for pledging. Users can increase their bank credit by creating new projects and receiving funding from other users

**Creating**  
- Users post new projects by including a brief description, uploaded image, target $ funding amount and time deadline (max 6 months)
- Projects *cannot* accept funds beyond the time deadline; however, projects *can* keep accepting funds beyond the target

Application also includes Project and Pledger dashboards tracking top performing projects and users by pledge amount.

## Technology stack
- [Ruby on Rails](http://guides.rubyonrails.org/) and [PostgreSQL](https://www.postgresql.org/) for back-end build and database
- [Materialize CSS](http://materializecss.com/) for front-end design
- Ruby, HTML5, CSS3 and Sass as programming languages
- [Heroku](https://www.heroku.com/) for cloud deployment
- [Cloudinary](http://cloudinary.com/) for image upload and hosting

User login and authentication written with Rails with bcrypt encryption - no other third party Ruby gems used.

## Features and APIs under consideration
- **Dynamic live loading** of dashboards using Backbone.js and Ajax fetch requests
- **Order and checkout** for users to submit and track payment and address details for pledging
- **Payments** integration with Stripe API for settling orders
- **Twilio** API for SMS notifications of pledges to projects
- **Mobile first responsive design** using Materialize CSS

## Author
Howie_Burger (Sep 2016)...call me
