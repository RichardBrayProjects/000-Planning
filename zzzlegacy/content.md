Where you are : checking lesson 4 : optional parameters

# LOCAL OAuth 2.0 COURSE

- Title : OAuth2.0 Step-by-step: TypeScript, React, Node.js, Docker
- Course Logo : Top : UI & Server, Bottom - first of 4 adapters - local

- Summary
  GitHub tutorial
  Monorepos tutorial
  Typescript tutorial using deno
  Node.js Express tutorial
  React Tutorial (Builds UI)
  Docker tutorial
  Oauth Application Development

## SECTION 1 Introduction

- Course introduction

  - see GenericResources/IntroductionContents/introduction draft.md for content thoughts

- Course Repo locations **TODO**

## SECTION 2 software setup

- mac software install (need to re-record this to remove AWS CLI and CDK CLI)
- mac configuration
- windows software install (need to re-record this to remove AWS CLI and CDK CLI)
- windows configuration
- vs code extensions
- vs code configuration

## SECTION 3 github essentials tutorial (DONE)

- navigating git commits on github, blame, checking out earlier versions, tags
- creating and merging git branches

## SECTION 4 pnpm and monorepos essentials tutorial (DONE)

- monorepos
- pnpm workspaces introduction
- pnpm workspaces working with packages

## SECTION 5 Typescript essentials tutorial

- see Generic Resources/chatgpt-generated docs/typescript tutorial course

## SECTION 6 node.js / express essentials tutorial

## SECTION 7 React essentials tutorial (includes Vite and React Router)

Process:
Record a complete tutorial to build this "cursor-react-tutorial-simplified-version"
But, before each lesson that introduces some new React technique record breakout lessons in each of the techniques

Then, gather together all the tutorial techniqes and put them into a separate "react essentials" tutorial

AND, release the tutorial on buiding the UI as a separate 
"react project tutorial"

Chatgpt did break the building of the UI down into about 10 stages .. see docs

## SECTION 8 Docker Tutorial

- Docker commands
- Docker desktop
- Docker compose
  - example: DEX and PosgreSQL running together with Docker compose

## SECTION 9 Full Stack Application Tutorial

1.  Demo Node and Client Side cookies demo app

    Gentle start based on repo 105

## SECTION 10 - Local Full Stack OAuth 2.0 Login Service running against DEX

    - Dex running in docker

    - prerequisite A is to build the ChatGPT Typescript version of
        - Generic Resources/chatgpt-generated docs/chatgpt dex&cognito node backend.md
        - This is in turn a merger of the following JavaScript backends in 106
          - client-cookies/backends/cognito-with-pkce
          - client-cookies/backends/dex-no-pkce
          - client-cookies/backends/dex-with-pkce

    - prerequisite B : migrate server above to adapter architecture:
      - add writing a neural adapter layer
      - database adapter : PostgreSQL running under docker (with DEX) in a container

    - Section 11 Lesson : simultaneously:
      - Migrate UI
        - from : client-cookies/frontends/cursor-react-tutorial-simplified-version (UI only, no functionality)
        - to : client-cookies/frontends/cursor-cognito-dex-interoperable

      - Build out prerequisite server in stages
          - the server
          - No PKCE to start - add it as as a second stage
          - demonstrate this running against DEX using the appropriate .env file

          ## SECTION 11 Publish our own NPM package into a GitHub Packages private registry

## SECTION 11 Publish our own NPM package into a GitHub Packages private registry

- create package for neutral adapter
- create package for local adapters

# AWS OAuth 2.0 COURSE UPDATE

## SECTION 12

- AWS Service Overview - quick introduction to main technologies in the course **TODO**
  - Lambda
    - vendia,
    - Lambda Web Adapter,
    - Native Functions one per route (with SAM for local debugging)
  - Cognito - OAuth
  - Cloudfront - Website deployment
  - API Gateway
  - SNS and SQS - Asyncrhonous Messaging
  - RDS - SQL Database
  - DynamoDB - NoSQL Database
  - Interactive Services
    - IAM,
    - Cloudwatch,
    - Cloudformation,
    - Billing and Cost Management

