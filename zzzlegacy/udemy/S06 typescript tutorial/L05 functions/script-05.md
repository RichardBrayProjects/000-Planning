```
MAKE SURE
- ALL OUTPUTS ARE CLEARED,
- SCREEN IS ZOOMED
- SCREEN IS CENTERED

Hello and welcome back

In this lesson we will be looking at what Functions

-----
PART 1
------

If you take a look at the first cell you can see that we are declaring a function called greetUser

In TypeScript we can annotate both the type of the parameters being passed :
here you can see where annotating the name paramter with type string

We can also annotate the type of value that the function returns

Here you can see this is done by adding a colon and the type after the paramter list

and here we are returning a string.

The last line of this cell calls greetUser with the string 'Arty'

So lets run the code cell

PLAY

and we can see that when the function is called it returns a string which is displayed by the Jupyter Notebook

------
PART 2
------

In part 2 we can see a very similar example but this time the function take two parameters and each one is annotated as a string.

Again, the function returns a string annotated here.

Lets run this function

PLAY

and we can see the output here.

--------
PART 3
--------
JavaScript also supports the notion of optional parameters.

If you look here you can see that prefix has a question mark after it :

that means that it is an optional paramter

which doesn't have to be supplied when the function is called

So when this function is called
if the prefix paramters is supplied then prefix willa value of type string string
but if the prefix paramter is NOT supplied, then this prefix parameter will be of type undefined

If you remember from our boolean values lesson undefined is false as is an empty string, whilst a non-empty string is true.

So this if (prefix) statement will only be true if prefix was passed as a non-empty string.

Lets run the function

PLAY

And as you can see when the function was called with just a single string - Server started
 that's all that is printed out

But when its called with two strings ... the second one is printed out in square brackets first

One thing you need to remember when using optional paramters is that they

must come after the non-optional parameters so the runtime can figure out what is actually missing.

--------
PART 4
--------

In part 4 we can see that default parameters are like optional parameters -

just like with optional paramters you can the function and not supply any value for the parameter

The difference with default parameters is that

whereas with optional paramters, the missing parameter is just assigned the value undefined

with default paramters you can specify what value the missing parameter should take

Lets look at this example here

The createTask function has a default paramter called priority with a default value of 1

Here we call createTask inside these console.log statements

Lets run this cell

PLAY

In the first call we supplied two paramters - Fix Bug and 3 and we see that's what is printed out

In the second call we supplied just one paramter - Buy groceries - and we can see that the priority took the default value of 1

-------
PART 5
-------

Sometimes a function doesn't return a value : it just does a job and returns.

We see an example of this in part 5

as you can see that the function logInfo doesn't return a value.

TypeScript has a special syntax for this :
the function's return type should be marked as void.

Lets run this function and see it just prints to the console

PLAY

Ok, this lesson has gone on a while so I will bring it to a close here

And in the next lesson we will finish off going through

this Juypter Notebook on functions.

----------------------------------------------
END OF VIDEO ONE
----------------------------------------------

Lets move on to part 6

-------
PART 6
-------

JavaScript supports object oriented programming principally through what are known as classes.

Now, in the course ahead we won't be implementing classes as a rule.

In general we will use a more functional style of programming.

Having said that we will be using some very common built-in classes such as arrays and strings.

The reason we are bringing them up in a lesson on functions is that
   one of the key feature of object oriented classes is that
   a class can contain functions are known as methods.

Take a look at this code sample here.

In the function formatTitle we are calling the toUpperCase method on the string called title.

Notice the syntax : first the variable, then a dot and then the method name.

The toUpperCase method returns a value and in this case that value is being assigned to ucTitle.

This is a syntax you will see over and over again in JavaScript programs.

If you look below, these methods can be chained.

Here we see a similar example.

First, the toLowerCase() method is called on username.
That returns a string value which is the lowercase version of username.

Then the trim() method is called on that lowercase string.
trim() removes leading and trailing spaces.

The key insight: each method returns a value, and that returned value
immediately becomes the object on which the next method is called.











```
