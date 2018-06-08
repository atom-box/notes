1.  Cool!  npm install sqlite3 worked.

# SELECT * from celebs;

# Make a new table
CREATE TABLE IF NOT EXISTS table_name (
    column_1 data_type, 
    column_2 data_type, 
    column_3 data_type
  );

*or*

CREATE TABLE ()

* or *

 JUST ONE ROW, SHOWING foreign key
 group_id integer NOT NULL,
        FOREIGN KEY (group_id) REFERENCES supplier_groups(group_id)


*or*

The "CREATE TABLE" command is used to create a new table in an SQLite database. A CREATE TABLE command specifies the following attributes of the new table:

    The name of the new table.

    The database in which the new table is created. Tables may be created in the main database, the temp database, or in any attached database.

    The name of each column in the table.

    The declared type of each column in the table.

    A default value or expression for each column in the table.

    A default collation sequence to use with each column.

    Optionally, a PRIMARY KEY for the table. Both single column and composite (multiple column) primary keys are supported.

    A set of SQL constraints for each table. SQLite supports UNIQUE, NOT NULL, CHECK and FOREIGN KEY constraints.

    Whether the table is a WITHOUT ROWID table. 

_or_
CREATE TABLE awards (
  id INTEGER PRIMARY KEY,
  recipient TEXT NOT NULL,
  award_name TEXT DEFAULT "Grammy");

*or*
CREATE TABLE celebs (
    id INTEGER PRIMARY KEY, 
    name TEXT UNIQUE,
    date_of_birth TEXT NOT NULL,
    date_of_death TEXT DEFAULT 'Not Applicable',
);

# Generic command
_clause_ AND  _parameter_

# INSERT
INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 21);

# EDIT
UPDATE celebs 
SET age = 22 
WHERE id = 1; 

# adding A COLUMN INSTEAD OF A ROW
??
ALTER TABLE celebs ADD COLUMN twitter_handle TEXT; 

# DELETE
DELETE FROM celebs WHERE twitter_handle IS NULL; 

note!  IS  not EQUALS SIGN.

# UNIQUE
## select distinct ____  from _____

SELECT * FROM _____ WHERE year >= 1999;

SELECT DISTINCT column, another_column, …
FROM mytable
WHERE condition(s);

# WILDCARDS
(exactly one)
 SELECT * 
 FROM movies
 WHERE name LIKE 'Se_en';

(zero or more)
 SELECT * 
 FROM movies 
 WHERE name LIKE '%man%';

 # NULL in sqlite
 It is not possible to test for NULL values with comparison operators, such as = and !=. Instead, we will have to use these operators: IS NULL   IS NOT NULL

# BETWEEN
SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;
Really interesting point to emphasize again:
    BETWEEN two letters is not inclusive of the second letter.
    BETWEEN two numbers is.

# SORTING
 SELECT *
 FROM movies
 ORDER BY name;

 # LIMIT
 ...LIMIT 33;
 LIMIT always goes at the very end.

 # LOGIC !!
 SELECT name,
 CASE
  WHEN imdb_rating > 7 THEN 'Good'
  WHEN imdb_rating > 5 THEN 'Okay'
  ELSE 'Bad'
 END
FROM movies;

		...that comma tripped me up
		...use hen power, as in 
		comma
		WHEN _____ THEN _____

SELECT DISTINCT titles, DISTINCT years
SELECT ___       GROUP BY ___
SELECT ___       ORDER BY ___
LIMIT 36 OFFSET 11;


# COUNT 
SELECT somecolumn,someothercolumn, COUNT(*) 
   FROM my_table 
GROUP BY somecolumn,someothercolumn

# ORDER   LIMIT   OFFSET

SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC
LIMIT num_limit OFFSET num_offset;


# RENAME COLUMNS IN 1-2-3 STEPS

Say you have a table and need to rename "colb" to "col_b":
First you rename the old table:
ALTER TABLE orig_table_name RENAME TO tmp_table_name;
Then create the new table, based on the old table but with the updated column name:
CREATE TABLE orig_table_name (
  col_a INT
, col_b INT
);
Then copy the contents across from the original table.
INSERT INTO orig_table_name(col_a, col_b)
SELECT col_a, colb
FROM tmp_table_name;
Lastly, drop the old table.
DROP TABLE tmp_table_name;
Wrapping all this in a BEGIN TRANSACTION; and COMMIT; is also probably a good idea.


