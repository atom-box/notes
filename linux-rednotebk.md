

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
