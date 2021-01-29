# Microwave

Convert the buttons entered on the microwave panel to their timer equivalent.

Microwave timers are smart enough to know that when you press _90_ for seconds, you mean '01:30', which is 90 seconds.  We want to have a "smart display" that will convert this to the lowest form of minutes and seconds, rather than leaving it as 90 seconds.

Build a class that accepts buttons entered and converts them to the proper display panel time.

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

    ruby microwave_test.rb

To include color from the command line:

    ruby -r minitest/pride microwave_test.rb


## Source

Jamie Gates [https://github.com/gatorjuice](https://github.com/gatorjuice)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
