# SECTION 1 : introduction

- introduction
- course repositories
- setup mac (chrome, node, git, vs code, aws cli, cdk cli)
- setup windows (chrome, node, git, vs code, aws cli, cdk cli)
- visual studio configuration
- aws account setup

# SECTION 2: AWS Cloudfront

- Objective: Deploy the UI To Cloudfront using the CDK
- First deploy manually, then CDK deployment
- registered domain
  - aws registered domain
  - godaddy registered domain
- set up certificates
- use www subdomain of the registered domain

# SECTION 3: Local Running Node/Express API server

- UI upgraded to save/load user nickname via api server
- Local running express api server
  - talks to cloud RDS using aws configure permissions
  - development and debuggihg
- .env file points to location of local server
  - VITE_API_SERVER_LOCATION='local'
  - VITE_API_SERVER_LOCAL='http://localhost:3001'