# COUNT 

SELECT COUNT(*)
FROM table_name;

# my-recipe-for-best-countrys table
SELECT  country, count(*) as "ducats" from GoldMedal group by country order by ducats desc;


# subqueries --> SUBQUERIES -[also called NESTED QUERY]-> 

#Queries with expressions
SELECT particle_speed / 2.0 AS half_particle_speed
FROM physics_data
WHERE ABS(particle_position) * 10.0 > 500;

#Inner Join

Select query with INNER JOIN on multiple tables
SELECT column, another_table_column, …
FROM mytable
INNER JOIN another_table 
    ON mytable.id = another_table.id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;

# Two Possible Solutions to that last step of OLYMPICS:
Zeroeth choice is to count two columns and divide some nonsense.
First choice is to do it as a nested table.  S  F  W  ( s  X AS Y f w); needs nought after parens!
Second choice is to store a view.

# VIEWS

CREATE VIEW view_name AS select(*) from Players;

Non-View example  ------------------------------------------------  
SELECT
 trackid,
 tracks.name,
 albums.Title AS album,
 media_types.Name AS media,
 genres.Name AS genres
FROM
 tracks
INNER JOIN albums ON Albums.AlbumId = tracks.AlbumId
INNER JOIN media_types ON media_types.MediaTypeId = tracks.MediaTypeId
INNER JOIN genres ON genres.GenreId = tracks.GenreId;

View-Example of Same statement ----------------------------------
CREATE VIEW v_tracks 
AS 
SELECT
 trackid,
 tracks.name,
 albums.Title AS album,
 media_types.Name AS media,
 genres.Name AS genres
FROM
 tracks
INNER JOIN albums ON Albums.AlbumId = tracks.AlbumId
INNER JOIN media_types ON media_types.MediaTypeId = tracks.MediaTypeId
INNER JOIN genres ON genres.GenreId = tracks.GenreId;

# VIEW (part II, cont'd)
You'll get errors if you re-create an existing view.  
Hence:
DROP TABLE x;
DROP VIEW x;
...each is userful.

Or:
DROP TABLE IF EXISTS x;

Or, when making: 
CREATE TEMP VIEW x AS s f w . . . 

#SQL Functions
COUNT Function 	Return the count of an expression
SUM Function 	Return the sum of an expression
MIN Function 	Return the min of an expression
MAX Function 	Return the max of an expression
AVG Function 

# JOIN   (or INNER JOIN)
SELECT *
FROM 
orders JOIN customers
  ON orders.customer_id = 
  customers.customer_id
*notice the 'inner' was optional.*

SELECT Title, Rating FROM 
movies INNER JOIN Boxoffice 
ON 
Movies.id = Boxoffice.Movie_id
ORDER BY Rating DESC;
//again, it is okay to say simply JOIN

#OTHER JOIN STYLES (left , full, right, cross)  [no such syntax term OUTER]
 
Select query with LEFT/RIGHT/FULL JOINs on multiple tables
*most joins are done on foreign keys with primary keys -- sort of like bringing the cousins back home.  This allows construction of a more-fluid excel type row*

SELECT column, another_column, …
FROM mytable
INNER/LEFT/RIGHT/FULL JOIN another_table 
    ON mytable.id = another_table.matching_id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;

*crossjoin*
*predict no. of rows! answer: a TIMES b*
*crossing 2 on 4 gives 8*
*crossjoin crams things together but doesn't line anything up; it asks-not for any common key, hence it lacks any ON = ON*
*classic way to use crossJOIN is to add conditions:   COUNT(*) WHERE MONTH < STARTMONTH AND MONTH GREATER THAN ENDMONTH *
SELECT shirts.shirt_color,
       pants.pant_color
FROM shirts
CROSS JOIN pants;

# UNION 
_for stacking_
_main rule: headings are identical_

