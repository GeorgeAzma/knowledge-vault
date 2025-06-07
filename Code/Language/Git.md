### Stage / Commit / Push
``` bash
git add .
git commit -m "initial commit"
git commit --amend # edit last commit
git commit --no-edit # amend without changing msg
git push # --force to overwrite remote
```
### Branch
``` bash
git branch new-branch # add new-branch
git checkout new-branch # goto new-branch, -b to try_create
git branch -m main # rename cur to "main", -M to force
git branch -d main # delete main, -D to force
git push -u origin <branch> # link local/remote <branch>
git branch -r # list
```
### Remote
``` bash
git remove -v # show remote URLs
git remote add origin <url> # link remote repo
git remote set-url origin <url> # change remote url
git remote rm <name> # rm remote
git fetch --prune # rm deleted remote branches
```
### GitHub CLI
``` bash
gh repo create <repo_name> --public
# Options:
--source . # create from ./
--clone # clone to ./<repo_name>
```
### Tag
``` bash
# v1.0 points to cur commit
git tag v1.0.0 # major.minor.patch
git tag -a <name> -m "msg" # annonated tag with msg
git push origin <tag>
git push --tags # push all tags
git tag -d v1.0 # delete tag (local)
git push --delete origin v1.0 # delete tag (remotely)
git checkout v1.0 # goto tag
```
### Delete Commit History
``` bash
# TLDR: creat orphan branch, commit everything to it
# delete main, rename orphan to main, force push
git checkout --orphan new-branch
git add .
git commit -m "initial commit"
git branch -D main # delete main
git branch -m main # rename new-branch to main
git push --force
```