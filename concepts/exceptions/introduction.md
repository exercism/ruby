# Introduction

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
