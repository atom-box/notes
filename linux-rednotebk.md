    symfony SYMFONY
PHPUNIT /srv/www $ ant phpunit-cc
PHPUNIT phpdbg -qrr vendor/bin/phpunit src/DealExpress/OfficeDepotBundle/Tests/Consumer/CostConsumerTest.php 
while php vendor/bin/phpunit --filter testReviseOrderTotalsNoCouponNotEditableDoesNotCallAddTotal tests/library/Doi/StoreTest.php ; do : ; done
PHPUNIT  
PHPUNIT 

-----------------------
aws logs filter-log-events   --log-group-name /aws/lambda/officesupply-inbound-ftp  --limit 55
aws logs filter-log-events   --log-group-name /aws/lambda/officesupply-inbound-ftp  --start-time 1583606815
aws s3 ls --recursive s3://dx-it-dev/dx-development-rrehbein.officesupply-dev.com-dev/development/reports/edi/as2/php sniff your code:      git check-branch   && vendor/bin/phpcbf --standard=application/config/ruleset.xml that_file_name

sudo chown -R $USER:$USER /var/www/example.com/html  HOW TO MAKE SURE A CERTAIN USER WILL HAVE ACCESS:
--------------------

sudo chmod -R 755 /var/www   HOW TO CHANGE UPSTREAM:
-------------------
All dc DCs /home/egenest/projects/DiscountOfficeItems/src/DealExpress/AdminBundle/Resources/config/controllers.xml   




git checkout --patch amazing_feature_branch index.html // THIS WILL MERGE A SINGLE FILE, INTERACTIVELY


aws s3 ls s3://dx-data/log/2020/


tree -a all;show hidden files  
tree  -d directories
tree  -fi full path/omit indenting
tree  -Pa for Regex
tree  -I anti regex
tree  -s show sizes
tree  -D show modified date
tree  -t sort modified date
tree  -L limit the depth
tree --filelimit limit the number of children
tree -F  append a slash to folder names 


FTP  only say the remote, at first.  presence in your pwd is implied:
ftp vmwebdev (if local... otherwise something.1and1.com, whatever is after the AT SIGN)
open vmwebdev  (name and pwd)
SFTP  put filename.txt
IP ADDRESS:  google or bing IP ADDRESS.  gives just machine you are on
IPCONFIG gives info too

DU tells SIZE
du /etc
du /etc/man
du .
du ~/Dropbox/code




su (and then) & sudo useradd -m tim   * How To Create A User With A Home Directory 
sudo useradd -m -d /home/narnia/testGirl  testGirl    * How To Create A User 
sudo passwd testGirl  * How To Change A User's Password Using Linux 

su - testGirl  * How To Switch Users
su - testBoy 


find  ./  -name app.js   FIND A FILE NAMED app.js
find  /  -newer foo.js -print   FIND ALL FILES NEWR THAN foo.js
find /usr/src -name V=CVS  -prune  -o -depth +6 -print  FIND FILES AT LEAST SEVEN LAYERS DEEP IN directory /usr/src
find . -type f -name "*.php"   FIND FILES ENDING IN php EXTENSION

TAIL syntax
tail -n 100


tr "[:punct:]"  "\n"  <  file.txt

TR list of classes [::] alnum  alpha  digit  lower   upper   print   

THE ORDER OF ARGUMENTS 150  

bind; APPLE + ARROW; switches between terminals or APPLE + TIC
bind; APPLE + K;     clears the terminal window

NANO; nano -S -T 3; smooth scroll tab three
GREP; grep '.gitignore /Users/evan/... -r
UNIX; ls -d
JS; ALERT, PROMPT, CONFIRM; three cheapie pop ups
bind; APPLE L; selects entire line in sublime
FIND; find -m time 3; how many days
FIND; find -name index.html
FIND; find /homework1 /css -atime +30
FIND; find  .  -print
UNIX;  du -a
REGEX;  sed 's_[^aeiou]_+_g'  ; replaces all vowels
REGEX;  \<  \> ;  matches words
REGEX;  \{  \}  ; matches # of occurances
bind;  SHIFT + CTL + UP ; goes in and out of holistic desktop
REMOVE all newLINEs !!! tr -d "\n"
SED to remove based on REGEX match: sed "s_pattern__g" & tr -d "\n"
TR break on punctuation:   tr "[:punct:]"  "\n" < file.txt
tree -I "*module*" -d -D
tree -I  -d -D

"mysql  -- If you find that the mysql output is hard to see (horizontal table structure), you can use the vertical view if you have a small number of records add a BACKSLASH G as in   "select * from orders limit 1 \G"; MYSQL
mysql        MySQL [information_schema]> SELECT COLUMN_NAME, TABLE_NAME  FROM COLUMNS where COLUMN_NAME = "sku";
MYSQL mysql  THIS SOLVED MY ABLE TO LOOK AT ALEX'S STORY   
select TABLE_NAME, COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS     where COLUMN_NAME like '%log%'   order by TABLE_NAME\G;


