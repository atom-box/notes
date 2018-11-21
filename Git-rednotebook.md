## Shoot! I deleted a directory!  How to get back just one of its files (2 steps):
git reset  -- scripts/page.elm
git checkout -- scripts/page.elm

## Change the commit message
git commit --amend -m "Hey."
changes message of your last commit

See green notebook for current.
https://stackoverflow.com/questions/2113889/git-difftool-to-give-directory-compare?noredirect=1&lq=1
Commonest Git questions on Stackoverflow

## Show diff of now to before, 
## Doubledash syntax reqd for filename:
git diff 80ac3ad279b2c5  -- README.md 
This worked 11/16/2018.

## undo
git add myfile.txt  then undo with git reset <file>
git reset HEAD *.ext where ext is the files of the given extension you want t
## clear the tree editing 
For all unstaged files use:
git checkout -- .
For a specific file use:
git checkout path/to/file/to/revert
Make sure to include the period at the end.


## Undo!   
https://blog.github.com/2015-06-08-how-to-undo-almost-anything-with-git/ 
has everything!!
## How to revert a Git repository to a previous commit
if you haven't published any of these commits, simply reset, all tree will be lost:
git reset --hard 0d1d7fc32
## Alternatively, if there's work to keep:
git stash
git reset --hard 0d1d7fc32
git stash pop
And the fallout may be merge problems.
## The forgiving way is to patch to the future: this is undoable
With Git, revert has a very specific meaning: create a commit with the reverse patch to cancel it out. This way you don't rewrite any history.  man git-revert has examples!
This will create three separate revert commits:
git revert a867b4af 25eee4ca 0766c053
## It also takes ranges. This will revert the last two commits:
git revert HEAD~2..HEAD
## Similarly, you can revert a range of commits using commit hashes:
git revert a867b4af..0766c053 
## Reverting a merge commit
git revert -m 1 <merge_commit_sha>

## hard, not hard, targeting just certain files
There could be only three categories of files when we make local changes:
    Type 1. Staged Tracked files
    Type 2. Unstaged Tracked files
    Type 3. Unstaged UnTracked files a.k.a UnTracked files
——
What each commands do:
    git checkout . 
- Removes Unstaged Tracked files ONLY [Type 2] {“undo changes in my tree”}
    git clean -f 
- Removes Unstaged UnTracked files ONLY [Type 3]
    git reset --hard 
- Removes Staged Tracked and UnStaged Tracked files ONLY[Type 1, Type 2]
    git stash -u 
- Removes all changes [Type 1, Type 2, Type 3]


Change commit message on something you just committed: 
git commit --amend -m "Restore after accidental deletion."

Shortcuts:
  git checkout -b <new-branch>
Set a key binding.  All of these make 2 letter shortcuts:
  $ git config --global alias.co checkout
  $ git config --global alias.br branch
  $ git config --global alias.ci commit
  $ git config --global alias.st status



## unstage!  learn this
git reset HEAD -- fileone.txt
 
## many enjoy this, see last commit only, clearly: 
git log -1 HEAD


## merge trouble, very basic
error: you cannot push, there are unchanged things there.
Wrong move: trying to fetch then merge caused 'not something we can merge'
This worked: git pull mke master

## DIFF
DIRDIFF causes a tree of the directories to open
git difftool --dir-diff 3fb4c7436894b4f18f728
git difftool 3fb4c7436894b4f18f728
git diff        3fb4c7436894b4f18f728   baef8d19c52ae3b241

## Stash
git stash
git stash apply
git merge OR 
	git diff

