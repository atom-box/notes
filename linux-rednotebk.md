





SSH & SFTP & ONEANDONE &  KUNDEN
 4497  ssh u89220366@home680775943.1and1-data.host
 4499  ssh u89220366@home680775943.1and1-data.host
 4508  ssh u89220366@home680775943.1and1-data.host
4509 


FTP
only say the remote, at first.  presence in your pwd is implied:
ftp vmwebdev (if local... otherwise something.1and1.com, whatever is after the AT SIGN)
open vmwebdev
(name and pwd)
put filename.txt
FIND YOUR IP ADDRESS: 
google or bing IP ADDRESS.  gives just machine you are on
IPCONFIG gives info too

DU tells SIZE
du /etc
du /etc/man
du .
du ~/Dropbox/code

USERADD ---- MAKE NEW USER
nano /etc/default/useradd
su
useradd testGirl (passwd and location will be done as /etc/default/useradd)
sudo passwd testGirl
(enter and reenter new passwd)
su - testGirl (change to that user)
(system prompts you for pw)


* How To Create A User With A Home Directory 
su (and then)
sudo useradd -m tim
* How To Create A User With A Different Home Directory 
sudo useradd -m -d /home/narnia/testGirl  testGirl 
* How To Change A User's Password Using Linux 
sudo passwd testGirl
* How To Switch Users
su - testGirl
su - testBoy 

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
alnum  alpha  digit  lower   upper   print   

THE ORDER OF ARGUMENTS 150  

bind; APPLE + ARROW; switches between terminals
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
