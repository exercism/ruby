# Exercism Ruby Track

[![Configlet Status][configlet-workflow-badge]][configlet-workflow]
[![Exercise Test Status][tests-workflow-badge]][tests-workflow]

Exercism Exercises in Ruby

## Table of Contents

- [Setup][#setup]
- [Anatomy of an Exercise][#anatomy-of-an-exercise]
  - [Canonical Data][#canonical-data]
- [Running the Tests][#running-the-tests]
- [Pull Requests][#pull-requests]
  - [Style Guide][#style-guide]
- [READMEs][#readmes]
- [Contributing Guide][#contributing-guide]
- [Ruby icon][#ruby-icon]

## Setup

You'll need a recent (2.6+) version of Ruby, but that's it.
Minitest ships with the language, so you're all set.

## Anatomy of an Exercise

The files for an exercise live in `exercises/<slug>`.
The slug for an exercise is a unique nickname composed of a-z (lowercase) and -, e.g. `clock` or `atbash-cipher`. Inside its directory, each exercise has:

* a test suite, `<exercise_name>_test.rb`
* an example solution, `.meta/solutions/<exercise_name>.rb`

where `<exercise_name>` is the underscored version of the exercise's slug, e.g., `clock` or `atbash_cipher`.

If the exercise has a test generator, the directory will also contain:

* the test generator, `.meta/generator/<exercise_name>_case.rb`

A few exercises use a custom test template:

* `.meta/generator/test_template.erb`

### Canonical Data

**Most exercises can be generated from shared inputs/outputs, called canonical data (see [Generated Test Suites][#generated-test-suites] below).** To find out whether a test has canonical data, check the [problem-specifications repo][canonical exercises].

## Running the Tests

Run the tests using `rake`, rather than `ruby path/to/the_test.rb`.
`rake` knows to look for the example solution and to disable skips.
Just tell `rake` the name of your problem and you are set:

```sh
rake test:clock
```

To pass arguments to the test command, like `-p` for example, you can run the
following:

```sh
rake test:clock -- -p
```

To run a subset of the tests, use a regular expression.
For example, if tests exist that are named identical_to_4_places, and identical, then we can run both tests with

```sh
rake test:hamming -- -p -n="/identical/"
```

Note that flags which have an attached value, like above, must take the form `-flag=value` and if `value` has spaces `-flag="value with spaces"`.

## Pull Requests

We welcome pull requests that provide fixes to existing test suites (missing tests, interesting edge cases, improved APIs), as well as new problems.

If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the change.

Please submit changes to a single problem per pull request unless you're submitting a general change across many of the problems (e.g. formatting).

You can run (some) of the same checks that we run by running the following tool in your terminal:

    bin/local-status-check

If you would like to have these run right before you push your commits, you can activate the hook by running this tool in your terminal:

    bin/setup-git-hoooks

Thank you so much for contributing! :sparkles:

### Style Guide

We have created a minimal set of guidelines for the testing files, which you can take advantage of by installing the `rubocop` gem.
It will use the configuration file located in the root folder, `.rubocop.yml`.
When you edit your code, you can simply run `rubocop -D`.
It will ignore your example solution, but will gently suggest style for your test code.

The `-D` option that is suggested is provided to give you the ability to easily ignore the Cops that you think should be ignored.
This is easily done by doing `# rubocop:disable CopName`, where the `CopName` is replaced appropriately.

For more complete information, see [Rubocop][rubocop].

While `lib/generator/exercise_case.rb` provides helper functions as discussed above, it remains the responsibility of an exercise's generator to interpret its canonical-data.json data in a stylistically correct manner, e.g.  converting string indices to integer indices.

## READMEs

All exercises must have a README.md file, but should not be created manually.
The READMEs are constructed using shared metadata, which lives in the [problem-specifications][] repo.

Use the `configlet` tool to generate a README from shared metadata:

1. Clone the [problem-specifications][] repo into an adjacent directory.
2. Fetch the configlet appropriate for your system: `bin/fetch-configlet`
3. Generate the readme for a particular exercise: `bin/configlet generate . --only rotational-cipher`

## Contributing Guide

If adding a new exercise:

* a [generator][#implementing-a-generator] should be implemented.
* a minimal, partial, solution should be able to be pushed, in order to create a WIP pull request.

For an in-depth discussion of how exercism language tracks and exercises work, please see the [contributing guide][contributing guide].

If you're just getting started and looking for a helpful way to get involved, take a look at [regenerating the test suites][#regenerating-a-test-suite], [porting an exercise from another language][port exercise], or [creating an automated test generator][#implementing-a-generator].

We are also available at our community forum: [building-exercism]

## Ruby icon

The Ruby icon is the Vienna.rb logo, and is used with permission. Thanks Floor
Dress :)

[#anatomy-of-an-exercise]: #anatomy-of-an-exercise
[assertion]: https://github.com/exercism/ruby/blob/master/lib/generator/exercise_case/assertion.rb
[building-exercism]: https://forum.exercism.org/c/general/building-exercism/125
[#canonical-data]: #canonical-data
[canonical data]: https://github.com/exercism/problem-specifications/tree/master/exercises
[canonical exercises]: https://github.com/exercism/problem-specifications/tree/master/exercises
[#changing-a-generated-exercise]: #changing-a-generated-exercise
[configlet-workflow-badge]: https://github.com/exercism/ruby/actions/workflows/configlet.yml/badge.svg
[configlet-workflow]: https://github.com/exercism/ruby/actions/workflows/configlet.yml
[configure the remote]: https://help.github.com/articles/configuring-a-remote-for-a-fork/
[#contributing-guide]: #contributing-guide
[contributing-guide]: https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data
[default template]: https://github.com/exercism/ruby/blob/master/lib/generator/test_template.erb
[exercism ruby]: https://github.com/exercism/ruby
[#generated-test-suites]: #generated-test-suites
[helper]: https://github.com/exercism/ruby/blob/master/lib/generator/exercise_case.rb
[#implementing-a-generator]: #implementing-a-generator
[port exercise]: https://github.com/exercism/docs/blob/master/you-can-help/implement-an-exercise-from-specification.md
[problem-specifications]: https://github.com/exercism/problem-specifications
[problem-specifications]: https://github.com/exercism/problem-specifications
[#pull-requests]: #pull-requests
[#readmes]: #readmes
[rebasing documentation]: https://help.github.com/articles/about-git-rebase/
[#regenerating-a-test-suite]: #regenerating-a-test-suite
[#regenerating-a-test-suite]: #regenerating-a-test-suite
[#ruby-icon]: #ruby-icon
[#running-the-tests]: #running-the-tests
[rubocop]: http://batsov.com/rubocop/
[#setup]: #setup
[#style-guide]: #style-guide
[synchronize]: https://help.github.com/articles/syncing-a-fork/
[tests-workflow-badge]: https://github.com/exercism/ruby/actions/workflows/exercise-tests.yml/badge.svg
[tests-workflow]: https://github.com/exercism/ruby/actions/workflows/exercise-tests.yml