## Journey to the past, Eaxy way
git checkout 498285OLD
git status —graph
git checkout master (comes back to present

## Journey to the past, stranger way
git checkout 498285OLD
git branch setAMarker HEAD ISNT POINTING TO IT, UH OH
git checkout setaMarker.  NOW HEAD IS POINTING TO THAT


## My usual lost, and a 23rd Psalm to show the way 
git merge dev
CONFLICT - FIX CONFLICT AND COMMIT THE RESULTS
** git status
YOU HAVE UNMERGED PATHS .  okay still to bail at this point
 
## two things  can happen when you try to merge
1 if there is a direct path, a fast-forward would happen automatically
2 else you could be on the tips of the V.  You can’t go from one V tip to the other with fastrforward.   So, a merge is needed 
3 !! you have a given line that got changed by both people 
REMEMBER, TO GIT, A FILE DOESN’T EXIST UNTIL YOU COMMIT IT.  
YOU ARE SAVING FILES AND ACTING LIKE THEY CAN BE MERGED. THEY CANT!

## deleting a branch 
git branch -d evanbranch 

## Dot Dot notation
git diff master..myBranch 

## head, 
HEAD just tells you what branch you are on, it doesn’t say which commit

## Speak correctly
1 Your files you can see - WORKING TREE 
2 The staging area - THE INDEX
3 The commits

## NUT TO CRACK
Once you understand this, much control will be bestowed on you:
 ___  git log
commit 4fc291a81f1cf269d71254148cb18875aa57ac36 (HEAD -> scared, one/master, master)

## TWO.   NEW.   COMMANDS
 git show master@{yesterday}
 git reflog

## My mistake!  Learn this syntax!!
DON'T REFER TO THE REMOTE AS 
git pull origin/munising WRONG!
git pull origin munising  RIGHT!


## Nice tip REFLOG

git reflog IS BETTER THAN LOG

## Digital Ocean TWO MERGE TIPS
Abort the merge, in case there are conflicts.

    git merge --abort

You can also select a particular commit to merge with cherry-pick with the string that references the specific commit.

    git cherry-pick f7649d0


## Digital Ocean fetch, then, merge
Collaborate and Update

To download changes from another repository, such as the remote upstream, you’ll use fetch.
    git fetch upstream

Merge the fetched commits.  BRANCH SPECIFYING SYNTAX
    git merge upstream/master

Push or transmit your local branch commits to the remote repository branch.
    git push origin master

Fetch and merge any commits from the tracking remote branch.
    git pull



## Digital Ocean DIFF
git diff command shows changes between commits, branches, and more. You can read more fully about it through the Git documentation.

Compare modified files that are on the staging area.
    git diff --staged

Display the diff of what is in a-branch but is not in b-branch.
    git diff a-branch..b-branch

Show the diff between two specific commits.
    git diff 61ce3e6..e221d9c



## SSH PATHS, ADDRESSES
 With SSH URLs, relative paths start from your home directory, and it doesn't understand shell shortcuts like ~. So do:
git remote add origin ssh://user@example.com/git/example.com

if you want to use absolute paths, like /home/mario/git/example.com, use an extra leading slash:
git remote add origin ssh://user@example.com//home/mario/git/example.com


## remotes explained in Merge message
"You asked to pull from the remote 'one', but did not specify
a branch. 
Because this is not the default configured remote
for your current branch, you must specify a branch on the command line.""
HOW TO SPECIFY THE REMOTE URL:

The correct syntax for REMOTEREPO + BRANCH is to JUST LEAVE A SPACE:
git push catserver newfeature


git@skarp.beanstalkapp.com:/gittest.git
i.e. in the URL you're using, you missed out the : (colon)

To update the URL for origin you could do:
git remote set-url origin git@skarp.beanstalkapp.com:/gittest.git



## Julia Evans Awk example
history | awk '$2 == "git" {print $1 " " $3}' > history.txt 

## Merge reflection from 1&1 at Starbucks:
.git/MERGE_HEAD
is the nascent merge 'project'
The sequence of a GIT MERGE is
1) Do your editing, via git merge git mergetool
2) TWO WORD COMMAND NOW: git commit
3) Allow it a LONG form commit message, partly so you can trace it, partly for the helpful messages.   Some of your message is just uncommenting.


Twit
Learn to keep two idea queue, without writing down.
Learn to always ensconce emerging idea to secondary slot in that queue.