charmates@gmail.com
celerity 

SELECT *
 FROM table1
 UNION
 SELECT *
 FROM table2;

 =================
start projrct sqlite notes
 =================
111111
const sqlite = require('sqlite3');
222222
const db = new sqlite.Database('./db.sqlite');
OPTIONAL
 const { printQueryResults } = require('./utils');


 db.all("SELECT * FROM Dog", (error, rows) => {
  printQueryResults(rows.find(row => row.id === 1));
});
VERSUS
db.get("SELECT * FROM Dog WHERE owner_name = 'Charlie'", (error, row) => {
  printQueryResults(row); 
});
OR
db.get(   'SELECT * FROM TemperatureData WHERE year = 1965', (error, rows) => {
  printQueryResults(rows)
}
);

NOTE: 
It's important to note that even if multiple rows match the query, db.get() will only return a single result. 

#USING PLACEHOLDER($)

const furLength1 = "short";
const furLength2 = "long";
const furColor1 = "brown";
const furColor2 = "grey";

const findDogByFur = (length, color) => {
  db.all(
    "SELECT * FROM Dog WHERE fur_length = $furLength AND fur_color = $furColor", 
    {
      $furLength: length,
      $furColor: color
    }, 
    (error, rows) => {
      printQueryResults(rows);
    }
});

# THE THREE PARTS OF _db.run_ #
const { printQueryResults } = require('./utils');
const sqlite = require('sqlite3');

const db = new sqlite.Database('./db.sqlite');

const newRow = {
  location: 'Istanbul, Turkey',
  year: 1976,
}

db.run('INSERT INTO TemperatureData (location, year, temp_avg) VALUES ($location, $year, $tempAvg)', {
  $location: newRow.location,
  $year: newRow.year,
  $tempAvg: newRow.tempAvg
}, function(error) {
  // handle errors here!

  console.log(this.lastID);
});




))))))))))))))))))))))))))))))))))))))
oooooooooooooooooooooooooooooooooooooo
))))))))))))))))))))))))))))))))))))))
oooooooooooooooooooooooooooooooooooooo
#======= #Learn Node SQLite# =========
))))))))))))))))))))))))))))))))))))))
oooooooooooooooooooooooooooooooooooooo

====  _Handling Errors Gracefully_  ==
====  _Handling Errors Gracefully_  ==
====  _Handling Errors Gracefully_  ==

const { printQueryResults } = require('./utils');
const sqlite = require('sqlite3');

const db = new sqlite.Database('./db.sqlite');

const newRow = {
  location: 'Istanbul, Turkey',
  year: 1976,
  tempAvg: 13.35
}

db.run('INSERT INTO TemperatureData (location, year, temp_avg) VALUES ($location, $year, $tempAvg)', {
  $location: newRow.location,
  $year: newRow.year,
  $tempAvg: newRow.tempAvg
}, function(error) {
  // handle errors here!
  if(error){
    return console.log(error);
  }
  
  console.log(this.lastID);
  
  db.get('SELECT * FROM TemperatureData WHERE id = $id', {
      $id: this.lastID
  },
  function(error, row){
    printQueryResults(row);
  });
});

 
))))))))))))))))))))))))))))))))))))))
oooooooooooooooooooooooooooooooooooooo
======================================
process every row returned 
from a database query. 
oooooooooooooooooooooooooooooooooooooo
======================================
db.each("SELECT * FROM Dog WHERE breed = 'Labrador'", 
  (error, row) => {
    // This gets called for every row our query returns
    console.log(`${row.name} is a good dog`);
  },
  (error, numberOfRows) => {
    // This gets called after each of our rows have been processed
    console.log(`There were ${numberOfRows} good dogs`);
});

::::::::::::::::::
const { printQueryResults, calculateAverages, addClimateRowToObject } = require('./utils');
const sqlite = require('sqlite3');

const db = new sqlite.Database('./db.sqlite');

const temperaturesByYear = {};

