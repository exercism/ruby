# Introduction

## Ternaries

A ternary conditional is a shorter way of writing simple `if/else` statements. 
If an `if/else` statement contains only two branches, one for when the condition is true and one for when it is false, it can be re-written as a ternary conditional.

Ternaries use a combination of the `?` and `:` symbols to split up a conditional:
```
condition ? true_branch : false_branch
```

The code on the left side of the `?` is the condition and the code on the right contains the two possible branches, separated by the `:`. 
If the condition is _true_, the code on the _left_ side of the `:` is executed.
If the condition is _false_, then the code on the _right_ of the `:` gets executed.

For example:

```ruby
if traffic_light == 'green'
  cross_the_road
else
  wait
end
```

can be re-written as:

```ruby
traffic_light == 'green' ? cross_the_road : wait
```

## Raising exceptions

Exceptions are a form of error handling.
They are called exceptions, as they normally appear when dealing with some unexpected event.

At any point in our code, we can "raise" an exception. 
We do this using the `raise` method, passing in an object - normally an Exception object, although we can also use basic strings.
For example, you'll see in the exercise stubs that we use the built-in `NotImplementedError` to tell Ruby that a method hasn't been implemented.
You can also use the shorthand syntax of `raise(ExceptionObject, params)`. 
For example:

```
# These are equivelent
raise NotImplementedError.new("Please implement this method")
raise NotImplementedError, "Please implement this method"
```

When Ruby sees this it bubbles the error to the top of the program and then exits.
For example, if you try dividing something by zero, you will see something like this:
```
5/0

#=> Traceback (most recent call last):
#=> ...
#=> ZeroDivisionError (divided by 0)
```

We can stop exceptions from causing our program to exit using the `rescue` keyword.
We'll look at this in more depth in a future exercise.
