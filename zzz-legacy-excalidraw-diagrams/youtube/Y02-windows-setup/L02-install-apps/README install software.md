# Install all the packages required using chocolatey

- right click on the start button and select "Windows Powershell (Admin)"

- enter the following commands to install the software packages

```Powershell
Set-ExecutionPolicy RemoteSigned -Scope Process  
choco install vscode git github-desktop awscli pnpm nodejs pgadmin4 docker-desktop flyway.commandline openjdk googlechrome deno -y --no-progress --limit-output --force
```