MYSQL select * from INFORMATION_SCHEMA.COLUMNS     where COLUMN_NAME like '%dc%'   order by TABLE_NAME;
mysql Lerchs-three-table SELECT ce.*  , enl.* , p.* FROM change_event ce INNER JOIN event_note_log enl ON enl.object_id = ce.object_id INNER JOIN products p  ON p.products_id = ce.object_id WHERE ce.object_type = 'Product' LIMIT 3\G
history SNEAKY VERSION: fc -l  #   #   
 AWS HAS NO APT:      sudo yum install links 
console.assert(false, %s %s %s dogs rule, adjective1, adjective2, adjective3);
NANO; nano -liE  linenumbers, autoindent, tabstospaces
sudo apt-get --only-upgrade install google-chrome-stable
Branching without git start fix usually is git push -u atom-box <branchname>:<branchname> 
git start example-branch atom-box/pr-to-assist changes the base remote and base branch to start a branch from.
git start <branch> is a wrapper to basically:    git remote update <base remote, default "upstream">           git checkout -b <branch> <base branch, default "upstream/master">               git push -u <your repo, found it git-config> <branch>:<branch>            /// and some pivotal "I am taking this story" stuff
select * from orders_invoices where supplier_method like 'M%Bestar%'; sqlcookbook SQLCOOKBOOK

echo "Never shall I pass through Brighton on scooter (Vespa) again in this lifetime." | sed "s/[oaeiou]\{2\}/*/g"
echo "Never shall I pass through Brighton on scooter (Vespa) again in this lifetime." | sed "s/[^aeiou]\{2\}/*/g"
WORD BOUNDARY (ESCAPED)  echo "Selling his cool scooter (this Vespa). this." | sed "s/\<his\>/cat/g"
SQL where-do-i-start??    dash-DOCS are searchable.   browser from "DATABASE DIAGRAMS" page in RtDs
git stash --all save testsegregate
my new note
UNSTAGING AN ADD: git reset -- ../../src/DealExpress/TimeOptimizerXKCDTest.php
99\% of the time bin/console should be run up in the STACK SSH, not locally
SQL JOIN     select orders_id from orders join customers on customers.customers_id=orders.customers_id  where customers.tax_exempt_type=government  limit 20;
SQL UNIQUE ROWS  select tax_exempt_type  from customers group by tax_exempt_type;    
SED DELETE ENTIRE LINE IF FOUND CHAR!  sed '/[1-8]/d' dorfans_EDI_example.txt  
SED DELETE BLANKLINES    cat   dogfoodblanklines.txt  | sed "/^[[:space:]]$/d" | sed "/^$/d" 
SQL sql      select * from orders join customers on customers.customers_id=orders.customers_id where orders.date_purchased > "2019-11-07 09:32:13"  limit 20\G;
UPDATE location_disposition SET disposition="Virtual" WHERE dc=1170 limit 4;
mysql      UPDATE location_disposition SET disposition="Virtual" WHERE dc=1170 limit 4;
mysql  select * from location_disposition where dc=1078  limit 2;    &&    UPDATE location_disposition SET disposition="Virtual" WHERE dc=1170 limit 4;
SELECT column1, column2 FROM table_name ORDER BY column1, column2, ... ASC|DESC; 


update orders set date_purchased=curdate() where orders_id=3366811;
sql SQL update orders set date_purchased=curdate() where orders_id=3366811;
ROLL BACK SPURIOUS FILES AND KEEP THE ONE YOU CHANGED WELL:15135  [2020-07-24 05:45:16] git status LOOK FOR WHO CHANGED |15136  [2020-07-24 05:47:00] git add src/DealExpress/AdminBundle/Resources/views/MinimumStock/index.html.twig SAVE YOUR FAVORITE ONES|15137  [2020-07-24 05:47:53] git commit -m "Change some html values to probe the files." COMMIT IT|15138  [2020-07-24 05:48:26] git reset --hard ALL ARE WIPED CLEAN EXCEPT YOUR COMMITTEDS|15139  [2020-07-24 05:48:32] git log TO GET A HASH|15140  [2020-07-24 05:49:26] git status|15141  [2020-07-24 05:50:29] git difftool e4817e00efe3f032a THIS HASH CONFIRMED THINGS FOR MY DOUBTS|git fetch ksteinmetz && git branch -a  ALLOWS YOU TO LIST ALL REMOTE GIT DIRECTORIES OF TEAM
git fetch ksteinmetz && git branch -a && git checkout -b foo  && git merge ksteinmetz/import-process-signals-173816344 ||  ALLOWS YOU TO LIST ALL REMOTE GIT DIRECTORIES OF TEAM allows you to list remote git directories