db.run('DROP TABLE IF EXISTS Average', error => {
  if (error) {
    throw error;
  }
  db.each('SELECT * FROM TemperatureData',
    (error, row) => {
      if (error) {
        throw error;
      }
      addClimateRowToObject(row, temperaturesByYear);
    }, 
    error => {
      if (error) {
        throw error;
      }
      const averageTemperatureByYear = calculateAverages(temperaturesByYear);
      printQueryResults(averageTemperatureByYear);
    }
  );
});
----------
#By this point we've learned in SQLITE to:
    Query a database for weather records by location.
    Reformat that data into a JavaScript object.
    Manipulate that JavaScript object to find new, meaningful information.
_________
w3Schools -- ERRORS  ERRORS  W3
_________
function myFunction() {
    var message, x;
    message = document.getElementById("p01");
    message.innerHTML = "";
    x = document.getElementById("demo").value;
    try {
        if(x == "") throw "empty";
        if(isNaN(x)) throw "not a number";
        x = Number(x);
        if(x < 5) throw "too low";
        if(x > 10) throw "too high";
    }
    catch(err) {
        message.innerHTML = "Input is " + err;
    }
}
_________

Lesson (9/11)in Part 6
#Creating A New Table))))))))))))))))))
const { calculateAverages, addClimateRowToObject, logNodeError, printQueryResults } = require('./utils');
const sqlite = require('sqlite3');

const db = new sqlite.Database('./db.sqlite');

const temperaturesByYear = {};

// start by wrapping all the code below in a serialize method

db.run('DROP TABLE IF EXISTS Average', error => {
  if (error) {
    throw error;
  }
  db.each('SELECT * FROM TemperatureData',
    (error, row) => {
      if (error) {
        throw error;
      }
      addClimateRowToObject(row, temperaturesByYear);
    }, 
    error => {
      if (error) {
        throw error;
      }
      const averageTemperatureByYear = calculateAverages(temperaturesByYear);
      db.run('CREATE TABLE Average (id INTEGER PRIMARY KEY, year INTEGER NOT NULL, temperature REAL NOT NULL)', logNodeError);
      averageTemperatureByYear.forEach(row => {
        db.run('INSERT INTO Average (year, temperature) VALUES ($year, $temp)', {
          $year: row.year,
          $temp: row.temperature
        }, err => {
          if (err) {
            console.log(err);
          }
        });
      });
    }
  );
});
______________ 
#Lesson 10/11
##Forcing Code to NOT thread, to run in order

*Before:*

*Instructions:*
Instructions
1.

Let's un-nest your code to take advantage of db.serialize(). We'll go step by step. First, open a call to db.serialize(). Put all of your nested db code inside of db.serialize()’s callback function.

Your code should a structure resembling this:

db.serialize(() => {
  // All your current db.<method> code
});

2.

We start with a clean slate every time the code runs with a 
DROP TABLE IF EXISTS 
statement. . All your queries are currently inside the callback for this query. Close the callback function after the error checking and un-nest the db.each() method You can leave the contents of db.each() as they are for now. The db.each() query should be on the same level as your DROP TABLE query and will run serially after it.

The DROP TABLE query should be completely closed before the db.each():

// Inside db.serialize():
db.run('DROP TABLE ....',
  err => {
    // Handle errors
  }
);
db.each('<query>', (err, row) => {
  // Your other queries
});

3.

Move your command to CREATE the table Average into your db.serialize() method call right after dropping the table and before db.each(). It should be at the same level of nesting as db.each().

Leave your command to INSERT the rows into Average inside the second callback of db.each(), guaranteeing that the averages are calculated after your table is created.

Your code inside db.serialize() should now have this structure:

db.run('DROP TABLE ....', (err) => {
  // Contents for error handling
});
db.run('CREATE TABLE ... ', (err) => {
  // Contents for error handling
});
db.each('<query>', (err, row) => {
  // All the rest of your logic
});

4.

No more errors! After all your rows have been inserted with the averageTemperatureByYear.forEach() loop inside db.each(), create a new db.all() query to SELECT all rows from the Average table and printQueryResults() with the transformed data!

Use db.all() to select many rows.
5.

We were able to add this information to the new table, congrats! Review the results logged to the console, do they make sense?







:::::::::::::::::::

