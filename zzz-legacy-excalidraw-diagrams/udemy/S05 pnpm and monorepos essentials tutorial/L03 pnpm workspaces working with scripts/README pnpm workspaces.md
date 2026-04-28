# Create new repo

- goto github.com
- sign in
- Create a New Repository
  - Name = steps
- use link on the github.com webpage to jump to Github desktop
- clone to your hard drive
- use link in GitHub Desktop to jump to VS Code

# Initialize pnpm

- open terminal
- enter this command

```bash
pnpm init
```

- edit package.json and replace entire contents with this

```json
{
  "name": "root",
  "version": "1.0.0",
  "scripts": {
    "msg": "echo hello world"
  }
}
```

# run some pnpm commands in the root

This is pnpm "shorthand" for running scripts

Its fine provided your script name doesn't

```bash
pnpm msg
```

This is safer as it avoids clash with a development tools you may install into projects later eg. vite, eslint

```bash
pnpm run msg
```

silent option

```bash
pnpm run --silent msg
```

# how to create a bash shell alias to shorten commands

I use this alias all the time and will do throughout this course

- edit ~/.bash_profile
- add this line to the end of the file

```bash
alias prun="pnpm --silent run"
```

- rerun .bash_profile in your current terminal with this command

```bash
source ~/.bash_profile
```

- now use the alias ... enter the command

```bash
prun msg
```

# working with folders

## ui/app1 folder

- create the folders "ui" and "ui/app1"
- create a file in ui/app1 called package.json containing this

```json
{
  "name": "@ui/app1",
  "version": "1.0.0",
  "scripts": {
    "touch": "touch app1.txt",
    "delete": "rm app1.txt"
  }
}
```

## ui/app2 folder

- create the folder "ui/app1"
- create a file in ui/app2 called package.json containing this

```json
{
  "name": "@ui/app2",
  "version": "1.0.0",
  "scripts": {
    "touch": "touch app2.txt",
    "delete": "rm app2.txt"
  }
}
```

## create a workspace file

- create pnpm-workspace.yaml
- add this content into pnpm-workspace.yaml

```yaml
packages:
  - ui/*
```

## running a script command in a single folder at a time

- run this pnpm command to create app1.txt

```bash
prun -F @ui/app1 touch
```

- use the alias to delete app1.txt

```bash
prun -F @ui/app1 delete
```

## running a script command in all folders

- run this pnpm command to create app1.txt AND app2.txt

```bash
pnpm run -r touch
```

- use the alias to delete both

```bash
prun -r delete
```

## save time with root script commands

- edit ./package.json and replace the contents with this

```json
{
  "name": "root",
  "version": "1.0.0",
  "scripts": {
    "msg": "echo hello world",
    "touch-app1": "pnpm -F @ui/app1 run touch",
    "delete-app1": "pnpm -F @ui/app1 run delete",
    "touch-all": "pnpm -r touch",
    "delete-all": "pnpm -r delete"
  }
}
```

now run the following commands in turn

```bash
prun touch-app1
prun delete-app1
prun touch-all
prun delete-all
```
