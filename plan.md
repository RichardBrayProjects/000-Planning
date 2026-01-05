# Overall

- no devops, no sso

- start with these and build out from there ...
    106-web-development-tutorial-with-dex/client-cookies/backends/cognito-with-pkce
    106-web-development-tutorial-with-dex/client-cookies/frontends/cursor-cognito-dex-interoperable

- Local vs Remote running
    use adapters
    local will use Cognito=Dex, RDS=PostgreSQL, S3=Min.io


# Steps

- Monorepo setup based on
    repo stucture: 103-first-fully-working-version
    backend code: 106-web-development-tutorial-with-dex/client-cookies/backends/cognito-with-pkce
    frontend code: 106-web-development-tutorial-with-dex/client-cookies/frontends/cursor-cognito-dex-interoperable
- get local working first against DEX
- get remote working against COGNITO
    - AWS CLI Account Setup (default) 
    - CDK Bootstrap Setup
    - deploy Cognito using CDK
    - remote single service
        - api gateway = certficate = primary domain
        - Node/Express single service
            /public/login
            /public/autenticated
            /api/user/getUserInfo
            /api/user/setUserInfo
            /api/image/upload
            /api/image/gallery
            
- cloufront version of Front End
    


    
