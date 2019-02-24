# Resistor Colors

If you want to build something using a Raspberry Pi, you'll probably use _resistors_. For this exercise, you need to know two things about them:

* Each resistor has a resistance value.
* Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.
To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values. Each band acts as a digit of a number. For example, if they printed a brown band (value 1) followed by a green band (value 5), it would translate to the number 15.

In this exercise, you are going to create a helpful program so that you don't have to remember the values of the bands. The program will take two colors as input, and output the correct number.

The band colors are encoded as follows:

- Black: 0
- Brown: 1
- Red: 2
- Orange: 3
- Yellow: 4
- Green: 5
- Blue: 6
- Violet: 7
- Grey: 8
- White: 9

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

    ruby resistor_colors_test.rb

To include color from the command line:

    ruby -r minitest/pride resistor_colors_test.rb


## Source

Maud de Vries, Erik Schierboom [https://github.com/exercism/problem-specifications/issues/1464](https://github.com/exercism/problem-specifications/issues/1464)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
