# Title : AWS web development from beginner to expert step by step

# SECTION 1 : introduction

- outline contents of course
- setup mac
- setup windows
- aws account setup
- setup database tools (mac + windows in rdp)

# SECTION 2: Initial UI Application : Vite, React, Tailwind, Shadcn UI

- mock login/logout UI

# SECTION 3: AWS Cognito

- manual Cognito setup
- Cognito domain and client id are manually pasted into the UI
- enhance UI so it does full Cognito Authentication
  - lesson on HTTP: naviagation calls, API calls and redirects
  - OAuth 2.1 / Cognito UI code - how OAuth/Cognito works
- Cognito domain and client id held in .env file

# SECTION 4 : CDK deployment

- Cognito CDK deployment
- must include synth and deploy phases
- must include explanation of when you cannot use Javascript variables to pass data between stacks
- Cognito domain and client id are saved into SSM parameters
- a custom typescript application runs after deploying Cognito
  - reads the SSM parameters
  - overwrites them in .env file
  - see https://chatgpt.com/c/69ab3984-6300-8385-a2f0-55180cdc9417 or search ChatGpt history for Cognito client ID access

# SECTION 5: AWS Cloudfront

- UI CDK deployment
- registered domain
  - aws registered domain
  - godaddy registered domain
- set up certificates
- use www subdomain of the registered domain

# SECTION 6: AWS RDS Aurora serverless PostgreSQL Database

  - CDK deployment
  - flyway migrations

# SECTION 7: AWS Cognito post-registration Lambda trigger

- adds user to RDS Database

# SECTION 8:  Local Running Node/Express API server

- UI upgraded to save/load user nickname via api server
- Local running express api server
  - talks to cloud RDS using aws configure permissions
  - development and debuggihg
- .env file points to location of local server
  - VITE_API_SERVER_LOCATION='local'
  - VITE_API_SERVER_LOCAL='http://localhost:3001'

# SECTION 9: API Server deployed to AWS Lambda

- deployment of user API server in section above using CDK deployment
- .env file points to location of local server
  - VITE_API_SERVER_LOCATION='remote'
  - VITE_API_SERVER_REMOTE='https://api.uptickart.com'

# SECTION 10: AWS S3 Bucket Photo sharing

- Image Upload to S3 bucket
- Search and display images directly from S3 bucket
- AWS Cloudfront caching S3 image bucket

# ------------ Publish ----------------

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
