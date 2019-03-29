## order of operations: this explains a lot!  
FARMERJOHN = from  join
WATCHED = where
GENEST = groupby
HEAR = having
SEWER = select
==============
DRAIN = distinct
OILY = offset
LAKE = limit

## Arithmetic can be added...
Add it to the columntitle!
Add it to the conditionals without parens

## join vocab
Jx  Ox  , join, left join, right join, full***, outer

## SQL Bolt
* col_name NOT IN (1, 3, 5)
*   col_name BETWEEN 1.5 AND 10.5

## ALMOST MISSED THIS
To be case insensitive, cant use ==
To use wildcards, must use LIKE
All strings must be quoted so that the query parser can distinguish words in the string from SQL keywords. 

THEY ALLOW ||  &&
WHERE condition
    AND/OR another_condition
    AND/OR …;

## Greatest hits I wrote:
sqlite> select (fem.tally / mal.tally) as GIRLSRULE , mal.tally, fem.tally, mal.country from mal, fem group by mal.country ORDER BY GIRLSRULE  asc limit 10 ;

 Cool!  npm install sqlite3 worked.

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
SQL Queries for the SQL: Advanced Data Retrieval and Modification v4.0.0 workshop


/* Region 1
----------------------------------*/
SELECT r.region_name,c.country_name
FROM regions r INNER JOIN countries c 
  ON r.region_id = c.region_id


/* Region 2
----------------------------------*/
SELECT job_title, min_salary
FROM jobs
UNION
SELECT job_title, min_salary
FROM new_jobs


/* Region 3
----------------------------------*/
SELECT job_title, min_salary, 'jobs'
FROM jobs
UNION
SELECT job_title, min_salary, 'new_jobs'
FROM new_jobs


/* Region 4
----------------------------------*/
SELECT job_title, min_salary, 'jobs' AS SourceTable
FROM jobs
UNION
SELECT job_title, min_salary, 'new_jobs'
FROM new_jobs


/* Region 5
----------------------------------*/
SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY job_id


/* Region 6
----------------------------------*/
SELECT job_id, COUNT(employee_id)
FROM employees
GROUP BY job_id
HAVING COUNT(employee_id) > 5


/* Region 7
----------------------------------*/
SELECT jobs.job_title, employees.salary, employees.hire_date
FROM jobs INNER JOIN employees 
  ON jobs.job_id = employees.job_id
WHERE employees.hire_date > to_date('2007/01/01', 'YYYY/MM/DD')


/* Region 8
----------------------------------*/
SELECT jobs.job_title, ROUND(AVG(employees.salary),0)
FROM jobs INNER JOIN employees 
  ON jobs.job_id = employees.job_id
WHERE employees.hire_date > to_date('2007/01/01', 'YYYY/MM/DD')
GROUP BY jobs.job_title


/* Region 9
----------------------------------*/
SELECT jobs.job_title, ROUND(AVG(employees.salary),0)
FROM jobs INNER JOIN employees 
  ON jobs.job_id = employees.job_id
WHERE employees.hire_date > to_date('2007/01/01', 'YYYY/MM/DD')
GROUP BY job_title
HAVING ROUND(AVG(employees.salary),0) > 7000


/* Region 10
----------------------------------*/
SELECT emps.first_name, emps.last_name, mgrs.first_name, mgrs.last_name
FROM employees emps INNER JOIN employees mgrs 
  ON emps.manager_id = mgrs.employee_id


/* Region 11
----------------------------------*/
SELECT emps.first_name AS "Emp First", emps.last_name AS "Emp Last", mgrs.first_name AS "Mgr First", mgrs.last_name AS "Mgr Last"
FROM employees emps INNER JOIN employees mgrs 
  ON emps.manager_id = mgrs.employee_id


/* Region 12
----------------------------------*/
SELECT emps.first_name AS "Emp First", emps.last_name AS "Emp Last", mgrs.first_name AS "Mgr First", mgrs.last_name AS "Mgr Last"
FROM employees emps LEFT OUTER JOIN employees mgrs 
  ON emps.manager_id = mgrs.employee_id

/*//////////////////////////////////////////////////////////////

USING INSERT

///////////////////////////////////////////////////////////////*/


/* Region 13
----------------------------------*/
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('IT_ADMIN','Server Administrator', 4000, 10000)


/* Region 14
----------------------------------*/
SELECT job_id, job_title
FROM jobs


