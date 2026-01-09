# Overall

## Services

NO LOCAL RESOURCES : use RDS and S3 only

- System
  RDS

- User, combines
  - cognito-cdk
    104-safe-copy-of-first-fully-working-version/services/system-cdk/src/bin/cognito.ts
  - login
    106-web-development-tutorial-with-dex/client-cookies/backends/cognito-with-pkce
  - user services
    104-safe-copy-of-first-fully-working-version/services/user

# Steps

- User Service (contains all cognito CDK code)
  - deploy Cognito using CDK
  - deploy lambda node/express services with api gateway = certficate = primary domain
  - add cognito login from 106-web-development-tutorial-with-dex/client-cookies/backends/cognito-with-pkce
  - deploy RDS database (see 104-safe-copy-of-first-fully-working-version/services/system-cdk)
  - add postConfirmation trigger (see 104-safe-copy-of-first-fully-working-version/services/system-cdk/src/lambdas)
- cloufront version of 106-web-development-tutorial-with-dex/client-cookies/frontends/cursor-cognito-dex-interoperable
