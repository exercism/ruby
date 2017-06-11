# xRuby

[![Build Status](https://travis-ci.org/exercism/xruby.svg?branch=master)](https://travis-ci.org/exercism/xruby)
[![Join the chat at https://gitter.im/exercism/xruby](https://badges.gitter.im/exercism/xruby.svg)](https://gitter.im/exercism/xruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Exercism Exercises in Ruby

## Setup

You'll need a recent (2.1+) version of Ruby, but that's it. Minitest ships with
the language, so you're all set.

## Anatomy of an Exercise

The files for an exercise live in `exercises/<slug>`. The slug for an exercise
is a unique nickname composed of a-z (lowercase) and -, e.g. `clock` or
`atbash-cipher`. Inside its directory, each exercise has:

* a test suite, `<exercise_name>_test.rb`
* an example solution, `.meta/solutions/<exercise_name>.rb`

where `<exercise_name>` is the underscored version of the exercise's slug, e.g.,
`clock` or `atbash_cipher`.

If the exercise has a test generator, the directory will also contain:

* `.version`
* the test generator, `.meta/generator/<exercise_name>_case.rb`

A few exercises use a custom test template:

* `.meta/generator/test_template.erb`

### BookKeeping::VERSION

For some, even perhaps many, of the exercises, you will find a
reference to the `BookKeeping` module, but this is only included when
tests have been generated; see [Generated Test Suites](#generated-test-suites).

### Canonical Data

**Most exercises can be generated from shared inputs/outputs, called canonical
data (see [Generated Test Suites](#generated-test-suites) below).** To find out
whether a test has canonical data, check
the [x-common repo](https://github.com/exercism/x-common/tree/master/exercises).

## Running the Tests

Run the tests using `rake`, rather than `ruby path/to/the_test.rb`. `rake` knows
to look for the example solution and to disable skips. Just tell `rake` the name
of your problem and you are set:

```sh
rake test:clock
```

To pass arguments to the test command, like `-p` for example, you can run
the following:

```sh
rake test:clock -- -p
```

To run a subset of the tests, use a regular expression. For example, if tests
exist that are named identical_to_4_places, and identical, then we can run both
tests with

```sh
rake test:hamming -- -p -n="/identical/"
```

Note that flags which have an attached value, like above, must take the form
`-flag=value` and if `value` has spaces `-flag="value with spaces"`.


### Generated Test Suites

Generated test suites use the `bin/generator` cli.

Before using the cli it is recommended you run `bundle install` from within
the xruby directory to install/update any required gems.

While many of the exercises which have canonical data already have generators,
some do not. To find out whether an exercise has a generator, run

    bin/generate -h

In addition to a usage message, the `-h` flag lists all exercises with a
generator. If a generator is available for your exercise, you can

* [Regenerate the test suite](#regenerating-an-exercise) based on updated canonical data
* [Make changes to a generated exercise](#changing-a-generated-exercise)

If not, you will need to [implement a new generator](#implementing-a-generator)

Generated exercises depend on the [the shared metadata][x-common], which must be
cloned to the same directory that contains your clone of the xruby repository:

```
tree -L 1 ~/code/exercism
├── x-common
└── xruby
```

#### Regenerating a Test Suite

From within the xruby directory, run the following command:

    bin/generate <slug>

#### Changing a Generated Exercise

Do not edit `<slug>/<exercise_name>_test.rb`. Any changes you make will
be overwritten when the test suite is regenerated.

There are two reasons why a test suite might change:

1. the tests need to change (an incorrect expectation, a missing edge case, etc)
1. there might be issues with the style or boilerplate

In the first case, the changes need to be made to the `canonical-data.json` file for
the exercise, which lives in the x-common repository.

```
../x-common/exercises/<slug>/
├── canonical-data.json
├── description.md
└── metadata.yml
```

This change will need to be submitted as a pull request to the x-common
repository. This pull request needs to be merged before you can regenerate the
exercise.

Changes that don't have to do directly with the test inputs and outputs should
be made to the exercise's test case generator, discussed
in [implementing a new generator](#implementing-a-generator), next.  Then you
can regenerate the exercise with `bin/generate <slug>`.

#### Implementing a Generator

An exercise's test case generator class produces the code that goes inside
the minitest `test_<whatever>` methods. An exercise's generator lives in
`exercises/<slug>/.meta/generator/<exercise_name>_case.rb`.

The test case generator is a derived class of `ExerciseCase` (in
`lib/generator/exercise_case.rb`). `ExerciseCase` does most of the work of
extracting the canonical data. The derived class wraps the JSON for a single
test case. The default version looks something like this:

```ruby
require 'generator/exercise_case'

class <ExerciseName>Case < Generator::ExerciseCase

  def workload
    # Example workload:
    "#{assert} Problem.call(#{input.inspect})"
  end

end
```

where `<ExerciseName>` is the CamelCased version of the exercise's slug. This is
important, since the generator script will infer the name of the class from
`<slug>`.

This class must provide the methods used by the test
template. A
[default template](https://github.com/exercism/xruby/blob/master/lib/generator/test_template.erb) that
most exercises can (and do) use lives in `lib/generator/test_template.erb`. The
base class provides methods for the default template for everything except
`#workload`.

`#workload` generates the code for the body of a test, including the assertion
and any setup required. The base class provides a variety of
[assertion](https://github.com/exercism/xruby/blob/master/lib/generator/exercise_case/assertion.rb) and
[helper](https://github.com/exercism/xruby/blob/master/lib/generator/exercise_case.rb) methods.
Beyond that, you can implement any helper methods that you need
as private methods in your derived class. See below for more information
about [the intention of #workload](#workload-philosophy)

You don't have to do anything other than implement `#workload` to use the default
template.

If you really must add additional logic to the view template, you can use a
custom template. Copy `lib/generator/test_template.erb` to
`.meta/generator/test_template.erb` under your exercise directory and
customize. You may need to create `.meta` and/or `.meta/generator`.


#### Workload philosophy.

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
your example solution, but will gently suggest style for your test code.

The `-D` option that is suggested is provided to give you the ability to
easily ignore the Cops that you think should be ignored.  This is easily
done by doing `# rubocop:disable CopName`, where the `CopName` is replaced
appropriately.

For more complete information, see [Rubocop](http://batsov.com/rubocop/).

While `lib/generator/exercise_case.rb` provides helper functions as discussed
above, it remains the responsibility of an exercise's generator to interpret its
canonical-data.json data in a stylistically correct manner, e.g. converting
string indices to integer indices.

## READMEs

Do not add a README or README.md file to the exercise's directory. The READMEs
are constructed using shared metadata, which lives in the [x-common][] repo.

## Contributing Guide

For an in-depth discussion of how exercism language tracks and exercises work,
please see the
[contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)


## Ruby icon
The Ruby icon is the Vienna.rb logo, and is used with permission. Thanks Floor Dress :)

[x-common]: https://github.com/exercism/x-common
