# Web App: UvAcourses

####Update beta release Fri 13-12-2013

  1. clone repo
  	* git clone git@github.com:marissasieuwerts/web_app.git alice

  2. make sure all gems are there
  	* cd web_app
  	* bundle

  3. initialize and seed database
  	* rake db:setup
  	* rake db:seed

  4. start server
  	* rails s

Got a working user sign in and sign up, fixed the database (the xml file loads into SQLite tables as it is supposed to) and made it traversable in a list view.
Furthermore applied pagination through a bootstrap plugin and added styling with jQuery mobile.

Still need to work on search actions (it searches one page of the paginated list view so far) and enable the user to shop for courses or drop courses (put courses in a shopping bag and submit this into the database).

Tested the mobile view on Google chromes’ Ripple emulator app.



####*Proposal for a Web App project for the course Web App studio*

With the UvA courses app, users are able to 'shop' for courses at the University of Amsterdam

###*Features:*

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
             
###*Frameworks, languages, libraries or other technologies:*
* Ruby on Rails for the basic implementation
* HTML and CSS for layout and styling (might use a library like Bootstrap or any other libraries I come up with after further research)
* SQLite for any database actions
* AJAX to create a button that puts courses in the shopping basket / a temporary database to shop for courses without refreshing the page

             
             
