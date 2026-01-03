0. This course is step-by-step

- It is broken into manaageable sections each on its own project
- You are given the full source code at the beginning and end of the project so you won't get lost
- The "hands on" videos cover in detail every action required to develop the software from the starting repo to the ending repo - and how to deploy and run the software many times on the way
- In addition there is a README.md file which lists every action taken and contains all the course code for you to cut and paste to avoid typing
- It is designed for beginners to AWS coding : all that is required is some familiarity with Javascript or Typescript.
- We will be building a very simple user interface using very basic React, Tailwind and ShadCN
- This is not an in-depth course in those technologies but I will outline what is going on and most people will have little difficulty following along.
- You can of course ask ChatGPT or one of the other AI tools to help

1. What sets this course apart is that it mimics real world development inside a real development team

- you will build multiple services which can be deployed fully independently of each other
  - each has its own database and no dependencies on any other service
  - each service consists of a set of lambdas, or a single lambda which handles multiple routes
- vital to be able to debug the system on your local machine and work with your own personal database
  - don't want to always work in the cloud leaving log messages :
  - this course places a big premium on running services locally
  - the UI can pick and choose which services to connect to locally and which from the cloud
  - we also look at how services can use their own local RDS database
- all software deployment is done with software you write - using the CDK function library written specifically for that purpose
- we use real-world SQL databases such as PostgreSQL
  - use Redgate Flyway to handle migration scripts to ensure that on each deployment the database is at the correct schema
  - we show how different services can use different technologies for data storage : some use SQL whilst others use DynamoDB "no sql"

