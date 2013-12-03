# Design document UvAcourses
Web App studio
Marissa Sieuwerts
28/11/2013

##Database model

#### User object: table ‘users’

| Column name |	Datatype |
| ----| ---- |
| ID          |	Int      |
| Student_id  |	Int (with fixed length) |
| Password (hash)	| Varchar / string |
| Created_at | Datetime |
| Updated_at |	Datetime |

ID is automatically generated to keep track of a particular user. Student number / ID and password are used to authenticate and log in. 


#### Courses I’m shopping object: table ‘Shoppingcart’

| Column name | Datatype |
| ------  |  -----|
| ID| Int |
| Course_id	| Int |
| Student_id | Int |
| Remember_token |	Int |
| Created_at |	Datetime |
| Updated_at |	Datetime |

This table is intended to store the courses the user is shopping.
Remember_token will be used to store the current session and remember the courses a user is currently shopping for; the cookies will expire after the browser gets closed (?)


#### Courses I’m taking object: table ‘Enrolled courses’ 

| Column name |	Datatype |
| ------ | -------- |
| ID |	Int |
| Follower_id (Student ID) |	Int  |
| Followed_id (Course sgid)	| Int |
| Created_at |	Datetime |
| Updated_at |	Datetime |

Following/followed datamodel from the tutorial (section 11.1.1): a logged-in user is here the following and the course is the followed. These two are wrapped up together through belongs_to and has_many relationships.

## Classes and methods

1. Models 
	* Users database so users are able to login and retrieve the courses they are enrolled for (showing in the home page feed)
	* Enrolled courses database linked to the users' database with a user ID
	* Shoppingcart database listing the courses the user is currently shopping for

2. Views
	* Sign up page, a user needs to sign up with their student ID number, a password and their email
	* Sign in page
	* Home page listing a 'feed' to show what courses a logged-in user has enrolled for (with a delete option to drop the course)
	* Search page wherein users are able to retrieve the available courses and put them in a shopping basket
	* 'Shopping basket' wherein picked courses are stored until 'checkout'
	   
3. Controllers
	* User controller to handle logins, sign out, sign up, any changes in enrolled courses etc.
	* Static pages controller to handle static pages like home, about the app and contact
	* Sessions controller to handle user login and keep track of it using cookies	
	* Enrolled courses controller to handle the courses feed at the users' homepage and any changes to it (dropping course with delete/destroy, enrolling courses)
	* 'Relationships’ controller to handle has_many and belongs_to relationships
	* Something to handle the temporary storage of the users' shopping basket


## General remarks

#### How will you integrate courses.xml into your app?
Use Nokogiri to parse the XML file to extract content from it and convert this to HTML (screen scraping)  ??
http://railscasts.com/episodes/190-screen-scraping-with-nokogiri

##### Will searches be executed client-side or server-side?
Probably server-side since it is the goal to create a mobile web app whereby you can suppose that the majority of users will access the web app via a mobile device. Heavy  processing should thus be left up to the server to decrease the running time of a search. 

##### How will users add courses to lists?
Users will be able to add courses to their ‘feed’ showing on the homepage through a ‘shopping basket’ that stores the courses that are put in the basket locally and temporarily. I’m not sure how to implement this yet, might use something like a ‘temporary’ remember_token function (a cookie) to store the courses in the ‘shoppingcart’ table, after submitting and closing the browser the cookie expires.

Users will be able to ‘drop’ courses in the feed on their homepages by simply clicking ‘Drop course’ which will perform a destroy action in the database for that particular course.


## User Interface mockups

![alt text](https://github.com/marissasieuwerts/web_app/blob/master/doc/Schermafbeelding%202013-12-02%20om%2021.43.35.png "Mockup1")

So far I tried to work with some jQuery mobile code to style the page, the page shows listed ‘search results’.
Didn’t get the actual routes to the pages working yet (so no screenshots) but the signin page and the other static pages  (in the footer navbar) will be similar to the ones in the sample app from the Rails tutorial

