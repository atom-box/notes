#Gulp, Grunt, automation

## Organize your css
Header.css
Footer.css
Banner.css

Why Node, why npm??
Package Management
Normalize.css

Node:  Hey Javascript, do you want to grow up and wear your big-boy pants?
JS:  Yeah.  Yeah, I'd like that.

## Goal: generate an HTML file, automatically
Leverage the Node filesystem module FS

<15: NPM>
Old Evan way:  google the address of bootstrap, paste it in, repeat
Newer NPM way: set up a list of what packages you need.  And now comes A-PACKAGE-MANAGER, a robot that hears your shopping list ('some kinda Bootstrap, some kinda normalize.css') and manages what to plug in there.  It gets server stuff too.

The NPM grocery list for modules is JSON, not lock.

"1.3.7" versus "^1.3.7" in your npmmodule PACKAGE
Load this exact one.     Load this or newer one.

The Udemy course gives you a pre-written package.json.   You therefore get all the same versions as him.  

GULP <>
Task Runner = Gulp
Build Tool = Gulp

Make a gulpfile.js.    Start putting in var gulp = require('gulp.');   gulp.task('default', function()={hey});
Later, at the CLI: gulp default
	some example code from the gulpfile.js
----------------------------------
gulp.task('default', function(){console.log`yipee yahoo wow.`});
gulp.task('html',  ()=>{console.log("Rent the tandem..");});
gulp.task('watch', function() {
	watch('./index.html', ()=>{
		gulp.start('html');
----------------------------------

CSS WORKFLOWS   (4 -- 12)
How to go into your gulpfile.css and tell it to process stuff for you.  You want to tell it to vacuum up and then spit out.  
----------------------------------
1.  gulp.src();
2.  gulp.dest();
3.  pipe();
----------------------------------

How to chain a pipe in Gulp.  
This pipe will have a watcher, that watches my .css, and everytime a save is detected, it will feed the whole .css through my chain of pipes, possibly babeling it, out to a temp.out.
----------------------------------
gulp.task('styles',  ()=>{
	console.log("Imagine STYLE tasks running here.");
	return gulp.src('./styles/figFlood.css').pipe(gulp.dest('./styles/temp.css'));
	;
	// see Udemy 4--12 or tutorialNotes
}
----------------------------------

