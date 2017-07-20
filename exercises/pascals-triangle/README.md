# Pascals Triangle

Compute Pascal's triangle up to a given number of rows.

In Pascal's Triangle each number is computed by adding the numbers to
the right and left of the current position in the previous row.

```plain
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
# ... etc
```

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


## Source

Pascal's Triangle at Wolfram Math World [http://mathworld.wolfram.com/PascalsTriangle.html](http://mathworld.wolfram.com/PascalsTriangle.html)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
