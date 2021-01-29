# Series

Given a string of digits, output all the contiguous substrings of length `n` in
that string in the order that they appear.

For example, the string "49142" has the following 3-digit series:

- "491"
- "914"
- "142"

And the following 4-digit series:

- "4914"
- "9142"

And if you ask for a 6-digit series from a 5-digit string, you deserve
whatever you get.

Note that these series are only required to occupy *adjacent positions*
in the input; the digits need not be *numerically consecutive*.

In this exercise you're practicing iterating over an array, meaning: executing an operation on each element of an array. Ruby has many useful built-in methods for iterations. Take a look at [this article](http://jeromedalbert.com/ruby-how-to-iterate-the-right-way/).

Most of the methods listed in the article are not methods specifically for Array, but come from [Enumerable](https://ruby-doc.org/core/Enumerable.html). The article doesn't list iterating over _consecutive elements_. The first challenge is to find a method that does.


* * * *

For installation and learning resources, refer to the
[Ruby resources page](http://exercism.io/languages/ruby/resources).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby series_test.rb

To include color from the command line:

    ruby -r minitest/pride series_test.rb


## Source

A subset of the Problem 8 at Project Euler [http://projecteuler.net/problem=8](http://projecteuler.net/problem=8)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
