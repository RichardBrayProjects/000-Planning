# Introduction

If you are relatively new to AWS it can be quite confusing and even overwhelming as there are a large number of technologies and techniques to learn and a huge number of AWS services - currently over 240 and growing rapidly

The good news is that of those 240 services there are a dozen or so core services which are the bedrock

I have worked in a company who have built an enormous system on AWS built up over years.

That company was able to grow their software fast by building it out of independently deployed backend application services which could be described as microservices - although it's important to state that that most of them were substantial pieces of software consisting of thousands of lines of code.

They also made an excellent decision early on to build their UI out of large independently deployed modules. Again these UI components could be called Microfrontends but the same caveat applies - each component was substantial

The purpose of this course is to pass on to you how such substantial backend application services and user interface components are developed and independently deployed into Amazon AWS and to show you how Amazon's own cloud services are used by these applications

So notice I used two key words there
Developed
Deployed

On AWS developing the application software is typically only half the story

The other half is deploying it

For that AWS have come up with a beautiful solution

They have written their own software to deploy it for you. It consists of a huge library of functions - you just call the functions and they install your code for you. Collectively they are know as the CDK or cloud development kit.

In this course we will write all our application software - both backend services and user interface in Typescript

We will also write typescript programs which call those CDK functions which will deploy our code

I now want to spend a little time going into detail about exactly how our software will be designed and how they work with AWS services

Start with Lambda

- serverless
- not functions which add two numbers together
- the way we are going to use lambda functions may surprise you a lot because each of our lambda functions will be hooked up to a node server which can handle many different types of request

Now explain
www.domain.com/service/operation

www.example.com/customer/insert
www.example.com/customer/update
www.example.com/customer/delete