## SECTION 13 AWS online setup (COMPLETE)

- mac AWS software install (aws cli and cdk cli)
- windows AWS software install (aws cli and cdk cli)
- charges
- aws account creation
- aws iam user creation
- aws iam user MFA and passkey
- aws CLI authorization
- aws create budget alerts

## SECTION 14 - AWS OAuth with Cognito

Manually create an AWS Cognito service with Management Console

- demonstrate above system running against Cognito using the appropriate .env file

## SECTION 15 Deploy and Configure AWS Cognito Service with CDK

- CDK bootstrap
- make sure CDK bootstrap removal properties clean up all the buckets and containers when the bootstrap stack is destroyed
- Cognito with CDK
- use a client secret in the secrets manager - see repo 065 for how to use the secrets manager for this

## SECTION 16 Deploy Login Service into AWS (API Gateway and Lambda) with the CDK

- lambda deployment uses _vendia serverless express_
- database adapter : DynamoDB (secrets ?)

## SECTION 17 Deploy Login UI into AWS (Cloudfront) service with CDK

- Cloudfront CDK stack

  - we will be using a known domain, so
  - no ssm parameters with temporary domain are required,
  - therefore no replication from us-east-1 to local eu-west-2 ssm store
  - see repo 064 for deploying into a known domain

## SECTION 18 Publish AWS Adapter NPM package into GitHub Packages private registry

- create package for secrets/dynamoDB database adapters

# AZURE OAuth 2.0 COURSE UPDATE

# GOOGLE OAuth 2.0 COURSE UPDATE

# USER SERVICE COURSE UPDATE (Local / AWS / AZURE / GOOGLE )

## SECTION 19 Update Login Service To Publish User Registrations

- Update Login Service so that it publishes notifications of new users

  - Local Adapter : http messages out
  - AWS/AZURE/GOOGLE : SNS/etc

## SECTION 20 Add a new LOCAL FullStack Service (User Service) Which Handles User Registrations

- LOCAL database adapter : PostgreSQL to store user nicknames
- AWS/AZURE/GOOGLE database adapters : PostgresSQL
- Local Messages In Adapter : http messages in
- AWS/AZURE/GOOGLE Messages In Adapter: SQS/etc

## SECTION 21 Update LOCAL User UI and Server an for Nickname editing

- nickname editor functionality
- no new adapters required

## SECTION 22 Deploy a PostgreSQL Databaser Server into an AWS RDS Service using CDK

- use Secrets Manager to store password : see repo 085 to see how to do this

## SECTION 23 Update User Service for AWS Deployment

- server use _aws lambda web adapter_
- don't bother with container clean-up code - free tier credits will sort it out
- destroying the stack should remove everything (there are probably removal properties that can help with this)

## SECTION 24 Deploy a PostgreSQL Databaser Server into AZURE

## SECTION 25 Update User Service for AZURE Deployment

## SECTION 26 Deploy a PostgreSQL Databaser Server into GOOGLE CLOUID

## SECTION 27 Update User Service for GOOGLE Deployment

# IMAGE SERVICE COURSE UPDATE (Local / AWS / AZURE / GOOGLE )

## SECTION 28 Add a new FullStack Service (Image-Service)

- SQS: receives user registrations and nicknames
- database : RDS to store image metadata
- description : stores/retrieves images
- Remote : _smilga-style one-per-route_
- Local: SAM
- image store : s3 buckets to read/write images

# OTHER COURSE UPDATES

## SECTION 29 UI Microfrontends

```
description: move to module federation 2.0, rspack
ui: shadcn NOT in a library
api gateway permissioning
api gateway call a "lambda authorizer" which will do two things
call cognito to authenticate the token
examine the database to check user groups
```

## SECTION 30 Professional DEVOPS

- new toy project
  - UI: cloudfront-react
  - server: lambda
- aws organizations / identity center
- multple accounts
- hosted zones and certificates
- progressive delivery
  - CI/CD Deployment With Github Actions
    - github actions deployment
    - github pull requests triggering deployment

