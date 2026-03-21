# choice of shell 

There are two options

1.  Switch to the bash shell (see below)

2.  Stick with the zsh shell, but whenever in the course I edit .bash_profile, you should edit .zprofile instead

# If you decide to switch

enter this command to switch from the zsh to the bash shell

```zsh
chsh -s /bin/bash
```

it can be reversed like this

```bash
chsh -s /bin/zsh
```

# Set the prompt

edit your choice of profile file (.bash_profile or .zprofile)

```bash
export PS1="$ "
export BASH_SILENCE_DEPRECATION_WARNING=1
```

(the second export is unnecessary for zsh users)
