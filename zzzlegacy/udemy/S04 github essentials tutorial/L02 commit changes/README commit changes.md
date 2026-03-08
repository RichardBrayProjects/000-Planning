# Github.com login

- go to github.com
- if you don't already have an account click on SignUp
  -sign in

# Account settings

Account settings are in a different place.

- scroll back to the top and click on the "Account" icon on the top right (funny shape)
- select Settings

## Authentication and security

- go to password and authentication, where you can:
  - create a passkey
  - setup two-factor authentication with an authenticator app
  - view and save your recovery codes somewhere

# Create repo

- scroll back to the top and click on the "Account" icon on the top right (funny shape)
- select Repositories

- press + button at the top and select New Repository

  - name = liftoff
  - visibility = you can make this public or private here

- press Create Repository

- click on "set up in Desktop" button to take you to GitHub Desktop application

- clone the repository onto your hard drive by selecting a folder and pressing Clone

- press button Open in VS Code

# Commit changes in VS Code

## Create and commit first buggy version of the code

- create a new file liftoff.js

```js
// Countdown program (buggy version)
console.log('Starting countdown...');

for (let i = 1; i <= 10; i++) {
  // BUG: counts up, not down!
  console.log(i);
}

console.log('Liftoff!');
```

- go to source control and commit the change
  - commit message = buggy version
  - press commit and sync

## second working version of the code

- edit the file so it works

```js
// Countdown program (bug fixed)
console.log('Starting countdown...');

for (let i = 10; i >= 1; i--) {
  console.log(i);
}

console.log('Liftoff!');
```

- go to source control and commit the change
  - commit message = bug fixed
  - press commit and sync

## third version liftoff function

```js
// Countdown program (final version)
// Counts down smoothly with a delay

function countdown(start = 10) {
  console.log('Starting countdown...');
  for (let i = start; i >= 1; i--) {
    console.log(i);
  }
  console.log('🚀 Liftoff!');
}

countdown();
```

- go to source control and commit the change
  - commit message = functional
  - press commit and sync

# Source Control Graph

- in source control graph panel see the 3 commits
- click on them and see the changes

# Tagging

## Tag the second working version (assumes you have the "Git Graph" VS code extension installed)

- in source control graph panel select the second commit titled "bug fixed"
- right click on the item and select Create Tag ...
- at the top enter a tag WORKING VERSION
- you may be then prompted to enter a description ... enter "all working now"

## push the tags up to the github website

Notice at this point that there is no option to push these changes up to github

At the time of writing you cannot push the tags to github natively in VS Code.

This will presumably be sorted out at some point ... but for now we are going to use Git Graph.

If this extension is enabled you should see "Git Graph" in the status bar

- click on GitGraph in the status bar
- you should see the commit history
- right click on the "WORKING VERSION" tag and select Push Tag ...
- are you sure ? press yes