/* Region 15
----------------------------------*/
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
SELECT job_id, job_title, min_salary, max_salary
FROM new_jobs


/* Region 16
----------------------------------*/
SELECT *
FROM jobs


/* Region 17
----------------------------------*/
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('IT_PROG','Programmer',2000,8000)


/* Region 18
----------------------------------*/
INSERT INTO jobs (job_id, min_salary, max_salary)
VALUES ('IT_MAN', 7000, 16000)


/* Region 19
----------------------------------*/
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('VA', 'Vanuatu', 16)


/*//////////////////////////////////////////////////////////////

USING UPDATE

///////////////////////////////////////////////////////////////*/


/* Region 20
----------------------------------*/
SELECT *
FROM jobs


/* Region 21
----------------------------------*/
UPDATE jobs
SET min_salary = (min_salary * 1.03), max_salary = (max_salary * 1.03)


/* Region 22
----------------------------------*/
SELECT *
FROM jobs


/* Region 23
----------------------------------*/
SELECT first_name, last_name, job_id, commission_pct
FROM employees
WHERE job_id = 'SA_REP'


/* Region 24
----------------------------------*/
UPDATE employees
SET commission_pct = commission_pct + .1
WHERE job_id = 'SA_REP'


/* Region 25
----------------------------------*/
SELECT first_name, last_name, job_id, commission_pct
FROM employees
WHERE job_id = 'SA_REP'


/* Region 26
----------------------------------*/
SELECT employees.first_name, employees.last_name, employees.salary, jobs.job_title
FROM employees  INNER JOIN jobs 
  ON employees.job_id = jobs.job_id
WHERE job_title LIKE '%Manager'


/* Region 27
----------------------------------*/
SELECT first_name, last_name, salary, job_id
FROM employees 
WHERE job_id IN ('FI_MGR','PU_MAN','ST_MAN') 


/* Region 28
----------------------------------*/
SELECT first_name, last_name, salary, job_id
FROM employees 
WHERE job_id IN                             
(SELECT job_id FROM jobs WHERE job_title like '%Manager')



/* Region 29
----------------------------------*/
UPDATE employees
SET salary = (salary * .98)
WHERE job_id IN
  (SELECT job_id FROM jobs
  WHERE job_title LIKE '%Manager')


/* Region 30
----------------------------------*/
SELECT first_name, last_name, salary, job_id
FROM employees 
WHERE job_id IN                   
  (SELECT job_id FROM jobs WHERE job_title like '%Manager')



/*//////////////////////////////////////////////////////////////

USING DELETE

///////////////////////////////////////////////////////////////*/


/* Region 31
----------------------------------*/
DELETE FROM new_jobs


/* Region 32
----------------------------------*/
SELECT * FROM new_jobs


/* Region 33
----------------------------------*/
SELECT job_id, job_title
FROM jobs
WHERE job_id NOT IN
  (SELECT job_id
  FROM employees)


/* Region 34
----------------------------------*/
DELETE
FROM jobs
WHERE job_id NOT IN
  (SELECT job_id
  FROM employees)


/* Region 35
----------------------------------*/
DELETE FROM jobs
WHERE job_id = 'IT_PROG'



/*//////////////////////////////////////////////////////////////

UNDERSTANDING TRANSACTIONS

///////////////////////////////////////////////////////////////*/


/* Region 36 (in Oracle SQL Developer)
----------------------------------*/
INSERT INTO regions (region_id,region_name)
VALUES (25,'Antarctica')


/* Region 37 (in Oracle SQL Developer)
----------------------------------*/
SELECT *
FROM regions


/* Region 38 (in Aqua Data Studio)
----------------------------------*/
SELECT *
FROM regions


/* Region 39 (in Oracle SQL Developer)
----------------------------------*/
COMMIT


/* Region 40 (in Oracle SQL Developer)
----------------------------------*/
UPDATE employees
SET salary = 2500


/* Region 41 (in Oracle SQL Developer)
----------------------------------*/
SELECT first_name, last_name, salary
FROM employees


/* Region 42 (in Oracle SQL Developer)
----------------------------------*/
ROLLBACK


/* Region 43
----------------------------------*/
SELECT first_name, last_name, salary
FROM employees


/* Region 44
----------------------------------*/
SELECT *
FROM regions


