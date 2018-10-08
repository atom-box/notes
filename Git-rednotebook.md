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
