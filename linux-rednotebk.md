FIND A FILE NAMED app.js
find  ./  -name app.js
FIND ALL FILES NEWR THAN foo.js
find  /  -newer foo.js -print
FIND FILES AT LEAST SEVEN LAYERS DEEP IN directory /usr/src
find /usr/src -name V=CVS  -prune  -o -depth +6 -print
FIND FILES ENDING IN php EXTENSION
find . -type f -name "*.php"

TAIL syntax
tail -n 100

TRANSLATE 
tr "[:punct:]"  "\n"  <  file.txt

TRANSLATE list of classes [::]
alnum  alpha  digit  lower   upper   print   blank

THE ORDER OF ARGUMENTS 150  

