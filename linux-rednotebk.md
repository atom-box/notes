PHPUNIT /srv/www $ ant phpunit-cc
PHPUNIT phpdbg -qrr vendor/bin/phpunit src/DealExpress/OfficeDepotBundle/Tests/Consumer/CostConsumerTest.php 
while php vendor/bin/phpunit --filter testReviseOrderTotalsNoCouponNotEditableDoesNotCallAddTotal tests/library/Doi/StoreTest.php ; do : ; done
PHPUNIT  
PHPUNIT 

-----------------------
aws logs filter-log-events   --log-group-name /aws/lambda/officesupply-inbound-ftp  --limit 55
aws logs filter-log-events   --log-group-name /aws/lambda/officesupply-inbound-ftp  --start-time 1583606815

sudo chown -R $USER:$USER /var/www/example.com/html  HOW TO MAKE SURE A CERTAIN USER WILL HAVE ACCESS:
--------------------

sudo chmod -R 755 /var/www   HOW TO CHANGE UPSTREAM:
-------------------




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
MYSQL mysql  THIS SOLVED MY ABLE TO LOOK AT ALEX'S STORY   select TABLE_NAME, COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS     where COLUMN_NAME like '%log%'   order by TABLE_NAME\G;


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
