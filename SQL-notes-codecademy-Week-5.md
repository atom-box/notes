1.  Cool!  npm install sqlite3 worked.

# SELECT * from celebs;

# Make a new table
CREATE TABLE table_name (
    column_1 data_type, 
    column_2 data_type, 
    column_3 data_type
  );

*or*
CREATE TABLE ()

*or*
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
:::::::::::::::::::::::


))))))))))))))))))))))))))))))))))))))
oooooooooooooooooooooooooooooooooooooo
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

(1/1) 
All I need to know about startups I learned from an Captain Fantastic Elton John biography:  set a sustainable daily schedule of hard work, find a startup partner that handles a different skill set than yours and build a history of respecting each other's traditions.   If he gives you a weird lyric, just sincerely sing it like you mean it.  off load lyric writing, recording, backing vocal writing to Gus Dudgeon, Bernie Taupin, Davey Johnstone.   Release four or five albums that aren't great, but get better the whole time.   (Empty Sky.)
And one anti-example:  don't try cocaine.  Ever.
Amazing example of the work pace:  Caribou LP, in 8 days, not only recorded, but also written.  (Backing vocals and horns were outsourced and added later.)

When my fater-in-law visits we do calistenics.  
He taught me this morning to stick my foot through a paint can and do quadriceps in a chair. 

Next action, Monday:  Zed Shaw the error part.  Copy the last two lessons!!!!