/*////////////////////////////////////////////////////////////////////////

SOLUTIONS TO CHALLENGE EXERCISES
The below SQL refers to the challenge exercises provided throughout the document

/////////////////////////////////////////////////////////////////////////*/

/* Challenge Exercise 1: Using UNION
-----------------------------------------------------*/
SELECT 'jobs' AS SourceTable, sum(min_salary), sum(max_salary)
FROM jobs
UNION
SELECT 'new_jobs',sum(min_salary), sum(max_salary)
FROM new_jobs


/* Challenge Exercise 2: Using HAVING
-----------------------------------------------------*/
SELECT department_name, SUM(employees.salary)
FROM departments INNER JOIN employees ON departments.department_id = employees.department_id 
GROUP BY department_name
HAVING SUM(employees.salary) > 50000


/* Challenge Exercise 3: Using SELF JOIN
-----------------------------------------------------*/
SELECT firstJob.employee_id, firstJob.end_date as "First Job Ended", secondJob.start_date as "Second Job Started"
FROM job_history firstJob INNER JOIN job_history secondJob ON firstJob.employee_id = secondJob.employee_id 
WHERE firstJob.end_date < secondJob.start_date


/* Challenge Exercise 4: Using INSERT
-----------------------------------------------------*/
INSERT INTO countries (country_id,country_name, region_id)
VALUES ('LT','Lesotho',4)

Alternate:
INSERT INTO Countries (country_id,country_name, region_id)
SELECT 'LT','Lesotho', region_ID 
FROM regions 
WHERE region_name = 'Middle East and Africa'


/* Challenge Exercise 5: Using UPDATE
-----------------------------------------------------*/
UPDATE locations
SET street_address = '9234 Packer Road', postal_code = '98111'
WHERE city='Seattle'






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
SQL Queries for the SQL: Data Retrieval v4.0.0 workshop


/* SIMPLE SELECT QUERIES
----------------------------------------------------------------------*/

/* Region 1 */
SELECT first_name, last_name
FROM employees


/* Region 2 */
SELECT * 
FROM employees




/* SORTING USING "ORDER BY"
----------------------------------------------------------------------*/

/* Region 3 */
SELECT last_name, first_name
FROM employees
ORDER BY last_name, first_name


/* Region 4 */
SELECT last_name, first_name
FROM employees
ORDER BY last_name DESC, first_name ASC


/* Region 5 */
SELECT city, state_province, postal_code
FROM locations
ORDER BY postal_code


/* Region 6 */
SELECT last_name, first_name, salary
FROM employees
ORDER BY salary


/* Region 7 */
SELECT last_name, first_name, hire_date
FROM employees
ORDER BY hire_date


/* UNDERSTANDING USING INNER JOINS
----------------------------------------------------------------------*/

/* Region 8 */
SELECT region_id, country_name
FROM countries


/* Region 9 */
SELECT region_id, country_name, region_name
FROM countries INNER JOIN regions 
  ON countries.region_id = regions.region_id


/* Region 10 */
SELECT countries.region_id, countries.country_name, regions.region_name
FROM countries INNER JOIN regions 
  ON countries.region_id = regions.region_id


/* Region 11 */
SELECT employees.last_name, employees.first_name, departments.department_name
FROM employees INNER JOIN departments
  ON employees.department_id = departments.department_id


/* Region 12 */
SELECT employees.last_name, employees.first_name, departments.department_name
FROM employees INNER JOIN departments
  ON employees.department_id = departments.department_id
ORDER BY employees.last_name


/* Region 13 */
SELECT countries.region_id, countries.country_name, regions.region_name
FROM countries INNER JOIN regions 
  ON countries.region_id = regions.region_id


/* Region 14 */
SELECT countries.region_id, countries.country_name, regions.region_name, locations.city
FROM countries 
INNER JOIN regions ON countries.region_id = regions.region_id
INNER JOIN locations ON countries.country_id = locations.country_id


/* Region 15 */
SELECT employees.last_name, employees.first_name, jobs.job_title, departments.department_name
FROM employees
INNER JOIN jobs ON employees.job_id = jobs.job_id
INNER JOIN departments ON employees.department_id = departments.department_id
ORDER BY employees.last_name



/* USING OUTER JOINS
----------------------------------------------------------------------*/

/* Region 16 */
SELECT employees.last_name, employees.first_name, departments.department_name
FROM employees LEFT OUTER JOIN departments 
  ON employees.department_id = departments.department_id
