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






