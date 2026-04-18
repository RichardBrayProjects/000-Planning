# Order

(By deferring aurora to the end we SAVE MONEY)

1 Introduction
2 Express local server
3 Express as lambda API server
4 Deploy UI to CloudFront
5 Connect UI to API (Vite & CloudFront)
6 S3 Bucket Photo sharing
7 Local Postgress db in Docker
8 Connect UI to local db (filter images)
9 Aurora Postgress db
10 Connect API server to db

# SECTION 1 : introduction

- introduction
- course repositories
- setup mac (chrome, node, git, vs code, aws cli, cdk cli)
- setup windows (chrome, node, git, vs code, aws cli, cdk cli)
- visual studio configuration
- aws account setup

# SECTION 2: Node/Express API server

- Objective: a local running express api server with one API points :
  /health which returns "ok"

# SECTION 3: API Server deployed to AWS Lambda

- Objective: deploy the API server as a lambda
- test with postman / something else

# SECTION 4: Deploy UI using AWS Cloudfront

- Objective: Deploy the UI To Cloudfront using the CDK
- First deploy manually, then CDK deployment
- registered domain
  - aws registered domain
  - godaddy registered domain
- set up certificates
- use www subdomain of the registered domain

# SECTION 5: Connect UI to API (Vite & CloudFront)

- Objective: each login is registered, user profile page displays last 5 logins

# SECTION 6: S3 Bucket Photo sharing

- Image Upload to S3 bucket
- Search and display images directly from S3 bucket
- AWS Cloudfront caching S3 image bucket

# SECTION 7 Local Postgress db in Docker

  - flyway migrations

# SECTION 8 Connect UI to local db (filter images)

# SECTION 9 Aurora Postgress db

  - CDK deployment

# SECTION 10 Connect API server to db

# ------------ Publish ----------------

# SECTION xx: AWS Cognito

- manual Cognito setup
- Cognito domain and client id are manually pasted into the UI
- enhance UI so it does full Cognito Authentication
  - lesson on HTTP: naviagation calls, API calls and redirects
  - OAuth 2.1 / Cognito UI code - how OAuth/Cognito works
- Cognito domain and client id held in .env file

# SECTION xx: CDK deployment

- Cognito CDK deployment
- must include synth and deploy phases
- must include explanation of when you cannot use Javascript variables to pass data between stacks
- Cognito domain and client id are saved into SSM parameters
- a custom typescript application runs after deploying Cognito
  - reads the SSM parameters
  - overwrites them in .env file
  - see https://chatgpt.com/c/69ab3984-6300-8385-a2f0-55180cdc9417 or search ChatGpt history for Cognito client ID access

# SECTION xx: AWS Cognito post-registration Lambda trigger

# SECTION xx: AWS API Gateway Security

- AWS API Gateway Cognito Authorizer API Server — Tiered Security
- public, authenticated, group-access
- group-access to "administrator" group provides a new UI to list all users

# SECTION xx: Automatic Tagging With AI AWS Rekognition and OpenAI

- AWS Rekognition returns structured labels with confidence, e.g.:
  - Lighthouse (98), Ocean (96), Sunset (91), Waves (89), Rock (87), Sky (86)
- OpenAI generates description
  - A lighthouse stands on a rocky coast as waves crash under a vivid sunset.

# SECTION xx: Automatic Image Beauty With AI Sagemaker Model

- SageMaker beauty rating
- This is an external model hosted by me

# SECTION xx:  microservices 

- split user/tagging/beauty into separate services
- use AWS SNS/SQL messaging database updates
- separate PosgreSQL"schemas" (within the same actual database to keep costs down)
    - independent code 
    - shared code 
    - private packages versioned shared 

# SECTION xx : micro front ends

- ideally vite with MF2.0

# SECTION xx:  testing

# SECTION xx:  health 

# SECTION xx:  lambda web adapter and docker 

# SECTION "Progressive" Delivery with Multiple Accounts

- multi-environment deployment

# SECTION xx CI/CD with GitHub Actions

- include pull requests

# SECTION ?? : Next.Js with React Server Components running in Lambdas

# ------------ Maybe ----------------

# SECTION ??: Advanced Cognito

- New Application : User Account Management with user deletion
  - Cognito User Deletion
  - extends the administrator features to deletion : has to delete _all_ traces of user data