db.serialize(() => {                                                                                                                          
  db.run("DROP TABLE Dog");
  db.run("CREATE TABLE Dog");
  db.run("INSERT INTO Dog (breed, name, owner, fur_color, fur_length) VALUES  ('Dachshund', 'Spike', 'Elizabeth', 'Brown', 'Short')");
});


::::::::::::::::::
1)   sqlite3 is the node library for sqlite
2)   SYNTAX FOR db.run
___
db.run(sql, params, function(err){
  // 
});
___
*If error occurred*, you can find the detailed information in the err argument of the callback function.

*If executed successfully*, the this object of the callback function will contain two properties:

    lastID property stores the value of the last inserted row ID.
    changes property stores the rows affected by the query.

::::::::::::::::::::::::::
::::::::::::::::::::::::::
::::::::::::::::::::::::::

LIST OF ALL DB.XXX METHODS:
https://www.w3resource.com/node.js/nodejs-sqlite.php

Database#close([callback])


Database#run(sql, [param, ...], [callback])


Database#get(sql, [param, ...], [callback])
 

Database#all(sql, [param, ...], [callback])
 
Database#each(sql, [param, ...], [callback], [complete])
 

Database#exec(sql, [callback])
 
Database#prepare(sql, [param, ...], [callback])
 

Statement#bind([param, ...], [callback])
 
Statement#reset([callback])
 
Statement#finalize([callback])

Statement#run([param, ...], [callback])
 
Statement#get([param, ...], [callback])
 

Statement#all([param, ...], [callback])
 
Statement#each([param, ...], [callback], [complete])
 
##Asynchronous Callbacks-learned at Colectivo##
(1) You need to 
Nest the functions.  This enforces order of fulfillment.  However this is a bit caveman
(2) ECMA6 introduced Promise and  (pending, resolved, rejected).
https://blogs.msdn.microsoft.com/yizhang/2018/01/17/calling-node-js-sqlite-callback-function-using-promise-and-await/
(3) db.serialize() is the other clerver modern way 
#DEBUGGING (SEE ORIGINAL REF. FOR MORE COMPLETENESS)#
Writing asynchronous functions using the thread pool unfortunately also removes all stack trace information, making debugging very hard since you only see the error message, not which statement caused it. To mitigate this problem, node-sqlite3 has a verbose mode which captures stack traces when enqueuing queries. To enable this mode, call the sqlite3.verbose(), or call it directly when requiring: var sqlite3 = require('sqlite3').verbose().
 
Database#on('trace', [callback])
 

Database#on('profile', [callback])
:::::::::::::::::::::::
GOOD EXAMPLE DB.ALL
var sqlite3 = require('sqlite3').verbose();
var file = "hr";
var db = new sqlite3.Database(file);
db.all("SELECT first_name,last_name FROM employees", function(err, rows) {
        rows.forEach(function (row) {
            console.log(row.first_name, row.last_name);
        })
  }); 
db.close();
https://www.w3resource.com/node.js/nodejs-sqlite.php
:::::::::::::::::::::::
GOOD EXAMPLE OF
APP.POST
AND
DB.ALL
app.post("/login", function(req, res) {
      let db = new sqlite3.Database("./database/InvoicingApp.db");
      let sql = `SELECT * from users where email='${req.body.email}'`;
      db.all(sql, [], (err, rows) => {
        if (err) {
          throw err;
        }
        db.close();
        if (rows.length == 0) {
          return res.json({
            status: false,
            message: "Sorry, wrong email"
          });
        }
https://scotch.io/tutorials/building-a-mini-invoicing-app-with-vue-and-node-database-and-api
:::::::::::::::::::::::
:::::::::::::::::::::::
:::::::::::::::::::::::
:::::::::::::::::::::::
:::::::::::::::::::::::
:::::::::::::::::::::::










))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       )))))))))))))   TUTORIAL FOR  e.j.s.  ))))))))))))
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
view-serving can be done in raw Node, supposedly.  
Something called Jade is built-in



Control flow is possible.  
The bracket types are 
<%  %>  This means CONTROL ELEMENT
<%=  %> This means escaped output. Huh??
<%-  %>   Unescaped raw output.

