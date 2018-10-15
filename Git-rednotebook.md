## Julia Evans Awk example
history | awk '$2 == "git" {print $1 " " $3}' > history.txt 

## Merge reflection from 1&1 at Starbucks:
.git/MERGE_HEAD
is the nascent merge 'project'
The sequence of a GIT MERGE is
1) Do your editing, via git merge git mergetool
2) TWO WORD COMMAND NOW: git commit
3) Allow it a LONG form commit message, partly so you can trace it, partly for the helpful messages.   Some of your message is just uncommenting.
@kyle welch
Your talk nicely @CreamCityCode nicely bridged a range of Git-ability-levels in the audience.  I am benefitting this morning by making better commit messages. 
Good job dealing with no Wifi in the room.
That Julia Evans #Git visualizer you recommended is very cool!  
Bad news:
Instead of ftp, I am updating my web page via LocalCommit -> GitHubRemote -> PullToHostingServer.  This is 3x more steps and is causing many merge/conflicts.
Good news: 
Forced to get better at Git and Vim-mergetool. And low-stakes: my static fun page. 



## Kyle Welch talk at CreamCityCode (works at EventBrite) Oct 13, 2018
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
