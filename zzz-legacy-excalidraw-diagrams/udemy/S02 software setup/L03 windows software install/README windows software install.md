# Test if you have Chocolatey installed

This command will test whether Chocolatey is installed.

```powershell
choco --version
```

If you see “choco is not recognized as a command”, then it can be installed as follows

# Install Chocolatey

## Get the installation string

- Visit https://chocolatey.org/install

Here you will find the chocolatey installation commands which can be pasted into powershell.

- copy the chocolatey install command

## Paste the installation string into powershell 

- right click on the start button and select "Windows Powershell (Admin)"

- paste the command you copied from the chocolatey webpage into powershell and hit enter

- close powershell

# Install all the packages required using chocolatey

- right click on the start button and select "Windows Powershell (Admin)"

- enter the following commands to install the software packages

```Powershell
Set-ExecutionPolicy RemoteSigned -Scope Process  
choco install vscode git github-desktop awscli pnpm nodejs pgadmin4 docker-desktop flyway.commandline openjdk googlechrome -y --no-progress --limit-output
```

If, for some reason you hit a checksum error this is normally because the Chocolatey checksums are out of date.

You can override this like this (using chrome as an example)

```Powershell
# Install chrome, overriding checksum issue ... 
choco install googlechrome --force -y --no-progress --limit-output --ignore-checksums
```

- close powershell


# Install AWS CDK CLI using npm

This package cannot be installed using chocolatey.

The recommended installation method using npm can be found here : https://docs.aws.amazon.com/cdk/v2/guide/getting-started.html

- right click on the start button and select "Windows Powershell (Admin)"

```Powershell
## set permissions just for this terminal 
Set-ExecutionPolicy RemoteSigned -Scope Process  

npm install -g aws-cdk
```




