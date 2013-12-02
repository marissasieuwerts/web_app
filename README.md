# Web App: UvAcourses

*Proposal for a Web App project for the course Web App studio*

With the UvA courses app, users are able to 'shop' for courses at the University of Amsterdam

###*Features:*

1. MODELS: 
        * users' database so users are able to login and retrieve the courses they are enrolled for (showed in the home page feed)
        * enrolled courses database linked to the users' database with a user ID
        * courses database listing the available courses in general
        * temporary database 'shopping basket' don't really have a clue how to implement this yet
        
2. VIEWS: 
       * sign up page, a user needs to sign up with their student ID number, a password and their email
	   * sign in page
	   * home page listing a 'feed' to show what courses a logged-in user has enrolled for (with a delete option to drop the course)
	   * search page wherein users are able to retrieve the available courses and put them in a shopping basket
	   * 'shopping basket' wherein picked courses are temporarily stored until 'checkout'
	   * show succesfull actions like sign in, enroll or drop courses with a flash message
	   
3. CONTROLLERS: 
       * user controller to handle logins, sign out, sign up, any changes in enrolled courses etc.
       * static pages controller to handle static pages like home, about the app and contact
       * sessions controller to handle user login and keep track of it using cookies
       * enrolled courses controller to handle the courses feed at the users' homepage and any changes to it (dropping course with delete/destroy, enrolling courses)
       * 'relationships' controller to link courses users are enrolled for back to their user ID
       * something to handle the temporary storage of the users' shopping basket
             
###*Frameworks, languages, libraries or other technologies:*
* Ruby on Rails for the basic implementation
* HTML and CSS for layout and styling (might use a library like Bootstrap or any other libraries I come up with after further research)
* SQLite for any database actions
* AJAX to create a button that puts courses in the shopping basket / a temporary database to shop for courses without refreshing the page

             
             
