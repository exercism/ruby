# Wordy

Parse and evaluate simple math word problems returning the answer as an integer.


## Iteration 1 — Addition

Add two numbers together.

> What is 5 plus 13?

Evaluates to 18.

Handle large numbers and negative numbers.


## Iteration 2 — Subtraction, Multiplication and Division

Now, perform the other three operations.

> What is 7 minus 5?

2

> What is 6 multiplied by 4?

24

> What is 25 divided by 5?

5


## Iteration 3 — Multiple Operations

Handle a set of operations, in sequence.

Since these are verbal word problems, evaluate the expression from
left-to-right, _ignoring the typical order of operations._

> What is 5 plus 13 plus 6?

24

> What is 3 plus 2 multiplied by 3?

15  (i.e. not 9)


## Bonus — Exponentials

If you'd like, handle exponentials.

> What is 2 raised to the 5th power?

32


* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called
`hello_world_test.rb`, you can run the following command:

    ruby hello_world_test.rb

To include color from the command line:

    ruby -r minitest/pride hello_world_test.rb

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
