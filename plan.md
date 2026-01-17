# SECTION 1 : introduction

- outline contents of course
- setup mac:

```
  brew install --cask google-chrome
  brew install node
  brew install git
  brew install --cask git-credential-manager
  brew install --cask visual-studio-code
  brew install awscli
  brew install aws-cdk
  brew install pnpm
  git-credential-manager configure
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

   - Cognito CDK writes ssm metadata 
   - API server /cognito-config

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
