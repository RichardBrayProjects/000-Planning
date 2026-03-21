This lesson follows on immediately from lesson 03 and uses the same repo.

- Open VS code and open the liftoff repo

- open the source code explorer

- select the most recent commit (titled "functional")
- right click and select Create Branch ...
- call the branch experimental
- press the "Publish Branch" button

# First commit on the experimental branch

- open liftoff.js

- change the code to this

```
// Countdown program (experimental version)
// Adds a timed countdown effect

function countdown(start = 10, delay = 500) {
  console.log("Starting countdown...");

  let i = start;
  let timer = setInterval(() => {
    console.log(i);
    if (i-- <= 1) {
      clearInterval(timer);
      console.log("🚀 Liftoff!");
    }
  }, delay);
}

countdown(10, 300);
```

- commit and sync with the message "timer"

# Second commit on the experimental branch

- open liftoff.js

- change the code to this

```
// Countdown program (async attempt)
// Tries to use async/await with setInterval — but doesn't behave as expected

async function countdown(start = 5, delay = 500) {
  console.log("Starting countdown...");

  for (let i = start; i >= 1; i--) {
    console.log(i);
    await setInterval(() => {}, delay); // ❌ setInterval doesn't return a Promise!
  }

  console.log("🚀 Liftoff!");
}

countdown();
```

- commit and sync with the message "async with bugs"

# Third commit on the experimental branch

- open liftoff.js

- change the code to this

```
// Countdown program (working async/await version)

function wait(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function countdown(start = 5, delay = 500) {
  console.log("Starting countdown...");

  for (let i = start; i >= 1; i--) {
    console.log(i);
    await wait(delay); // ✅ waits properly between numbers
  }

  console.log("🚀 Liftoff!");
}

countdown();
```

- commit and sync with the message "async fixed"

# View both branches on github.com

- in the "Graph" panel you should now see 6 commits.
- Double check that the tiny icon in the top of the panel says "all" and not "auto"
- Hover over the "experimental" branch label, and click on the "Open on GitHub" link in the dialog which floats up
- in the github.com website click on "<> Code" in the menu bar
- the branch selector dropdown from "experimental" to "main" and click on "3 commits"
- now switch the branch selector dropdown from "main" to "experimental"

Note that the "experimental" branch does NOT show 3 commits ... it shows 6.

This is because the full lineage of this branch is indeed all 6 commits.

# Merge the experimental branch back into the main branch

- Return to VS Code
- in the status bar at the bottom click on "experimental" and in the dialog that appears select the main branch (NOT origin/main)
- open the command palette (View Command Palette)
- search for git merge and select "Git: Merge..."
- choose experimental (NOT origin/experiemental)
- press the "Sync changes" button in source control
- revist github.com - hover over the "main" tag in the Graph panel and follow the "Open on GitHub" link

You will now see that both branches have 6 commits

The merge was a success !
