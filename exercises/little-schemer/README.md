# Little Schemer

Implement four operations: `null?`, `car`, `cdr` (pronounced could-der), and
`atom?` to be *used together* in defining a **recursive operation** `lat?` (short
for list of atoms).

Given a list of numbers, strings, and/or lists, `lat?` returns a **boolean**
indicating if the input list is a list of atoms.

```
l = [1, 'Two', 3, 4, []]
lat?(l)
false

m = ['Grapefruit', 'Tea', 'Yo']
lat?(m)
true
```

Check the test suite for expected function behaviors.

## Restrictions

`lat?` must be solved using recursion. Use your definitions of `null?`, `car`,
`cdr`, and `atom?` to help! They will prove invaluable!

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

    ruby little_schemer_test.rb

To include color from the command line:

    ruby -r minitest/pride little_schemer_test.rb


## Source

Inspiration for this exercise comes from this book, it's a fun way to learn recursion.
[Little Schemer](https://mitpress.mit.edu/books/little-schemer-fourth-edition)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