ORDER BY employees.last_name


/* Region 17 */
SELECT employees.last_name, employees.first_name, departments.department_name
FROM employees RIGHT OUTER JOIN departments 
  ON employees.department_id = departments.department_id
ORDER BY employees.last_name DESC


/* Region 18 */
SELECT regions.region_name, countries.country_name 
FROM countries INNER JOIN regions 
  ON regions.region_id = countries.region_id


/* Region 19 */
SELECT regions.region_name, countries.country_name, locations.street_address, locations.postal_code, locations.city
FROM countries
INNER JOIN regions ON regions.region_id = countries.region_id
LEFT OUTER JOIN locations ON locations.country_id = countries.country_id


/* COMPARISON OPERATORS USING "WHERE"
----------------------------------------------------------------------*/

/* Region 20 */
SELECT job_id, job_title
FROM jobs
ORDER BY job_title


/* Region 21 */
SELECT last_name, first_name, job_id
FROM employees
WHERE job_id = 'SA_REP'
ORDER BY last_name


/* Region 22 */
SELECT employees.last_name, employees.first_name, jobs.job_title
FROM employees INNER JOIN jobs 
  ON employees.job_id = jobs.job_id
WHERE jobs.job_title = 'Programmer'


/* Region 23 */
SELECT last_name, first_name, job_id
FROM employees
WHERE job_id IN ('SA_REP', 'IT_PROG')
ORDER BY job_id


/* Region 24 */
SELECT last_name, first_name, job_id
FROM employees
WHERE job_id LIKE 'AD_%'
ORDER BY job_id


/* Region 25 */
SELECT last_name, first_name, salary
FROM employees
WHERE salary > 8000
ORDER BY salary


/* Region 26 */
SELECT job_title, min_salary
FROM jobs
WHERE min_salary BETWEEN 2000 AND 4500
ORDER BY min_salary



/* UNDERSTANDING NULL VALUES
----------------------------------------------------------------------*/

/* Region 27 */
SELECT last_name, first_name, commission_pct
FROM employees
ORDER BY commission_pct


/* Region 28 */
SELECT last_name, first_name, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL


/* Region 29 */
SELECT last_name, first_name, commission_pct
FROM employees
WHERE commission_pct IS NULL




/* "AND" AND "OR" OPERATORS
----------------------------------------------------------------------*/

/* Region 30 */
SELECT employees.last_name, employees.first_name, employees.salary, departments.department_name
FROM employees INNER JOIN departments
  ON employees.department_id = departments.department_id


/* Region 31 */
SELECT employees.last_name, employees.first_name, employees.salary, departments.department_name
FROM employees INNER JOIN departments 
  ON employees.department_id = departments.department_id
WHERE employees.salary > 8000
AND departments.department_name = 'Finance'


/* Region 32 */
SELECT employees.last_name, employees.first_name, employees.salary, departments.department_name
FROM employees INNER JOIN departments
  ON employees.department_id = departments.department_id
WHERE employees.salary > 8000 
OR departments.department_name = 'Finance'


/* Region 33 */
SELECT employees.first_name, employees.last_name,departments.department_name,jobs.min_salary
FROM employees 
INNER JOIN departments ON employees.department_id = departments.department_id
INNER JOIN jobs ON employees.job_id = jobs.job_id
WHERE jobs.min_salary > 6000 and NOT departments.department_name IN ('Finance','Sales')


/* Region 34 */
SELECT employees.last_name, employees.first_name, employees.salary, departments.department_name
FROM employees INNER JOIN departments
  ON employees.department_id = departments.department_id
WHERE departments.department_name = 'Shipping' OR departments.department_name = 'Finance' AND employees.salary > 8000


/* Region 35 */
SELECT employees.last_name, employees.first_name, employees.salary, departments.department_name
FROM employees INNER JOIN departments
  ON employees.department_id = departments.department_id
WHERE (departments.department_name = 'Shipping' OR departments.department_name = 'Finance') AND employees.salary > 8000




/* USING AGGREGATE FUNCTIONS
----------------------------------------------------------------------*/

/* Region 36 */
SELECT SUM(salary)
FROM employees


/* Region 37 */
SELECT COUNT(employee_id)
FROM employees
WHERE hire_date > to_date('2008/01/01'. 'YYYY/MM/DD')


/* Region 38 */
SELECT departments.department_name, SUM(employees.salary)
FROM departments INNER JOIN employees
  ON departments.department_id = employees.department_id
