# xRuby

[![Join the chat at https://gitter.im/exercism/xruby](https://badges.gitter.im/exercism/xruby.svg)](https://gitter.im/exercism/xruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Exercism Exercises in Ruby

## Setup

You'll need a recent (1.9.3+) version of Ruby, but that's it. Minitest
ships
with the language, so you're all set.

## Working on Test Suites

Each problem should have a test suite and an example solution.
The example solution should be named `example.rb`.

**Some test suites are generated from shared inputs/outputs, see
[Generated Test Suites](#generated-test-suites) below.** In short, if
the problem directory contains an `example.tt` file, then it's a
generated problem.

### Hard-coded Test Suites

Run the test with `ruby path/to/the_test.rb`.

At the moment the Ruby problems `skip` all but the first test, in order
to not overwhelm people with errors.

If you want to temporarily disable the skips while working on a test
suite, you can run the file with a shim that temporarily disables them:

```sh
ruby -I./lib -rdisable_skip exercise/exercise/filename_test.rb
```

It is simpler to use the `make` tool which is available in the project
root.  It will disable the skip calls for you automatically, it does the
same thing as the above.

If you would like to use the `make` tool to run a single test, while
developing clock, for example, you can do something like this:

```sh
ASSIGNMENT=clock ARGS='-p' make test-assignment
```

Where, "ASSIGNMENT" is the variable that holds the name of the lesson,
clock.

ARGS is where you can put additional arguments, here I am demonstrating
the `-p` argument which may give you 'pride' output.

If you use zsh, you can use the following function to make this process
simple.

```sh
xtest () { ASSIGNMENT=$1 ARGS=$2 make test-assignment }
```

Then you can simply use the command and exercise name, such as:

`xtest binary`

Or if you would like to use an option such as displaying the test names
rather than just the dots, for example:

`xtest clock -v`

Or with the pride reporter activated:

`xtest robot-name -p`

### Generated Test Suites

If you find an `example.tt` file in a problem directory, then the test suite is
generated from shared data. In this case changing the test file itself will
not be enough.

You will need to have cloned [the shared metadata](https://github.com/exercism/x-common)
at the same level as the xruby repository. E.g.

```
tree -L 1 ~/code/exercism
├── x-common
└── xruby
```

1. `xruby/$PROBLEM/example.tt` - the Erb template for the test file, `$PROBLEM_test.rb`.
1. `x-common/$PROBLEM.json` - the shared inputs and outputs for the problem.
1. `lib/$PROBLEM.rb` - the logic for turning the data into tests.
1. `xruby/bin/generate $PROBLEM` - the command to actually generate the test suite.
1. `.version` - used to keep track of the version of the test files as the data changes.

Additionally, there is some common generator logic in `lib/generator.rb`.

For example, take a look at the `hamming.json` file in the x-common repository, as well
as the following files in the xruby repository:

1. `hamming/example.tt`
1. `bin/generate hamming`
1. `lib/hamming.rb`
1. `lib/generator.rb`

The `hamming/hamming_test.rb` will never be edited directly. If there's a missing test case,
then additional inputs/outputs should be submitted to the x-common repository.

Changes to the test suite (style, boilerplate, etc) will probably have to be made to
`example.tt`.

### Exercise Generators

If you wish to create a new generator, or edit an existing one, the generators currently live in the lib directory and are named `$PROBLEM_cases.rb`.  For example, the hamming generator is `lib/hamming_cases.rb`.  

All generators currently adhere to a common public interface, and must define the following three methods:

- `test_name` - Output the name of the test
- `workload` - Output the body of the test
- `skipped` - Output skip syntax

## Pull Requests

We welcome pull requests that provide fixes to existing test suites (missing
tests, interesting edge cases, improved APIs), as well as new problems.

If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the
change.

Please submit changes to a single problem per pull request unless you're
submitting a general change across many of the problems (e.g. formatting).

You can run (some) of the same checks that we run by running the
following tool in your terminal:

    bin/local-status-check

If you would like to have these run right before you push your commits,
you can activate the hook by running this tool in your terminal:

    bin/setup-git-hoooks

Thank you so much for contributing! :sparkles:

### Style Guide

We have created a minimal set of guidelines for the testing files, which
you can take advantage of by installing the `rubocop` gem.  It will use
the configuration file located in the root folder, `.rubocop.yml`.  When
you edit your code, you can simply run `rubocop -D`.  It will ignore
your `example.rb`, but will gently suggest style for your test code.

The `-D` option that is suggested is provided to give you the ability to
easily ignore the Cops that you think should be ignored.  This is easily
done by doing `# rubocop:disable CopName`, where the `CopName` is replaced
appropriately.

For more complete information, see [Rubocop](http://batsov.com/rubocop/).

It is the responsibility of the Ruby test generator to interpret the $PROBLEM.json data in a stylistically correct manner, eg downcase the test method names.

## READMEs

Please do not add a README or README.md file to the problem directory. The
READMEs are constructed using shared metadata, which lives in the
[exercism/x-common](https://github.com/exercism/x-common) repository.

## Contributing Guide

For an in-depth discussion of how exercism language tracks and problem sets
work, please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

## License

The MIT License (MIT)

Copyright (c) 2014 Katrina Owen, _@kytrinyx.com

## Ruby icon
The Ruby icon is the Vienna.rb logo, and is used with permission. Thanks Floor Dress :)
