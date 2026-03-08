```
Hello and welcome to the first practical lesson in the TypeScript tutorial.

In this lesson we'll start by looking at strings, numbers and booleans.

JavaScript does has other primitive types such as undefined and null and bigint which we'll' come to shortly,

but we'll focus on these three fundamental ones first.

This lesson will be pure JavaScript and then we'll start looking at TypeScript in the next lesson.

In front of you is a Jupyter Notebook file.

Its made of up of markdown cells and code cells.

The great thing is that the code snippets can be run and the output displayed right under the cell.

All the notebooks in this tutorial are available in the course repo.

This leaves you a lot of options for how do do this tutorial : you can watch me, follow along, or just work through the notebooks or some combination of them.

I'm going to start with console.log

When a JavaScript application is running you can write data to the console.

If the JavaScript is a front end application you can find the console in the chrome developer tools menu item (you can normally hit F12 on a web page to see them)

If its a backend application running in Node then they will appear in a terminal.

And if its running in the cloud then there is normally some sort of logging service which will show you the console output.

------
PART 1
-------

In the cell below you can see I have used the const keyword to declare some new variables.

The three variables have been given values of different types - a string, a number and a boolean.

console.log is a function which will display whatever is passed to it.

So lets run this cell and see what happens

PLAY

as you can see the three console.logs each produced a new line of output under the cell - showing the values of our three variables

If I change 25 to 24 and run press play again I can instantly see the results

You can see that these Jupyter notebooks are fantastic for prototyping small bits of code to check they work

------
PART 2
-------

In addition to the JavaScript console.log method of output, Jupyter Notebooks have their own way of displaying output

All you have to do is place a value on the last line of a cell and it will be printed under the cell.

Here we have a variable called message and it holds a string.

When we put it on the last line of the cell, all on its own and not doing anything else, the Jupyter Notebook will understand that its to be displayed.

If I press the play button we can see its output in green.

-------
PART 3
-------

Lets look at strings.

In JavaScript you choose which type of quote marks you prefer for strings.

You can use single quotes, double quotes or backticks to surround strings in your code.

JavaScript doesn't care which you use and you can use a mixture if you like.

That's what I've done in the code here.

I have created three string variables - one using each type of quotes.

I've then displayed each one using console.log

If I press play you can see that it didn't make any difference which quote type was used

The output is always the same : hello world.

-------
PART 4
-------

In JavaScript, we call anything that produces a value an expression.

If we surround a string with backticks, we can embed expressions right into them.

If you take a look at this code below you can see we have set up a couple of variables called item and width

The last line of the cell contains a string surrounded by backticks so Jupyter will display this string as output when the cell is run.

Inside the string is normal text but also this funny sytax surrounding four expressions

the four expressions are
- the item variable,
- the number 4,
- the width variable,
- and a small formula

These will all be evaluated and whatever value is produced will be inserted into the string.

The funny syntax is known as a templated literal and you place your expressing in between curly braces with a dollar before them.

Lets run this cell and see it working.

PLAY

As you can see all four expressions have been evaluated and the output is as we would expect

-------
PART 5
-------

Moving on from strings to numbers.

JavaScript has a single number type that covers integers, decimals, and negative numbers.

There is a special type for very big integers called bigint which is useful for holding things like cryptocurrency values, but we won't be using it in this course.

In the cell below you can see I've created three different variables all of number tupe.

I am using the special keyword typeof which returns the type of the variable which follows it.

Lets run this cell

PLAY

As you can see all three variables are of type number.

-------
PART 6
-------

Lastly is booleans.

On the surface these are very simple because they either take the value true or false.

In this cell I have declared a couple of boolean variables and displayed them.

You can see I've followed the convention of start boolean variable names with is or has where that makes sense.

Lets run this cell.

PLAY

The backticked string just evaluates these variables to the strings true and false.

-------
PART 7
-------

Now lets take a quick look at Boolean values.

Lets take a look at the cell below.

So Boolean() is just a built-in function that converts whatever you give it into either true or false.

So here, we're passing in the number 1, and it's going to give us back a the value true.

... which we assign to a variable and then print out using console.log

Lets run this cell

PLAY

and you can see its printed out true as we were expecting.

Basically, JavaScript has rules which say that
- some values are essentially 'true-ish'
- which is known as truthy
- and others are essentially 'false-ish'
- which is known as falsy.,

... and when you pass some value to Boolean() - like we passed the number 1 - it returns either true or false according to those rules.

As you can see I've commented out some cells below ... lets now uncomment them and run the cell again and we can see whether various values are truthy or falsy

PLAY

So the basic rules we are covering in the example above is that

with numbers,

0 is false, other values are true

there are some special false values like NaN and -0 but we needn't bother with them here

null is false
undefined is false
empty strings with no text in them "" are false
and all other strings with a length greater than zero are 0.

This is quite a bit to take in but don't worry the rules are generally quite intuitive and in this course we won't be doing anything out of the ordinary.



```
