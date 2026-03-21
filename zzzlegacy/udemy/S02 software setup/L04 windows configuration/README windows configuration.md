# setup .bash_profile

- run the gitbash terminal (under git in start->all applications)

```bash
nano ~/.bash_profile
```

- add the line
```bash
export PS1="$ "
```

- save with Control-O (letter O) followed by Enter and Control-X

- close and reopen gitbash terminal

- prompt should now be a single dollar and space

# docker desktop

- run docker desktop 

if this is prompting you to update wsl then 

- run powershell in admin mode

- enter 

```powershell
wsl --update
```

- if that fails then 

```powershell
wsl --install
```

