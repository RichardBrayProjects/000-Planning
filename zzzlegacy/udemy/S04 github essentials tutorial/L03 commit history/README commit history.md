# Jump from VS Code straight to github.com

- Open your repo folder in VS Code
- Go to the source control graph (where we finished up in lesson 2)

- in source control graph panel see the 3 commits
- HOVER over the "main" tag in the top commit (its blue in my version)
- up will jump a popup dialog containing an "Open in Github" link - follow it and the github website will display the commit

# take a look at the tags

- click on "<> Code" menu at the top of the webpage

- in the code screen in between the Main branch dropdown and the green Code dropdown is "1 Tag" ... click on it

Notice here is the opportunity to download the complete source code for the repo at that point in the commit history

Whilst github doesn't allow you to clone a repo at any commit point, this is the closest you can get !

# Viewing commit history

- click on "<> Code" menu at the top of the webpage

- click on "3 commits" (can be found under the green "Code" button)

- select the "xxxxxx" SHA code on the far right of the "bug fixed" commit line (just before the copy and <> symbols) -

this is the "view commit details" button and will show you the files which were changed in that commit

- click on the cog/settings icon on the right just above the code ... experiment with the split versus unified views

You can now view this file when as it was at this commit point.

# Find out who is responsible for a line of code ...

- click on "<> Code" menu at the top of the webpage

- select the "liftoff.js" file

Lets say you want to know who was responsible for line 6 ... where the counter is going down

- click on "Blame"

You will see that its showing this code

```
for (let i = start; i >= 1; i--) {
```

under the wrong commit ... its showing it against the commit called "functional" because of the wholesale move of this code

HOWEVER, if you

- click on the small icon - two vertical bars then a square (hovering over it reveals "blame prior to change")

Then it will take you to the change where that bug was fixed at line 4.

# Checking out earlier versions in Visual Studio Code

Lets say you want to checkout the "bug fixed" version of the code in VS code ... not to edit or change, just to look at and browse around.

This is how you do it

- return to VS code

## Change Auto to All in the graph panel (this is what references are shown in the commit history - you want everything !)

- go to the source control panel, graph section

- at the top of the commit history is a small button with "Auto" written on it (at my time of writing)

- click on "Auto" and in the dialog which appears at the top of the screen change it to "ALL"

- right click on the "bug fixed" commit
- select Create branch ...
- create a branch called AFTER

- right click on the "buggy version" commit
- select Create branch ...
- create a branch called BEFORE

- now at the bottom of the screen in the status bar you will see "BEFORE" .. this is the branch you are currently viewing

You can toggle between the BEFORE, AFTER and main branches using this status bar button

## Once you have finished browsing at the branches delete them like this :

- select the main branch using the Button in the status bar and selecting "main" (not main/origin) in the dialog box which appears
- in the commit history list, you should see BEFORE and AFTER branch names against the bottom two commits
- right click on BEFORE and select "Delete Branch"->BEFORE
- right click on AFTER and select "Delete Branch"->AFTER

the branches are now gone !
