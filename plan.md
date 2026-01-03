# Overall
- one route per lambda (as in Smilga AWS Course)
- Cognito code will be raw and not use the open-id client library, see 
      106-web-development-tutorial-with-dex/client-cookies/backends/cognito-with-pkce
      106-web-development-tutorial-with-dex/client-cookies/frontends/cursor-cognito-dex-interoperable
- Authorization will be using client cookies

# Steps

- AWS CLI Account Setup (default) 
- Monorepo setup
- CDK Bootstrap Setup
- Login Service
    - Cognito Configuration with CDK Deployment 
    - /login lambda, deployed using CDK, returns URL of Cognito
    - /authentication lambda
- React Front End
    - login and logout see 106-web-development-tutorial-with-dex/client-cookies/frontends/cursor-cognito-dex-interoperable

- Next.js Front End to replace the front end above
- Add a React Server Component  


    