oooooooooooooooooooooooooooooooooooooo
NODE    JS    TUTORIALS    POINT    SAYS:
__dirname
The __dirname represents the name of the directory that the currently executing script
resides in.
Example
Create a js file named main.js with the following code:
// Let's try to print the value of __dirname
console.log( __dirname );
Now run the main.js to see the result:
$ node main.js

""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""

RUNNING IN ORDER -- via RUN-SEQUENCE  and  GULP 
First, install run-sequence as a development dependency:

npm install --save-dev run-sequence

Then add use it in your gulpfile, like so (note these are only examples, please check the documentation for your functions for the correct way to use them):

var gulp = require('gulp');
var runSequence = require('run-sequence');
var del = require('del');
var fs = require('fs');
 
// This will run in this order:
// * build-clean
// * build-scripts and build-styles in parallel
// * build-html
// * Finally call the callback function
gulp.task('build', function(callback) {
  runSequence('build-clean',
              ['build-scripts', 'build-styles'],
              'build-html',
              callback);
});
""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""
https://nodejs.org/en/docs/guides/blocking-vs-non-blocking/
Good article.  The linkname says it all.
""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""



======================================
))))))))))))))))))))))))))))))))))))))
oooooooooooooooooooooooooooooooooooooo
======================================
))))))))))))))))))))))))))))))))))))))
oooooooooooooooooooooooooooooooooooooo
======================================
))))))))))))))))))))))))))))))))))))))
oooooooooooooooooooooooooooooooooooooo
======================================

::::::::DEV DIARY  :::::::::::::::::::
As a new programmer, I miss the old days when I was trying to solve a puzzle, like to invent a recursive algorithm.  
Now, learning framework syntax, it feels like installing plumbing. 
And the payoff is merely "Don't make a syntax mistake."
I really miss the algorithm puzzles.  
Strangely, the most moronic language, SQL, comes the 
closest to feeling like the good old algorithm days.  
Frameworks, like Express.js, just feel like "Don't screw up." and then
you run it and the best feeling obtainable is 
"Hey, it didn't mess up."
Demoted from Master of the Universe to Plumber.
(typing this allowed me to answer my own question -- that and the coffee kicking in)

Dev goals at work:
Long term, find an Udemy Build-a-Store project?  
Or will my current project calculate prices?  Calculating prices is the critical part.

Goal at work:  
find good code at mozilla.
Type by rote between phone calls.
1) cpy Tim's wikipedia page.
2) write back to the refund guy, ask what is 3 way compare
3) for each feature from my twitter run it in Meld, winMerge winDiff diffLinux
Maybe have a raw screenshots page with a Wiki-style summary up top.

Monday A.M. to do list:  
Build on your :id success:  do something javascripty.  Try to serve up a page view (30min limit) by looking at your successful serving on js in January.  Hahn file maybe?  Then quit.
To Do
Create 
the RegEx parser in javascript that will parse-out-and-display (a count of) just the vowels that were typed in.
Okay, my punishment for failing to type in a working view server is to revisit the 

todo: I'm told I can solve paths without PATH plugin.  Let's try it that way first. 
commit: 
bring this provensnippet of EJS code in to see if your NPM environment is holding back your other, broken code. 

Holy crow -- the header.html is supposed to be named .ejs !!

Wednesday to do.
Fork the project!  Git learning. 
Create a web page that will accept a comma separated list and give back list filtering functions built into js. Eventually word clouds and data. 
_TIME OFF AND IMMERSION_
Already committed to shasta week.  
And a *dad emergency* plane flight.
And Dakota week.  
How do I fit in a 3 week BOOT CAMP immersion in DC or with no pay, staying at a friends.
Ideal would be a Detroit based one! BootCamp lists are at FCCamp and that free place. 
Alternative to immersion is QUIT AND START UNPAID INTERNSHIP.   

Dev Diary Thursday.
Problem -- made a local branch. Now can't push branch to the remote. How do? 
Dev Diary Saturday.
Felt good.  Sat down and rote-typed and did For Each and objects in an array by memory, feeling better on javascript feel.  Feel good that I mailed my mom's-day card.