## SECTION 31 Image-Analysis-Service

```
Tagging model : Use AWS Rekognition
Aesthetics : Use LAION Aesthetic Predictor
database : RDS
image store : same s3 store
events : sns / sqs
ui : (still monolith) enhanced for tags and aesthetics featuers
```

## SECTION 32 PYTHON Image Aesthetics Service

Image Processing / ML Companion API

Audience: Internal.

Purpose: Rate image aesthetics (your ML idea).

Backend: Python service wrapped in Node gateway.

Frontend: Small internal dashboard showing “photo quality scores.”

Teaches:

Integrating Node and Python services.

Using queues or async requests.

Cloud deployment of ML endpoints.

Tech:

1.  Separate Lambda / Function

          Keep your main API gateway and business logic in TypeScript.
          Create a separate Python Lambda for ML inference.
          Your Node Lambda calls it via:
          direct invoke (AWS.Lambda.invoke()), or
          an internal REST/HTTP endpoint if you deploy behind API Gateway or App Service.
          Pros: Easiest deployment, fully serverless.
          Cons: Cold-start time can increase if the model is large.

2.  Containerized Python inference service

          Package the Python model + Flask/FastAPI endpoint in a Docker image.
          Run it on AWS Fargate / Azure Container Apps.
          Your TypeScript Lambdas or front end hit that endpoint for scoring.
          Pros: Faster warm starts, easy GPU use, scalable independently.
          Cons: Slightly more ops overhead than Lambda.

Tech Recommendation: Option 2 — Containerized Python inference service

Here’s why that’s the sweet spot for your use case:

💡 1. Fast startup, stable environment

          Python Lambdas have notoriously slow cold starts, especially with large models (tens to hundreds of MB).
          A container (FastAPI + model loaded in memory) stays warm and ready — much faster responses.

⚙️ 2. Full control over dependencies and model size

          Serverless functions have tight size limits (AWS: ~250 MB uncompressed; Azure: ~500 MB total package).
          ML models (e.g., CLIP, ResNet, aesthetic rating nets) can easily exceed that.
          With a container, you can use whatever libraries and model files you need — no packaging gymnastics.

🧱 3. Easy integration

          Your existing Node Lambda just calls the container’s API endpoint.
          On AWS: host with Fargate (ECS) or App Runner.
          On Azure: host with Container Apps or App Service for Containers.
          No infrastructure headaches — just a URL to call.

📈 4. Scales well as you grow

          If your inference workload grows, containers let you scale horizontally.
          You can later add caching, GPU instances, or batching without changing your API.

💰 5. Reasonable cost and simplicity

          For occasional or moderate traffic, a small container on Fargate/Azure Container Apps costs very little — often cheaper than a managed ML endpoint.
          You avoid the complexity (and cost) of SageMaker or Azure ML.

## SECTION 33 Next.js Companion Application Idea ##1 Admin Dashboard

see document "chatgpt integrating Next.js and React Router projects together as one website.md" on how to do this

Admin Dashboard / Content Moderation Portal
Audience: Staff/moderators, not end users.
Purpose: Review, approve, and manage photos or users.
Tech:

    - React (maybe with Next.js or Vite)
    - shadcn UI for data tables, filters, modals
    - Shared backend data via your Node API client
    - Teaches: Role-based auth, private routes, shared UI + API packages in a monorepo.

## SECTION 34 Next.js Companion Application Idea ##2 Billing Application

Then start a new app in Next.js → this becomes the subscription/membership/billing platform.

Then go back and enhance the original React photo-sharing app
→ so it checks subscription status using the new Next.js backend.

## SECTION 35 Project Idea : Add Video as well as Photos

"Mux" (company similar to Cloudflare) provide 100 hours of storage and 100 hours of download time per month.

✅ Most common real-world companion app.

## SECTION 36 Testing With Jest

## SECTION 37 Health Checks

## SECTION 38 React Server Components project

- shell out to retrieve Unsplash images using its API with React Server Components to handle the api calls for metadata
- limit to - say - 100 images
