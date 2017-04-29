# xRuby

[![Build Status](https://travis-ci.org/exercism/xruby.svg?branch=master)](https://travis-ci.org/exercism/xruby)
[![Join the chat at https://gitter.im/exercism/xruby](https://badges.gitter.im/exercism/xruby.svg)](https://gitter.im/exercism/xruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Exercism Exercises in Ruby

## Setup

You'll need a recent (2.1+) version of Ruby, but that's it. Minitest
ships
with the language, so you're all set.

## Working on Test Suites

Each problem should have a test suite and an example solution.
The example solution should be named `example.rb`.

**Some test suites are generated from shared inputs/outputs, see
[Generated Test Suites](#generated-test-suites) below.** In short, if
a `lib/<problem>_cases.rb` file exists, then it's a generated problem.

### Hard-coded Test Suites

Run the test with `ruby path/to/the_test.rb`.

At the moment the Ruby problems `skip` all but the first test, in order
to not overwhelm people with errors.

If you want to temporarily disable the skips while working on a test
suite, you can run the file with a shim that temporarily disables them:

```sh
ruby -I./lib -rdisable_skip exercise/exercise/filename_test.rb
```

It is simpler to use the `rake` tool which is available in the project
root.  It will disable the skip calls for you automatically, it does the
same thing as the above.

If you would like to use the `rake` tool to run a single test while
developing clock, for example, you can do something like this:

```sh
rake test:clock
```

To pass arguments to the test command, like `-p` for example, you can run
the following:
```sh
rake test:clock -- -p
```

To show an example of running a limited number of tests, we will use the
"hamming" exercise with a pattern of "identical" to run (currently) two tests:
```sh
rake test:hamming -- -p -n="/identical/"
```

Note that flags which have an attached value, like above, must take the form
`-flag=value` and if `value` has spaces `-flag="value with spaces"`.


### Generated Test Suites

If you find a `<problem_name>_cases.rb` file in `lib/`, then the test suite is
generated from shared data, which can be found in the exercise definition in the [x-common][]
repository.

Typically you will want to do one of the following:

* [Regenerate the test suite](#regenerating-an-exercise) based on updated canonical data
* [Make changes to a generated exercise](#changing-a-generated-exercise)
* [Implement a new generator](#implementing-a-generator)

Generated exercises depend on the [the shared metadata][x-common], which must be
cloned to the same directory that contains your clone of the xruby repository:

```
tree -L 1 ~/code/exercism
├── x-common
└── xruby
```

#### Regenerating an Exercise

From within the xruby directory, run the following command, where $PROBLEM is the slug
of the exercise, e.g. `clock` or `atbash-cipher`:

```
bin/generate $PROBLEM
```

#### Changing a Generated Exercise

Do not edit `$PROBLEM/$PROBLEM_test.rb`. Any changes you make will be overwritten when
the file is generated the next time.

There are two reasons why a test suite might change:

1. the tests are wrong (an incorrect expectation, a missing edge case, etc)
1. there might be issues with the style or boilerplate

In the first case, the changes need to be made to the `canonical-data.json` file for
the exercise, which lives in the x-common repository.

```
../x-common/exercises/$PROBLEM/
├── canonical-data.json
├── description.md
└── metadata.yml
```

This change will need to be submitted as a pull request to the x-common repository. This pull
request needs to be merged before you can regenerate the exercise.

Changes that don't have to do directly with the test inputs and outputs should
be made to `lib/$PROBLEM_cases.rb`. Then you can regenerate the exercise with
`bin/generate $PROBLEM`.

#### Implementing a Generator

You will need to write code to produce the code that goes inside the test methods. Your
code will live in `lib/$PROBLEM_cases.rb`.

`lib/$PROBLEM_cases.rb` contains a derived class of `ExerciseCase` (in `lib/generator/exercise_cases.rb`)
which wraps the JSON for a single test case. The default version looks something like this:

```
class ProblemNameCase < ExerciseCase

  def workload
    # Example workload:
    "#{assert} Problem.call(#{input.inspect})"
  end

end
```

Instead of `ProblemName` use the CamelCased name of the actual problem. This is important, since
the generator script will infer the name of the class from the argument that is passed.

This class must provide the methods used by `lib/generator/test_template.erb`. The base class provides methods
for the default template for everything except `workload`.

`workload` generates the code for the body of a test, including the assertion
and any setup required. The base class provides a variety of assertion and
helper methods. Beyond that, you can implement any helper methods that you need
as private methods in your derived class. See below for more information about [the intention of workload](#workload-philosophy)

If you really must add additional logic to the view template, you can use a custom
template. Copy `lib/generator/test_template.erb` to your exercise directory, name it
`exercise.tt`, and customize.

You will not need to touch the top-level script, `bin/generate`.

The `bin/generate` command relies on some common logic implemented in `lib/generator.rb`.
You won't need to touch that, either.


### Workload philosophy.

Prioritize educational value over expert comprehension and make sure that
things are clear to people who may not be familiar with Minitest and even Ruby.

Provide the information the student needs to derive the code to pass the test
in a clear and consistent manner. Illustrate the purpose of the individual
elements of the assertion by using meaningful variable names.

Example output from the `workload` method:
```ruby
detector = Anagram.new('allergy')
anagrams = detector.match(["gallery", "ballerina", "regally", "clergy", "largely", "leading"])
expected = ["gallery", "largely", "regally"]
assert_equal expected, anagrams.sort
```


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

[x-common]: https://github.com/exercism/x-common
