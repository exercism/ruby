# Exercism Ruby Track

[![Build Status](https://travis-ci.org/exercism/ruby.svg?branch=master)](https://travis-ci.org/exercism/ruby)
[![Join the chat at https://gitter.im/exercism/ruby](https://badges.gitter.im/exercism/ruby.svg)](https://gitter.im/exercism/ruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Exercism Exercises in Ruby

#### Table of Contents
- [Setup](#setup)
- [Anatomy of an Exercise](#anatomy-of-an-exercise)
  - [Canonical Data](#canonical-data)
- [Running the Tests](#running-the-tests)
  - [Generated Test Suites](#generated-test-suites)
    - [Regenerating a Test Suite](#regenerating-a-test-suite)
    - [Changing a Generated Exercise](#changing-a-generated-exercise)
    - [Implementing a Generator](#implementing-a-generator)
    - [Workload Philosophy](#workload-philosophy)
- [Pull Requests](#pull-requests)
  - [Style Guide](#style-guide)
- [READMEs](#readmes)
- [Contributing Guide](#contributing-guide)
- [Ruby icon](#ruby-icon)


## Setup

You'll need a recent (2.5+) version of Ruby, but that's it. Minitest ships
with the language, so you're all set.

## Anatomy of an Exercise

The files for an exercise live in `exercises/<slug>`. The slug for an exercise
is a unique nickname composed of a-z (lowercase) and -, e.g.  `clock` or
`atbash-cipher`. Inside its directory, each exercise has:

* a test suite, `<exercise_name>_test.rb`
* an example solution, `.meta/solutions/<exercise_name>.rb`

where `<exercise_name>` is the underscored version of the exercise's slug,
e.g., `clock` or `atbash_cipher`.

If the exercise has a test generator, the directory will also contain:

* the test generator, `.meta/generator/<exercise_name>_case.rb`

A few exercises use a custom test template:

* `.meta/generator/test_template.erb`

### Canonical Data

**Most exercises can be generated from shared inputs/outputs, called canonical
data (see [Generated Test Suites](#generated-test-suites) below).** To find
out whether a test has canonical data, check the
[problem-specifications repo](https://github.com/exercism/problem-specifications/tree/master/exercises).

## Running the Tests

Run the tests using `rake`, rather than `ruby path/to/the_test.rb`.  `rake`
knows to look for the example solution and to disable skips. Just tell `rake`
the name of your problem and you are set:

```sh
rake test:clock
```

To pass arguments to the test command, like `-p` for example, you can run the
following:

```sh
rake test:clock -- -p
```

To run a subset of the tests, use a regular expression. For example, if tests
exist that are named identical_to_4_places, and identical, then we can run
both tests with

```sh
rake test:hamming -- -p -n="/identical/"
```

Note that flags which have an attached value, like above, must take the form
`-flag=value` and if `value` has spaces `-flag="value with spaces"`.


### Generated Test Suites

Generated test suites use the `bin/generator` cli.

Before using the cli it is recommended you run `bundle install` from within
the ruby directory to install/update any required gems.

While many of the exercises which have canonical data already have generators,
some do not. To find out whether an exercise has a generator, run

    bin/generate -h

In addition to a usage message, the `-h` flag lists all exercises with a
generator. If a generator is available for your exercise, you can

* [Regenerate the test suite](#regenerating-an-exercise) based on
  updated canonical data
* [Make changes to a generated exercise](#changing-a-generated-exercise)

If not, you will need to
[implement a new generator](#implementing-a-generator).

Generated exercises depend on the
[the shared metadata][problem-specifications], which must be cloned to the
same directory that contains your clone of the ruby repository:

```
tree -L 1 ~/code/exercism
├── problem-specifications
└── ruby
```
To explain a bit more, you must follow this commands step-by-step:-

``` bash
  $ mkdir exercism
  $ cd exercism
```
Fork the [exercism/ruby](https://github.com/exercism/ruby)

Fork the [exercism/problem-specifications](https://github.com/exercism/problem-specifications)

Now you need to clone both the above repositories
``` bash

$ git clone https://github.com/YOUR-USERNAME/YOUR-RUBY-REPOSITORY
$ git clone https://github.com/YOUR-USERNAME/YOUR-PROBLEM-S-REPOSITORY

```
Next, you need to [configure the remote](https://help.github.com/articles/configuring-a-remote-for-a-fork/) and [synchronize](https://help.github.com/articles/syncing-a-fork/) it.

Make sure you have synced up local master branch and upstream master branch.
Since this will keep local master branch up-to-date with the upstream repository.
Thereby, you will able to get the latest commits.


#### Regenerating a Test Suite

From time to time, the
[canonical data](https://github.com/exercism/problem-specifications/tree/master/exercises)
for an exercise's tests changes, and we need to keep the Ruby version's tests
synced up.  Regenerating these tests is a quick and easy way to help maintain
the track and get involved!

If it's your first time cloning/contributing to the repository, you'll need to
install any dependencies via `bundle`:

```bash
bundle install
```

Be sure that you're working on the most up-to-date version of the repo.  From
the root of your copy of the repository:

```bash
# Add the exercism repo as upstream if you haven't yet:
git remote add upstream https://github.com/exercism/ruby.git

# Pull down any changes
git fetch upstream

# Merge any upstream changes with your master branch
git checkout master
git merge upstream/master
```

Depending on your git workflow preferences and the state of your local repo,
you may want to do some rebasing.
[See the rebasing documentation for more information.](https://help.github.com/articles/about-git-rebase/)

The generator also depends on the presence of Exercism's
`problem-specifications` repository (see the file tree in the section above).
Make sure you've got an *up-to-date* version of the specifications in a
`problem-specifications` folder that's in a parallel directory to your local
copy of the `ruby` repository.

To check which problems have possibly been updated, run:

```bash
bin/generate --all
```

This will autogenerate all of the test cases for which generators exist.  Use
`git diff` (or your preferred method) to find out which test files have
changed.  Some exercises will update because someone updated the description
or other exercise metadata.  Others will change because the actual test suite
has changed.

Once everything has been regenerated and updated, you're almost ready to
submit your changes via pull request.  Please be sure to only update one
exercise per pull request.  Also, please follow the guidelines in the [Pull
Requests](#pull-requests) section, being sure to follow the pattern of
`<slug>: Regenerate Tests`, where slug is the slug of the exercise that your
pull request is regenerating.

#### Changing a Generated Exercise

Do not edit `<slug>/<exercise_name>_test.rb`. Any changes you make will be
overwritten when the test suite is regenerated.

There are two reasons why a test suite might change:

1. the tests need to change (an incorrect expectation, a missing edge case,
   etc)
1. there might be issues with the style or boilerplate

In the first case, the changes need to be made to the `canonical-data.json`
file for the exercise, which lives in the problem-specifications repository.

```
../problem-specifications/exercises/<slug>/
├── canonical-data.json
├── description.md
└── metadata.yml
```

This change will need to be submitted as a pull request to the
problem-specifications repository. This pull request needs to be merged before
you can regenerate the exercise.

Changes that don't have to do directly with the test inputs and outputs should
be made to the exercise's test case generator, discussed in
[implementing a new generator](#implementing-a-generator), next.  Then you can
regenerate the exercise with `bin/generate <slug>`.

#### Implementing a Generator

An exercise's test case generator class produces the code that goes inside the
minitest `test_<whatever>` methods. An exercise's generator lives in
`exercises/<slug>/.meta/generator/<exercise_name>_case.rb`.

The test case generator is a derived class of `ExerciseCase` (in
`lib/generator/exercise_case.rb`). `ExerciseCase` does most of the work of
extracting the canonical data and provides you with some accessor methods to
access the values you are likely to need to use.

For example:

If a section of the `canonical-data.json` file looks like this:
```json
  , { "description": "Bar'ing a name with numbers gives an error"
	, "property"   : "bar"
	, "input"      : {
		"firstName"  : "HAL",
		"lastName"   : "9000"
	  }
	, "expected"   : { "error": "You should never bar a number" }
	}
```

You will be able to access input['firstName'] by the Ruby methods `first_name`
(or `input_first_name`)

And the `expected["error"]` as: `error` or `expected_error`

If there is a property name conflict the "input" version will take precedence,
or you can use the `input_` and `expected_` prefixes to disambiguate.


The test template you need to write looks like this:

```ruby
require 'generator/exercise_case'

class <ExerciseName>Case < Generator::ExerciseCase

  def workload
    # Example workload:
    "#{assert} Problem.call(#{input.inspect})"
  end

end
```

where `<ExerciseName>` is the CamelCased version of the exercise's slug. This
is important, since the generator script will infer the name of the class from
`<slug>`.

This class must provide the methods used by the test
template. A
[default template](https://github.com/exercism/ruby/blob/master/lib/generator/test_template.erb)
that most exercises can (and do) use lives in
`lib/generator/test_template.erb`. The base class provides methods for the
default template for everything except `#workload`.

`#workload` generates the code for the body of a test, including the assertion
and any setup required. The base class provides a variety of
[assertion](https://github.com/exercism/ruby/blob/master/lib/generator/exercise_case/assertion.rb)
and
[helper](https://github.com/exercism/ruby/blob/master/lib/generator/exercise_case.rb)
methods.

Beyond that, you can implement any helper methods that you need as private
methods in your derived class. See below for more information about
[the intention of #workload](#workload-philosophy)

You don't have to do anything other than implement `#workload` to use the
default template.

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

You can run (some) of the same checks that we run by running the following
tool in your terminal:

    bin/local-status-check

If you would like to have these run right before you push your commits, you
can activate the hook by running this tool in your terminal:

    bin/setup-git-hoooks

Thank you so much for contributing! :sparkles:

### Style Guide

We have created a minimal set of guidelines for the testing files, which you
can take advantage of by installing the `rubocop` gem.  It will use the
configuration file located in the root folder, `.rubocop.yml`.  When you edit
your code, you can simply run `rubocop -D`.  It will ignore your example
solution, but will gently suggest style for your test code.

The `-D` option that is suggested is provided to give you the ability to
easily ignore the Cops that you think should be ignored.  This is easily done
by doing `# rubocop:disable CopName`, where the `CopName` is replaced
appropriately.

For more complete information, see [Rubocop](http://batsov.com/rubocop/).

While `lib/generator/exercise_case.rb` provides helper functions as discussed
above, it remains the responsibility of an exercise's generator to interpret
its canonical-data.json data in a stylistically correct manner, e.g.
converting string indices to integer indices.

## READMEs

All exercises must have a README.md file, but should not be created manually. The READMEs
are constructed using shared metadata, which lives in the [problem-specifications][] repo.

Use the `configlet` tool to generate a README from shared metadata:

1. Clone the [problem-specifications][] repo into an adjacent directory.
2. Fetch the configlet appropriate for your system: `bin/fetch-configlet`
3. Generate the readme for a particular exercise: `bin/configlet generate . --only rotational-cipher`

## Contributing Guide

If adding a new exercise:

* a [generator](#implementing-a-generator) should be implemented.
* a minimal, partial, solution should be able to be pushed, in order to create a
  WIP pull request.

For an in-depth discussion of how exercism language tracks and exercises work,
please see the
[contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data).

If you're just getting started and looking for a helpful way to get involved,
take a look at
[regenerating the test suites](#regenerating-a-test-suite),
[porting an exercise from another language](https://github.com/exercism/docs/blob/master/you-can-help/implement-an-exercise-from-specification.md),
or [creating an automated test generator](#implementing-a-generator).

## Ruby icon
The Ruby icon is the Vienna.rb logo, and is used with permission. Thanks Floor
Dress :)

[problem-specifications]: https://github.com/exercism/problem-specifications
