# Getting Started

These exercises lean on Test-Driven Development (TDD), but they're not an
exact match.

The following steps assume that you are in the same directory as the test
suite.

## Step 1

Run the test suite. It's in Minitest, and can be run with ruby:

    $ ruby bob_test.rb

This will fail, complaining that there is no file called `bob`.

To fix the error create an empty file called `bob.rb` in the same
directory as the `bob_test.rb` file.

## Step 2

Run the test again. It will give you a new error.


    1) Error:
    BobTest#test_stating_something:
    NameError: uninitialized constant Bob
        bob_test.rb:12:in `test_stating_something'

Within the first test, we are telling ruby to create a new Bob object,
but it doesn't know anything about any Bob, so we need to make one.

Open up the bob.rb file and add the following code:

    class Bob
    end

## Step 3

Run the test again.

    1) Error:
    BobTest#test_stating_something:
    NoMethodError: undefined method `hey' for #<Bob:0x007fa531343e50>
        bob_test.rb:12:in `test_stating_something'


This time we have a Bob, but we're trying to call a method named "hey" on him.

Open up bob.rb and add a method definition inside the class:

    class Bob
      def hey
      end
    end

## Step 4

Run the test again.

    1) Error:
    BobTest#test_stating_something:
    ArgumentError: wrong number of arguments (1 for 0)
      in `hey' bob_test.rb:12:in `test_stating_something'

The method "hey" needs to take an argument.

These are examples of method definitions that take arguments:

    def greet(name)
    end

    def drink(beverage)
    end

Change the "hey" method definition so it takes an argument.

## Step 5

Run the test again.

    1) Failure:
    BobTest#test_stating_something [bob_test.rb:12]:
    Expected: "Whatever."
      Actual: nil

Up until now we've been getting errors, this time we get a failure.

An error means that ruby cannot even run properly because things like missing
files or referencing classes or methods that don't exist, or because of syntax
errors.

A failure is different—when you have a failure the ruby is running just fine,
but the test is expecting one outcome, but getting another.

The test is expecting the hey method to return the string "Whatever". The
easiest way to make it pass, is to simply stick the string "Whatever" inside
the method definition.

## Step 6

Run the test again.

If it fails you're going to need to read the error message carefully to figure
out what went wrong, and then try again.

If it passes, then you're ready to move to the next step.

Open the bob_test.rb file, and find the word "skip". All but the first test
start with "skip", which tells Minitest to ignore the test. This is so that
you don't have to deal with all the failures at once.

To activate the next test, delete the "skip", and run the test suite again.

## Wash, Rinse, Repeat

Delete one "skip" at a time, and make each test pass before you move to the
next one.

## Submit

When everything is passing, you can submit your code with the following
command:

    $ exercism submit bob.rb

