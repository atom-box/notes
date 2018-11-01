MAC OS KEY BINDINGS
Press ⌘ + SPACE (Spotlight Search) 

WHERE INSTALLED FOLDER
which python
which perl

SEARCH.   IN NANO.
ctl - W

APACHE 
Apache 2.4 comes pre-packaged in macOS 10.12 Sierra, 
*check the version to verify*
httpd -v
__start the server by running the command__
apachectl start
-------------------- 
PATH OF APACHE
1) set how:
The DocumentRoot directive is set in your main server configuration file (httpd.conf) 
2) if DocumentRoot were set to /var/www/html then a request for http://www.example.com/fish/guppies.html would result in the file /var/www/html/fish/guppies.html being served to the requesting client.
------------
MAKE THE APACHE CONFIG file APPEAR! 
*from websitebeaver.com*
sudo nano /etc/apache2/httpd.conf 
Delete the #
 from #LoadModule php7_module libexec/apache2/libphp7.
-----------
PATHS WITH A SLASH AT BEGINNING
*from /etc/apache2/httpd.conf*
If the filenames do *not* begin
# with "/", the value of ServerRoot is prepended -- so "logs/access_log"
# with ServerRoot set to "/usr/local/apache2" will be interpreted by the
# server as "/usr/local/apache2/logs/access_log", whereas "/logs/access_log$
# will be interpreted as '/logs/access_log'.


START AS ROOT
sudo su -


*ADDING a user by an ADMINISTRATOR*
note, su and sudo might need to be changed per Debian vs other Linux.
FIRST, CHECK FOR ALL USERS:
sudo less /etc/passwd
MAKE CELERY
useradd celery
(although sometimes it is "adduser")
passwd _-_-_
mkdir /home/jsmith
chown jsmith:users /home/jsmith

SWITCH USER TO CELERY
exit (neccessary if you are logged in as root)
exit
su celery
ssh celery@localhost

REGEX EXAMPLES
matching a username
/^[a-z0-9_-]{3,16}$/
matching an email
/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/


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

SIZE
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
alnum  alpha  digit  lower   upper   print   blank

THE ORDER OF ARGUMENTS 150  

