# Title AWS full-stack cloud development step by step

AWS full-stack AI cloud development step by step

# SECTION 1 : introduction

- outline contents of course
- setup mac:

Firstly go to

```
brew.sh
```

and follow the instructions for installing homebrew.

Then use homebrew to install whichever packages you don't already have. Here are the commands.

```
  brew install --cask google-chrome
  brew install node
  brew install git
  brew install --cask git-credential-manager
  brew install --cask visual-studio-code
  brew install awscli
```

then in a new terminal (to get the correct PATH)

```
  npm install -g aws-cdk
  git-credential-manager configure
  git config --global user.name "Your Name"
  git config --global user.email "you@example.com"
```

- setup windows

```
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  winget install Google.Chrome
  winget install OpenJS.NodeJS
  winget install Git.Git
  winget install GitHub.GitCredentialManager
  winget install Microsoft.VisualStudioCode
  winget install Amazon.AWSCLI
  winget install pnpm.pnpm
```

then in another terminal

```
  pnpm install -g aws-cdk
```

- create aws dev account & aws configure CLI
- style will be repo-driven

# SECTION 2: (optional) Review initial UI code

# SECTION 3:  get UI logging in and out of Cognito 

- manual Cognito setup
- review cognito UI code

# SECTION 4 : deploy Cognito with CDK 

# SECTION 5: deploy UI to cloudfront 

# SECTION 6:  new API server 

   - here we enhance Cognito CDK to write the Cognito domain and client id into ssm metadata 
   - the API server has a route /cognito-config which returns this data

- no api gateway authentication is involved
- the UI goes to this route and gets the Cognito domain and client ID and no longer gets it from the .env file
- the base url of the api server is held in the .env file so the UI knows where to go: this will change every time the api server is destroyed and deployed with cdk

# SECTION: move cloudfront and api server to registered domain

- using aws registered domain
- using godaddy registered domain
- set up certificates
- update the .env file to contain api.domainname.com as the base url
- this way it will work with and without a registered domain - but if you have a registered domain then no need to regularly update the file

# SECTION:  implement RDS database 

  - CDK
  - flyway

# SECTION:  implement post-confirmation lambda 

# SECTION:  implement user nickname profile page

# SECTION:  private API endpoints cognitio authentication 

  - protect /profile with API gateway Cognito user pool authorizer 

# SECTION:  Cognito groups authorization middleware 

  - management ping !

# SECTION:  image upload 

# SECTION:  cloudfront caching of S3 buckets of images 

Advanced Lessons 

# SECTION:  microservices 

  - independent code 
  - shared code 
  - private packages versioned shared 

# SECTION:  testing and health 

# SECTION:  lambda web adapter and docker 

APPENDIX : review the initial UI code