GROUP BY departments.department_name


/* Region 39 */
SELECT departments.department_name AS "Dept Name", SUM(employees.salary) AS "Total Salary"
FROM departments INNER JOIN employees
ON departments.department_id = employees.department_id
GROUP BY departments.department_name


/* Region 40 */
SELECT last_name, first_name, (salary * 12) AS "Yearly Pay"
FROM employees
ORDER BY last_name, first_name


/* Region 41 */
SELECT (last_name || first_name) AS "Employee", (salary / 2) AS "Paycheck Amount"
FROM employees
ORDER BY "Employee"


/* Region 42 */
SELECT (last_name || ', ' || first_name) AS "Employee", (salary / 2) AS "Paycheck Amount"
FROM employees
ORDER BY "Employee"


############################################################
SOLUTIONS TO CHALLENGE EXERCISES
The below SQL refers to the challenge exercises provided throughout the workshop
############################################################

/* Challenge Exercise 1: 
  Simple Select Statements  
----------------------------------------------------------------------*/
SELECT job_title, min_salary, max_salary
FROM jobs
ORDER BY min_salary DESC


/* Challenge Exercise 2: 
  Using Inner Joins
----------------------------------------------------------------------*/
SELECT employees.first_name, employees.last_name, employees.email, jobs.job_title
FROM employees INNER JOIN jobs ON employees.job_id = jobs.job_id
ORDER BY jobs.job_title ASC


/* Challenge Exercise 3: 
  Select Statements Using Multiple Inner Joins
----------------------------------------------------------------------*/
SELECT employees.first_name, employees.last_name, departments.department_name, 
locations.city, locations.state_province, locations.postal_code
FROM departments 
INNER JOIN employees ON departments.department_id = employees.department_id
INNER JOIN locations ON departments.location_id = locations.location_id


/* Challenge Exercise 4: 
  Using Outer Joins
----------------------------------------------------------------------*/
SELECT departments.department_name, locations.city, locations.state_province, employees.first_name, employees.last_name
FROM departments 
INNER JOIN locations ON departments.location_id = locations.location_id
LEFT OUTER JOIN employees ON departments.manager_id = employees.employee_id


/* Challenge Exercise 5: 
  Using the WHERE Clause
----------------------------------------------------------------------*/
Exercise 1:
SELECT locations.city, locations.state_province, locations.postal_code
FROM locations INNER JOIN countries ON locations.country_id = countries.country_id
WHERE country_name IN ('Japan','Mexico','United Kingdom')

Exercise 2:
SELECT first_name, last_name, hire_date, job_id 
from employees 
WHERE hire_date > '2004/1/1' and job_id LIKE 'SH_%'


/* Challenge Exercise 6: 
  Using Functions
----------------------------------------------------------------------*/
SELECT jobs.job_title, AVG(employees.salary)
FROM employees INNER JOIN jobs ON employees.job_id = jobs.job_id
GROUP BY job_title











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
THE THREE PARTS OF _db.run_ by zombie rote in 15 minutes.  
---
---
HERE IS LESSON 8/11:
db.each("SELECT * FROM Dog WHERE breed = 'Labrador'", 
  (error, row) => {
    // This gets called for every row our query returns
    console.log(`${row.name} is a good dog`);
  },
  (error, numberOfRows) => {
    // This gets called after each of our rows have been processed
    console.log(`There were ${numberOfRows} good dogs`);
});
WTF IS NUMBEROFROWS?
---
---


Then, goal, solve 7/11 and 8/11 today and then 9/11 & 10/11 Monday.  
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

When my father-in-law visits we do calistenics.  
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
Off-site the main route. Refactor SERVER.JS.
6/10/2018
For now 
Pass in utils as methods on a tools-object. SERVER.JS runs utils exported from WORK/TOOLS.JS
6/11/2018
db.serialize 
db.run
db.run

june 18
Creates a new artist with the information from the `artist` property of the request body and saves it to the database.
Listen for a PUT on /api/artists . Create a fake artist object via a static fake SFW.  
June 19
Eyeball your 
router.get
router.put
vis-a-vis 
the solution !!
It's not cheating.  
Feel okay.
June 20
Get error handling in there for !this !that, circa line 23 in routes.js.
Comply with the Zakas "Don't call an error for if (!object.propy){do error handling}"
June 21