## Notes from Kyle Welch talk at CreamCityCode (works at EventBrite) Oct 13, 2018
1111
git merge --squash
INSTEAD OF JUST MERGING, THIS MAKES THE ROAD LOOKING BKWDS A STRAIGHT, SINGLE ROAD
22222
IF YOUR MASTER HAS GONE AHEAD, AFTER YOU FORKED YOUR FEATURE PROJECT:
rebase!
gotta bring
check out JuliaEvans' sketches of Git and how the hashes numbers add up to the tree and branches.  It's a linked list.  That's all, nodes on a linked list.

THE FOLLOWING STYLE IS CALLED Git Flow
featureBranch
development      o----o--o       o---o
                 /         \     /     \
release        o-----------o---o-------o----o
              /                              \
master       o---------------o-----o----o-----o------->



ohshitgit.com WEBSITE 


"""""""""""""""""""
OH NO:
Your branch is ahead of 'origin/master' by 7 commits.
All conflicts fixed but you are still merging.
SOLVED IT:
	git add -A 
	git commit -m "Finish merge"
"""""""""""""""""""
Let’s say that you wanted to commit six files but, by mistake, you end up committing only five files. You may think that you can create a new commit and add the 6th file to that commit.

There is nothing wrong with this approach. But, to maintain a neat commit history, wouldn’t it be nicer if you could actually somehow add this file to your previous commit itself? This can be done through git commit --amend as well:

git add file6
git commit --amend --no-edit

--no-edit means that the commit message does not change.
....
Let’s say that you have committed a bunch of files and realised that the commit message you entered is actually not clear. Now you want to change the commit message. In order to do this you can use git commit --amend

git commit --amend -m “New commit message”

/  /  /  /  /  /  /  /  
git reset --hard origin/branch_to_overwrite
(1)USE THIS IF GIT PULL IS RELUCTANT TO OVERWRITE YOUR LOCAL STUFF
--OR THIS (2)--
git checkout master
git branch new-branch-to-save-current-commits
git fetch --all
git reset --hard origin/master
 It's worth noting that it is possible to maintain current local commits by creating a branch from master before resetting PER THE ABOVE FOURLINE SEQUENCE.
(3) OR THIS
Uncommitted changes, however (even staged), will be lost. Make sure to stash and commit anything you need. For that you can run the following:

git stash

And then to reapply these uncommitted changes:

git stash pop
/  /  /  /  /  /  /  /  

git log --graph --all
SAVED ME: SHOWED ME MY FUTURE VERSIONS THAT I THOUGHT I LOST DURING RESET!

git log --decorate 
WRITES HEAD, 

git log --oneline

git log --patch 
EXHAUSTIVELY SHOWS DIFFS LINE BY LINE


WHAT IS HEAD 78
1 - both head and master are pointers
2 - HEAD is you-are-here-now
3 - MASTER is the bread crumb showing you back where the main trailhead was, so you can get back to it.  You can diff them.
4 - git reset HEAD --hard  [THIS HAS IS REPEATEDLY ROLLING ME BACK TO s.m.a.]

MERGE DIFF RESET 79
git merge branchname
	DONT git branch -d branchname // ATTENZIONE, THIS NUKES THE ENTIRE BRANCH
git diff -HEAD // shows differenes since the last commit
git diff -staged
git diff zombie master  // works

HOW TO STEP THROUGH A BIT OF A TIME MACHINE, HOLISTIC
git checkout somebranch

PRETTY       DECORATE 126
git log --pretty     // one line.
git log --decorate   // shows head, MASTER 

AMEND A STAGE BUT NOT A COMMIT 126
git commit --amend edits a staged part

Did you forget part of the stage?
1 - git commit -m "foo"
2 - git add forgottenfile.txt
3 - git commit --amend  // re-wrap it all up

UNSTAGE 127  
git reset filename.txt just unstages that file

REWRITE YOUR LAST COMMIT MESSAGE

PUSHING A BRANCH 149    
why your branch doesn't appear at the remote.  Duh,
don't push master, push your 2ndbranch

Solve a difficult merge!
git merge origin use-ts-bot --allow-unrelated-histories
