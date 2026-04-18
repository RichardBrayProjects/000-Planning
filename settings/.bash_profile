----------------------------

export PS1='$ '
export BASH_SILENCE_DEPRECATION_WARNING=1

alias gitcred='git credential-manager github '
alias gitcred-list='git credential-manager github list'
alias gitcred-logout='git credential-manager github logout `git credential-manager github list`'
eval "$(/opt/homebrew/bin/brew shellenv bash)"

----------------------------


NOTE : 

1. also issue this command to silence the date/time prompt from terminal
   touch ~/.hushlogin

2. change terminal to Basic, clear with font size of 14

---------
