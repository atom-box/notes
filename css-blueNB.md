## selectors, review:
div, p YOU ARE A P  OR YOU ARE A DIV
div p  YOU ARE INSIDE A DIV
div > p YOUR PARENT IS A DIV
div + p YOU ARE AFTER A DIV
p.hometown  select all p elements with class hometown
------------selectors----------
 https://www.w3.org/TR/CSS2/cascade.html#specificity
Declaring a shorthand property (e.g., 'background') to be "!important" is equivalent to declaring all of its sub-properties to be "!important".

/* From the user's style sheet */
p { text-indent: 1em ! important }
p { font-style: italic ! important }
p { font-size: 18pt }
/* From the author's style sheet */
p { text-indent: 1.5em !important }
p { font: normal 12pt sans-serif !important }
p { font-size: 24pt }

6.4.3 Calculating a selector's specificity

A selector's specificity is calculated as follows:

    count 1 if the declaration is from is a 'style' attribute rather than a rule with a selector, 0 otherwise (= a) (In HTML, values of an element's "style" attribute are style sheet rules. These rules have no selectors, so a=1, b=0, c=0, and d=0.)
    count the number of ID attributes in the selector (= b)
    count the number of other attributes and pseudo-classes in the selector (= c)
    count the number of element names and pseudo-elements in the selector (= d) 

The specificity is based only on the form of the selector. In particular, a selector of the form "[id=p33]" is counted as an attribute selector (a=0, b=0, c=1, d=0), even if the id attribute is defined as an "ID" in the source document's DTD.

Concatenating the four numbers a-b-c-d (in a number system with a large base) gives the specificity.

Some examples:

 *             {}  /* a=0 b=0 c=0 d=0 -> specificity = 0,0,0,0 */
 li            {}  /* a=0 b=0 c=0 d=1 -> specificity = 0,0,0,1 */
 li:first-line {}  /* a=0 b=0 c=0 d=2 -> specificity = 0,0,0,2 */
 ul li         {}  /* a=0 b=0 c=0 d=2 -> specificity = 0,0,0,2 */
 ul ol+li      {}  /* a=0 b=0 c=0 d=3 -> specificity = 0,0,0,3 */
 h1 + *[rel=up]{}  /* a=0 b=0 c=1 d=1 -> specificity = 0,0,1,1 */
 ul ol li.red  {}  /* a=0 b=0 c=1 d=3 -> specificity = 0,0,1,3 */
 li.red.level  {}  /* a=0 b=0 c=2 d=1 -> specificity = 0,0,2,1 */
 #x34y         {}  /* a=0 b=1 c=0 d=0 -> specificity = 0,1,0,0 */
 style=""          /* a=1 b=0 c=0 d=0 -> specificity = 1,0,0,0 */

<HEAD>
<STYLE type="text/css">
  #x97z { color: red }
</STYLE>
</HEAD>
<BODY>
<P ID=x97z style="color: green">
</BODY>

In the above example, the color of the P element would be green. The declaration in the "style" attribute will override the one in the STYLE element because of cascading rule 3, since it has a higher specificity. 

## With font awesome deleted, my color and font rules are respected.
	But everything broke to newlines now.  (when FA is a class, it sticks its “i” elements together.  Or p elements too.
In font awesome, that FAB FA-TWITTER, first part can be in div instead.
 	fa fa-superscript and fa-header make math squared and drop cap respectively
DEPRECATED:  fa is deprecated.  Use FAS or FAB (solid, brand) now.

## Jumbotron
Lays out some grey real-estate, even if empty.
Easiest layout ever, Pawan Poudel
    <style>
      .jumbotron {
        background-color: #e6ffe6;
        text-align: center;
      }
    </style>


## Flexbox
## General
1) Tag your item.  In below example we made it id tag.    ID # ( but could make it class  '.' )
2) css is always no quotes, 
3) word colon word semicolon,   
4) single-words-so-should-dash-connect
5) got lots of mileage in flexbox froggy using 	

_justify-CONTENT_ 
  * flex-start: Items align to the left side of the container.
  * flex-end: Items align to the right side of the container.
  * center: Items align at the center of the container.
  space-between: Items display with equal spacing between them.
  * space-around: Items display with equal spacing around them.

_ALIGN-ITEMS_

  * flex-start: Items align to the top of the container.
  * flex-end: Items align to the bottom of the container.
  * center: Items align at the vertical center of the container.
  * baseline: Items display at the baseline of the container.
    stretch: Items are stretched to fit the container.

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
EXAMPLE;
#pond {
  display: flex;
  justify-content: flex-end; (puts frog all the way right)
  align-items: flex-end; (puts frogs down at the bottom)
}

Align text:
margin: 0, 0, 0, 0
{goes around the 12, 3, 6, 9 sides of a clock}
margin: 0, auto, 0, auto   (will center the text)
margin: 0, auto, 0, 0     (will justify to the right)

#kneepain
I'm learning to affect pain by stretching.  
The six traditional runner's stretches are all reducers of pain. 
If you sit in a weird way in a chair, the stretch that it applies sometimes loosens the wrong thing and is an increaser of pain when walking later.

#100DaysOfCode
Do you have other fun things to do when taking a break?
I have a note on the keybard that says: 'Do flexbox froggy, not surfing/posting on breaks." Thumbs up, @playcodepip 
