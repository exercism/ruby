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

If you find an `example.tt` file in a problem directory, then the test suite is
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

The `$PROBLEM/$PROBLEM_test.rb` will never be edited directly.

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

Changes that don't have to do directly with the test inputs and outputs, will either need to be
made to `exercises/$PROBLEM/example.tt` or `lib/$PROBLEM_cases.rb`. Then you can regenerate the
exercise with `bin/generate $PROBLEM`.

#### Implementing a Generator

You will need to implement three files to create a generator:

1. `exercises/$PROBLEM/example.tt` - the Erb template for the test file, `$PROBLEM_test.rb`.
1. `exercises/$PROBLEM/.meta/.version` - used to keep track of the version of the test files as the data changes.
1. `lib/$PROBLEM_cases.rb` - the logic for turning the data into tests.

You will not need to touch the top-level script, `bin/generate`.

The `bin/generate` command relies on some common logic implemented in `lib/generator.rb`.
You probably won't need to touch that, either.

The `lib/$PROBLEM_cases.rb` file should contain a small class that wraps the JSON for a single test case:

```
require 'exercise_cases'

class ProblemNameCase < OpenStruct
  def name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def workload
    # Example workload:
    "assert #{expected.inspect}, Problem.call(#{input.inspect})"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end
```

Instead of `ProblemName` use the name of the actual problem. This is important, since
the generator script will infer the name of the class from the argument that is passed.

This class must implement the following methods:

- `name` - Returns the name of the test (i.e `test_one_equals_one`)
- `workload` - Returns the main syntax for the test. This includes the assertion and any setup required for the test.  This will vary depending on the test generator and its underlying implementation
- `skipped` - Returns skip syntax (i.e. `skip` or `# skip`)

Beyond that, you can implement any helper methods that you need.

Below this class, implement a small loop that will generate all the test cases by reading the
`canonical-data.json` file, and looping through the test cases.

You will need to adjust the logic to match the structure of the canonical data.

For example, if there is a single top-level key named "cases", then you can loop through
them as follows:

```
ProblemNameCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    ProblemNameCase.new(row.merge('index' => i))
  end
end
```

If there are multiple sections, then you will need to loop through the sections, and then
loop through each of the cases in an inner loop:

```
ProblemNameCases = proc do |data|
  json = JSON.parse(data)
  cases = []
  %w(section1 section2 etc).each do |section|
    json[section]['cases'].each do |row|
      row = row.merge(row.merge('index' => cases.size, 'section' => section))
      cases << ProblemNameCase.new(row)
    end
  end
  cases
end
```

Finally, you need to create a text template, `example.tt`, as the bases for the test suite.

Start with the following boilerplate, and adjust as necessary:

```
#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative '$PROBLEM'

# Common test data version: <%= abbreviated_commit_hash %>
class ProblemNameTest < Minitest::Test
<% test_cases.each do |test_case| %>
  def <%= test_case.name %>
    <%= test_case.skipped %>
    <%= test_case.workload %>
  end

<% end %>
<%= IO.read(XRUBY_LIB + '/bookkeeping.md') %>
  def test_bookkeeping
    skip
    assert_equal <%= version %>, BookKeeping::VERSION
  end
end
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
