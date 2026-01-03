```
INTRODUCTION

hello and welcome back

this lesson is a short introduction to pnpm workspaces

we'll start by looking at what's in a simple pnpm project which will compile and run a single program

we'll talk about pnpm packages and how they are installed

then we'll take a look at a pnpm workspace which contains a couple of separate programs

SIMPLE PROJECT

this is a typical pnpm project for a single program

it contains all your source code and a package.json file

the package.json file contains everything necessary to get your program up and running

so that includes

- the commands necessary to build and run your program together with some short aliases for them so we don't have to do much typing

Package.json also lists a number of other packages which your package depends on.

These are things like:

- any software libraries which have referenced in your source code - for example React

- and any tools necessary to buid your program - such as Typescript or Vite

These packages are all available in the public npm registry where pnpm can go to fetch them and install them.

Lets have a quick look at the npm website and search for a couple of them

NPM WEBSITE

every package on the npm website is just like our own package on the last slide : it consists of

- source code
- and a package.json file which shows any other packages which it depends on

REACT : lets look at the react package (SEARCH)

if we look at these headings we can see that there are thousands of versions and amazingly it doesn't have a single dependency on any other package

but there are a quarter of a million packages on npm right now which depend on that react library

TYPESCRIPT : and its a similar situation with the typescript package (SEARCH)

VITE: but with vite (SEARCH) we can see there are 6 dependencies

BACK TO SIMPLE PROJECT

lets look at where those packages are installed

AFTER PACKAGE INSTALLATION

as you can see from this slide,  pnpm maintains a single package store on our machine


when we run the pnpm install command in our project it will
- get the packages required from the npm registry, which includes
- the react, typescript and vite packages,
- as well as the packages vite depends on
- and any packages those packages depend on recursively

- it will copy them to our hard drive
- and create a folder called node-modules in our project folder

- its important to understand that the node-modules folder is actually just a symbolic link to the shared package store
- react, vite and typescript are installed into the package store and the symbolic link just points to that store : its not a real folder

HOW PACKAGES ARE RUN


once they are installed, packages like typescript and vite are ready to be run

bear in mind that packages like vite and typescript just contain source code

command line tools like these are actually executed by  node.js : that's the link between npm packages and node.js

on the other hand user interface applications like our program are executed by the chrome browser

in turn both the node application and chrome browser both share the same software which can understand and run Javascript known as the v8 engine - share by them both


WORKSPACE STRUCTURE

finally lets have a quick look at how a pnpm workspace

this is what's known as a monorepo : it is stored in a single repo on GitHub but contains multiple projects

in our case we have two projects which are app1 and app2 - each resembles the simple project we saw earlier
- it sits in its own folder and consists of a package.json file and some source code and a node_modules symbolic link to the central package registry


take a look on the left ...

the root folder contains its own package.json which just contains command aliases to build app1 and app2

there's also a pnpm-workspace yaml file which tells pnpm where to find the packages in this workspace

you can see it tells it to look in every folder inside the ui folder


WRAP UP

well that's the theory

the next lesson is a practical where we'll start to actually use this stuff

so i'll see you there

```
