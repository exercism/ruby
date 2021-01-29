# Transpose

Given an input text output it transposed.

Roughly explained, the transpose of a matrix:

```text
ABC
DEF
```

is given by:

```text
AD
BE
CF
```

Rows become columns and columns become rows. See <https://en.wikipedia.org/wiki/Transpose>.

If the input has rows of different lengths, this is to be solved as follows:

- Pad to the left with spaces.
- Don't pad to the right.

Therefore, transposing this matrix:

```text
ABC
DE
```

results in:

```text
AD
BE
C
```

And transposing:

```text
AB
DEF
```

results in:

```text
AD
BE
 F
```

In general, all characters from the input should also be present in the transposed output.
That means that if a column in the input text contains only spaces on its bottom-most row(s),
the corresponding output row should contain the spaces in its right-most column(s).

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

    ruby transpose_test.rb

To include color from the command line:

    ruby -r minitest/pride transpose_test.rb


## Source

Reddit r/dailyprogrammer challenge #270 [Easy]. [https://www.reddit.com/r/dailyprogrammer/comments/4msu2x/challenge_270_easy_transpose_the_input_text](https://www.reddit.com/r/dailyprogrammer/comments/4msu2x/challenge_270_easy_transpose_the_input_text)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
