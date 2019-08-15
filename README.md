This was a paired programming project, which I worked on with Hayden Bell. It demonstrates our ability to:
*create classes in Ruby
*create a database using SQL and postgreSQL
*create functions in Ruby that give the database functionality to CREATE, READ and DELETE records. So, it covers three elements of the CRUD model: Create, Read and Delete. (The ability to update records was not essential for this brief, so was not built into the project).
*create functions that cope with many-to-many relationships in SQL, using INNER JOIN.

database imdb

#ruby gems
*pg
*pr

#THE BRIEF
#TERRIBLE NEWS!

IMDB, the world's most famous internet movie database, has _crashed!_ The Powers That Be have phoned CodeClan and specifically tasked YOU with rebuilding it from scratch! So soon into the course? We tried to tell them, but they wouldn't listen!

But help is at hand, because they've given you a spec to work to:

## the new IMDB should have:
  - Movies
    - title
    - genre

  - :star: Stars :star:
    - first name
    - last name

  - Castings
    - movie_id
    - star_id
    - fee

The app should be able to
  - handle CRUD actions for all three models
  - display all the stars for a particular movie
  - and display all the movies a particular star is cast in.

## Extension

Add a budget to your movie model and create a method that will return the remaining budget once all a movie's star's fees have been taken into consideration!

#Note that for the extension I have assumed that the task refers to "all a movie's stars' fees". This is because a film's budget would probably have to account for multiple stars' fees (as most movies have more than one actor)
