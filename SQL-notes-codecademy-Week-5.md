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
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
*notice the 'inner' was optional.*

SELECT Title, Rating FROM movies
INNER JOIN Boxoffice 
ON Movies.id = Boxoffice.Movie_id
ORDER BY Rating DESC;
//again, it is okay to say simply JOIN

#OTHER JOIN STYLES (left , full, right)  [no such syntax term OUTER]
 
Select query with LEFT/RIGHT/FULL JOINs on multiple tables
SELECT column, another_column, …
FROM mytable
INNER/LEFT/RIGHT/FULL JOIN another_table 
    ON mytable.id = another_table.matching_id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;
