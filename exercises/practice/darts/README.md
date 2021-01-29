# Darts

Write a method that returns the earned points in a single toss of a Darts game.

[Darts](https://en.wikipedia.org/wiki/Darts) is a game where players
throw darts to a [target](https://en.wikipedia.org/wiki/Darts#/media/File:Darts_in_a_dartboard.jpg).

In our particular instance of the game, the target rewards with 4 different amounts of points, depending on where the dart lands.

If the dart lands:

* outside the target: 0 points.
* in the outer circle of the target: 1 point.
* in the middle circle of the target: 5 points.
* in the inner circle of the target: 10 points.

The outer circle has a radius of 10 units (This is equivalent to the total radius for the entire target), the middle circle a radius of 5 units, and the inner circle a radius of 1. They are all centered to the same point (That is, the circles are [concentric](http://mathworld.wolfram.com/ConcentricCircles.html)) defined by the coordinates (0, 0).

Write a method that, given a point in the target (defined by its `real` Cartesian coordinates `x` and `y`), returns the correct amount earned by a dart landing in that point.
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

    ruby darts_test.rb

To include color from the command line:

    ruby -r minitest/pride darts_test.rb


## Source

Inspired by an exercise created by a professor Della Paolera in Argentina

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