Thursday:
------------------- 
Try to type the 
THE THREE PARTS OF _db.run_ by zombie rote in 15 minutes.  Then, goal, solve 7/11 and 8/11 today and then 9/11 & 10/11 Monday.  
Long term goal:
--------------------
Goal is to SHAVE THIS BEARD and MongoDB the Hahn
And then either Wes Mos / React.js !!!   
And need to start going back and prettyifying my portfolio.   Maybe Portfolio step one is lots of satisfying CSS ing to make five flavors that come up when you click the button to switch flavors.  And 1+1 host it, that is the sugar for motivating my time to be useful with CK -- get that soon so June July August September become free CK lessons. 
Next to-do:
Solve in Sublime the instructions for #6.7.js
Noodle around with your Hahn exercise of Eggen printing to the screen a parsed word, via objects in an array, per Duckett.  Post to github
.   .   .   .   .   .   .   .   .   .   .  




1) cat box
2) save backups so can reinstall windows tomorrow
3) pull 15 min of dandelions.  Seed backyard.  

Sunday replant Tree 1 & 2
Monday to-do:  On your own, try to get the thing where you load utils from a separate file.   Like CONST { CRUNCH, TELL} = REQUIRE('./UTILS');

p.84
What differentiates (Henry Ford) from (the other 400 auto startupsin 1905) is that the succesful enterpreneurs had the ...ability.. to discoverwhich parts of their plans were working billiantly and which were misguided and adapt their strategies accordingly. ""
This could probably be a medium article.
(1/4) 
All I need to know about startups I learned from a Captain Fantastic Elton John biography:  
set a sustainable daily schedule of hard work by signing a two albums a year contract (graphic is 1970 to 1975 album covers) 
(2/4)
( of penned lyrics) find a startup partner that handles a different skill set , AND THEN TRUST THEM.  Choose wisely; bail if they are not a listener, 'cause it has to be a reciprocal 'I'm on your level, I understand, your thing, I trust you on it'
.  than yours and build a history of respecting each other's traditions.   If he gives you a weird lyric, just sincerely sing it like you mean it.  off load lyric writing, 
(3/4)
Your team can be potheads, imperfect, everything is cool if when you wake up each morning at Chateau au Honky Meraigne they have laid the rhythm AND the backing vocals.  Choose a drummer who is competent but not ambitious, i.e. I'm here for the 'benefits'.
recording, backing vocal writing to Gus Dudgeon, Bernie Taupin, Davey Johnstone.   (graphic of back sleeve on Capt Fantastic, them floating away)
4/4
Back to point one.  Just start!  Release four or five albums that aren't great, but get better the whole time.   (Empty Sky.)
And one anti-example:  don't try cocaine.  Ever.
Amazing example of the work pace:  Caribou LP, in 8 days, not only recorded, but also written.  (Backing vocals and horns were outsourced and added later.)

When my fater-in-law visits we do calistenics.  
He taught me this morning to stick my foot through a paint can and do quadriceps in a chair. 

Next action, Monday:  Zed Shaw the error part.  Copy the last two lessons!!!!

Wednesday 5/16/2018
to do:
Adapt the comment machine to this.  A button that responds in Duckett-splendor.  
Find that code.  
Copy the files.  Get it to just output.  Then solve all the homework !!
---
My network-builder: make my podcast/medium about not exactly tech.  Do my activism interviews podcast. Go purple (blue & red like my hero Ben Dominic).
I should do three hours of just maintenance on my resume.
---
Look on github & bookmark it:
Friendly To Open Source e.g. 'operation code'.
Only way to get there is to commit some time to it every day for a long time.  


Jane Doe, Wish I'd known: "Everyone can see your commit messages on GH."
I think mine are okay.  (Although feedback is welcome: xxxxx )

thursday commits
Start to add a little express server.  Enable one button to GET redirect  Rick-roll, as a server test.
Make the button send the text to a variable in js (hence volatile).
Using js, modify the placeholder on QUESTION in the html.
Make a express instantiate the APP object.
Make sqlite3 instantiate the sqlite object.
Hand draw some art, cut around it make the shape transparent, use it to replace Duckett's (awesome) teacher image.
Make GET work for the Express APP object on a temporary js variable.  
Store the inputted text in that object 
Add in a generic bit-icon.
Add in a personalized bit-icon for your brand. 
Add your brand somewhere with a link back to your github.

