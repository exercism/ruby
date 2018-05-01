# Alphanumeric Pattern Generator

Create a program that can generate and manage [alphanumeric](https://en.wikipedia.org/wiki/Alphanumeric) strings based on a given pattern.

An alphanumeric pattern is a string that contains alphabetic and numeric characters. In our example, `.` represents alphabetic characters (a-z) and `#` represents numeric characters (0-9), so the pattern `.#` could produce anything from `A0` to `Z9`.

An alphanumeric patterns can also have constant values. For example, the pattern `#.JH1.` could generate any pattern including the values `JH1` as index 2 ,3 and 4 respectively such as `9FJH1P`.

* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby alphanumeric_pattern_generator_test.rb

To include color from the command line:

    ruby -r minitest/pride alphanumeric_pattern_generator_test.rb


## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
