# Running Tests

In order to complete this exercise, and all of the subsequent exercises, you
will need to pass multiple tests.

## Understanding Test Results

After you have created and saved `hamming.rb`, run the test suite. You should
see output like the following:

    # Running:

    SSSSSSESSSSSSSSS

    Finished in 0.002593s, 6170.4588 runs/s, 0.0000 assertions/s.

      1) Error:
    HammingTest#test_identical_strands:
    NameError: uninitialized constant HammingTest::Hamming
    Did you mean?  HammingTest
        ../hamming/hamming_test.rb:9:in `test_identical_strands'

    16 runs, 0 assertions, 0 failures, 1 errors, 15 skips

    You have skipped tests. Run with --verbose for details.


The letters `SSSSSSESSSSSSSSS` show that there are sixteen tests altogether,
that one of them has an error (`E`), and that the rest of them are skipped (all
the `S` letters).

The tests are run in randomized order, which will cause the letters to display
in random order as well.

The goal is to have all passing tests, which will show in two places:

1. `SSSSSSESSSSSSSSS` will become a series dots: `................`, 

2. The line at the bottom will read `16 runs, 16 assertions, 0 failures, 0
   errors, 0 skips`.

## Passing Tests

Write enough code to change the Error to Failure, and finally to Passing.

Open `hamming_test.rb`, and find the word "skip". All but the first test start
with "skip", which tells Minitest to ignore the test. This is so that you don't
have to deal with all the failures at once.

To activate the next test, delete the "skip", or comment it out, and run the
test suite again.

## Wash, Rinse, Repeat

Delete one "skip" at a time, and make each test pass before you move to the
next one.