Q: When is /newentry getted?
A: button says value POST ENTRY
Q: why does ENTRY work.  seems it should be NEW-ENTRY
A: Home page button has an href
<a href="/new-entry" class="btn btn-primary " >Leave a comment.</a>
A: Later button on 3 part page I used reads
<input type="text" class="form-control" id="title" name="title" placeholder="Entry title" required>
<textarea class="form-control" id= "body" name="body" placeholder="Your comment." rows="3" required></textarea>
  <input type="submit" value="Post entry" class="btn btn-primary">
Sunday:  
Problem: boss man not running when called from within HTML
Solution: Move the Express server to its own file.  Do this by using syntax from the blue class notes or the BossMachine js scripts.
Problem:  Still getting an error: 'require not defined'.  
Solution: run as EJS
Monday to do:
Adjust the file locations of the TEACHER.PNG image and CSS file so they load okay.
Your .PNG and .CSS are M.I.A.; add the neccessary app.set('foo', path.resolve(where-is-foo)) to find them.

Tuesday:
Zed Shaw but to a limit.
By 6:15 be doing the project
7:15 lots done

HAND WRITE TO red notebook:
1) SCOPING RULES DO NOT APPLY TO CONDITIONAL LOOPS NOR FOR LOOPS
2) Whoa -- REQUIRE is a node word.  It won't work in a browser.

Goal today:
write a syntax example function that accepts A FUNCTION as args.  [Javascript you are blowing my mind that that is even possible to give and receive functions via some other function.  I ever dreamed of doing that in C++, never figured out if that was possible there.]  
write a syntax example function that accepts AN UNLIMITED # (incl zero) OF FUNCTIONS as args.
write a syntax example function that returns A FUNCTION.

5/27/2018
Next do do:

Make npm environment, save to package.json or maybe just run npm install.  (look first at the p.json to see if it has express, etc)
Read the instructions and set 3 first commits.  

6/4/2018
Write a get route for /api/artists in server.js
Take the working route for /api/artists Refactor so it exists in a separate folder called ./routes/publicRouter.js
Write a get route for /api/artists/:artistId
QUESTION: if I'm putting routes off in a folder somewhere, where?  Check Olympic and 4 precedent. 
6/5/2018
The windfall UTILs in src/XPress are not runnable -- maybe the syntax at the top of the file is tweekable?  Looks like an IIFE.  Maybe copy the entire file and hack it??


The windfall UTILs in src/XPress are not runnable -- try making them run--you should accept and set an optional database file argument from `process.env.TEST_DATABASE` in all Express route files that open and modify your database
6/6
They are pretty different. 95% unusable BUT I am using their structure and args.
Page-128- redNB will help you refactor into routes when the time comes.  

look up in sqlite3  db.run db.each db.??
b/c db.run may not be correct

0. make an app.use(x)  that runs a dummy IIFE file.  See notes+examples/iife.js
1. add seed
2. cleave to those two examples of db.each db.all

// Call Mike McCabe for canvassing 6062218025
// Call Mike McCabe for canvassing 6062218025
// Call Mike McCabe for canvassing 6062218025

6/7/2018:
Serialize the 2nd and 3rd funcs in MIGRATION.JS.  This is in response to 'unhandled error: SQL database locked.'
I linked in the Jack Kirby functions of Seed.js BUT they run at weird order.  They only run if I chaotically insert a console.log statement.  So for now, I commented it out. 
Put the 
Nest the three TABLE-CREATES in a giant I.I.F.E..  This may allow some control over their asynchronousness.
6/8/2018:
Need to make JackKirby run at the right time.   Is this done by error handling alone?  That would be amazing.  Try it!  Then go re-read the lessons of Codecademy.
TRY STICKING IN NEXT.  APP.USE(NEXT) THEN APP.USE(NEXT) ala p.61 of Hahn.
