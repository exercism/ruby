# Getting Started

These exercises lean on Test-Driven Development (TDD), but they're not an
exact match.

The following steps assume that you are in the same directory as the test
suite.

## Step 1

Run the test suite. It's in Minitest, and can be run with ruby:

    $ ruby hamming_test.rb

This will fail, complaining that there is no file called `hamming`.

To fix the error create an empty file called `hamming.rb` in the same
directory as the `hamming_test.rb` file.

## Step 2

Run the test again. It will give you a new error.


    1) Error:
    HammingTest#test_no_difference_between_identical_strands:
    NameError: uninitialized constant Hamming
        hamming_test.rb:12:in `test_no_difference_between_identical_strands'

Within the first test, we are telling ruby to create a new Hamming object,
but it doesn't know anything about any Hamming, so we need to make one.

Open up the hamming.rb file and add the following code:

    class Hamming
    end

## Step 3

Run the test again.

    1) Error:
    HammingTest#test_no_difference_between_identical_strands:
    NoMethodError: undefined method `compute' for #<Hamming:0x007fa531343e50>
        hamming_test.rb:12:in `test_no_difference_between_identical_strands'


This time we have a Hamming, but we're trying to call a method named "compute" on him.

Open up hamming.rb and add a method definition inside the class:

    class Hamming
      def compute
      end
    end

## Step 4

Run the test again.

    1) Error:
    HammingTest#test_no_difference_between_identical_strands:
    ArgumentError: wrong number of arguments (2 for 0)
      in `compute' hamming_test.rb:12:in `test_no_difference_between_identical_strands'

The method "compute" needs to take an argument.

These are examples of method definitions that take arguments:

    def greet(name)
    end

    def drink(beverage)
    end

Change the "compute" method definition so it takes an argument.

## Step 5

Run the test again.

    1) Failure:
    HammingTest#test_no_difference_between_identical_strands [hamming_test.rb:12]:
    Expected: 0
      Actual: nil

Up until now we've been getting errors, this time we get a failure.

An error means that ruby cannot even run properly because things like missing
files or referencing classes or methods that don't exist, or because of syntax
errors.

A failure is different—when you have a failure the ruby is running just fine,
but the test is expecting one outcome, but getting another.

The test is expecting the compute method to return the number 0. The easiest way 
to make it pass, is to simply stick the number 0 inside the method definition.

## Step 6

Run the test again.

If it fails you're going to need to read the error message carefully to figure
out what went wrong, and then try again.

If it passes, then you're ready to move to the next step.

Open the hamming_test.rb file, and find the word "skip". All but the first test
start with "skip", which tells Minitest to ignore the test. This is so that
you don't have to deal with all the failures at once.

To activate the next test, delete the "skip", and run the test suite again.

## Wash, Rinse, Repeat

Delete one "skip" at a time, and make each test pass before you move to the
next one.

## Submit

When everything is passing, you can submit your code with the following
command:

    $ exercism submit hamming.rb

