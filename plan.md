# Title : develop a real-world aws application from zero, step-by-step

# SECTION 1 : introduction

- outline contents of course
- setup mac
- setup windows
- aws account setup
- setup database tools (mac + windows in rdp)

# SECTION 2: React Tailwind Shadcn UI

- introduction (to do : remove git clone & vite dev)
- shadcn scaffolding
- vite explained

# SECTION 3: AWS Cognito UI Authentication

- manual Cognito setup
- UI running under Vite
- lesson on HTTP: naviagation calls, API calls and redirects
- OAuth 2.1 / Cognito UI code - how OAuth/Cognito works
- show UI logging in and out of Cognito 

# SECTION 4 : AWS Cognito CDK deployment

- must include synth and deploy phases
- must include explanation of when you cannot use Javascript variables to pass data between stacks

# SECTION 5: AWS Cloudfront UI CDK deployment

- registered domain
  - aws registered domain
  - godaddy registered domain
- set up certificates
- use www subdomain of the registered domain

# SECTION 6:  Local Node/Express API server

- here we enhance Cognito CDK to write the Cognito domain and client id into ssm metadata 
- the API server has a route /cognito-config which returns this data
- the UI goes to this route and gets the Cognito domain and client ID and no longer gets it from the .env file
- no api gateway authentication is involved
- base url of api server is held in the .env file so the UI knows where to go: changes when api server is destroyed & redeployed with cdk

# SECTION 7: AWS Lambda API server CDK deployment

- use api subdomain of the registered domain

# SECTION 8: AWS RDS Aurora serverless PostgreSQL Database CDK Deployment

  - CDK
  - flyway migrations

# SECTION 9: AWS Cognito post-registration Lambda adds user to RDS Database

# SECTION 10: Profile Page user-nickname editor (AWS RDS storage)

# SECTION 11: Image Upload to S3 bucket

# SECTION 12: Search and display images directly from S3 bucket

---------------- PUBLISH ----------------

# SECTION 13: AWS Cloudfront caching S3 image bucket

# SECTION 14: AWS API Gateway Cognito Authorizer API Server — Tiered Security

    - public, authenticated, group-access
    - group-access to "administrator" group provides a new UI to list all users

# SECTION 15: Cognito Delete User

- extends the administrator features to deletion : has to delete _all_ traces of user data

# SECTION xx:  microservices 

  - independent code 
  - shared code 
  - private packages versioned shared 

# SECTION xx : micro front ends

# SECTION xx : Next.Js with React Server Components running in Lambdas

# SECTION xx:  testing and health 

# SECTION xx:  lambda web adapter and docker 