rays way to find Office Depot office depot sql|||          select object_id from event_note_log where object_type='product'
rays office depot \\\     select object_id from event_note_log where object_type='product -- If it needs to be recent then check the  table (no  suffix) for an ID. That table has a time stamp and event_note_id > 
rays office depot \\\     select object_id from event_note_log where object_type=product -- If it needs to be recent then check the event_note table (no _log suffix) for an ID. That table has a time stamp and eventnoteid > 


|||sql|||  select * from orders_invoices join tracking_numbers  ON orders_invoices.orders_invoices_id = tracking_numbers.orders_invoices_id where supplier_id = 13 and  eta > "2020-09-01"  limit 8 \G;  FINDS OD ITEM ORDERS WITH NEWISH ETA TIMES 

sql join three tables
SELECT * FROM orders as a  RIGHT JOIN orders_invoices as b ON a.orders_id=b.orders_id JOIN tracking_numbers as c ON b.orders_invoices_id=c.orders_invoices_id  WHERE a.orders_id=875584   \G;     |||||sql join three tables

|||sql|||
This finds an order that has OD items.
SELECT  orders_id from costs as c join orders_products as o on c.products_id = o.products_id where suppliers_id = 13 limit 43;

Three way! SQL finds recent OD 13 orders that have a certain date range
 SELECT  * from costs as c join orders_products as o on c.products_id = o.products_id  JOIN orders ON o.orders_id = orders.orders_id         where date_purchased > "2020-08-31" AND date_purchased < "2020-09-01" AND suppliers_id = 13 limit 2 \G;

%COLUMN%
select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME like '%order_id%' order by TABLE_NAME;   FIND ALL COLUMNS WITH THIS HEADER find all columns with this header

Find a password
select customers_email_address, customers_password   from customers WHERE customers_email_address LIKE "%carlosj%"  limit 2 \G;   sql SQL 

(p. 49 red NB) Find products that have no MAP Minimum Allowed Price
SELECT i.sku, product_id, supplier_id  FROM  inventory  i LEFT JOIN minimum_advertised_price m USING(sku) WHERE m.price IS not NULL GROUP BY sku  LIMIT 31;


ddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

MySQL [OfficeSupply]> select supplier_id, dc from inventory      group by dc  order by supplier_id asc;
+-------------+-----------+
| supplier_id | dc        |
+-------------+-----------+
|           1 | 4         |
|           1 | 16        |
|           1 | 9         |
|           1 | 27        |
|           1 | 5         |
|           1 | 62        |
|           1 | 23        |
|           1 | 11        |
|           1 | 53        |
|           1 | 42        |
|           1 | 17        |
|           1 | 47        |
|           1 | 50        |
|           1 | 41        |
|           1 | 31        |
|           1 | 12        |
|           1 | 67        |
|           1 | 1         |
|           1 | 43        |
|           1 | 21        |
|           1 | 51        |
|           1 | 36        |
|           1 | 15        |
|           1 | 7         |
|           1 | 57        |
|           1 | 25        |
|           1 | 48        |
|           1 | 22        |
|           1 | 52        |
|           2 | 6         |
|           2 | 3         |
|           2 | 37        |
|           2 | 2         |
|           2 | 46        |
|           2 | 8         |
|           2 | 33        |
|           2 | 13        |
|           2 | 38        |
|           2 | 24        |
|           2 | 34        |
|           2 | 18        |
|           2 | 39        |
|           2 | 28        |
|           2 | 35        |
|           2 | 19        |
|           2 | 44        |
|           3 | Col       |
|           4 | 14        |
|           4 | 149       |
|           4 | 89        |
|           5 | 10        |
|           5 | 20        |
|           5 | 30        |
|           5 | 40        |
|           5 | 80        |
|           6 | Trimega   |
|           7 | MfgDirect |
|           7 | Phantom   |
|           9 | Reserve   |
|          10 | 60        |
|          12 | NMI       |
|          13 | 6869      |
|          13 | 1135      |
|          13 | 6871      |
|          13 | 5101      |
|          13 | 1080      |
|          13 | 6874      |
|          13 | 1165      |
|          13 | 5125      |
|          13 | 1090      |
|          13 | 6876      |
|          13 | 1170      |
|          13 | 1078      |
|          13 | 5910      |
|          13 | 1127      |
|          13 | 6877      |
|          13 | 1214      |
|          13 | 1079      |
+-------------+-----------+
78 rows in set (0.69 sec)

 alias syncgit= 'git fetch upstream && git checkout master && git merge upstream/master'

git stash show # gives a diff, with plusses to show what is in there
git stash list # one line per stash
git stash  save notionsfile # stashing with a name
select name, supplier_accounts_id from supplier_accounts where name like 'Notio%'; select count(*) from costs where supplier_accounts_id=264 and products_id>0;  # ray's FIND A SUPPLIER AND ITS PRODUCTS
select distinct sku from location_disposition ld where not exists (select 1 from location_disposition where sku=ld.sku and dc not in ('VW', 'MFG') and disposition <> 'Virtual') limit 10;  # find items in sql SQL that are all virtual
