# xRuby

Exercism Exercises in Ruby

## Setup

You'll need a recent (1.9.3+) version of Ruby, but that's it. Minitest ships
with the language, so you're all set.

## Working on Problems

Each problem should have a test suite and an example solution.
The example solution should be named `example.rb`.

Run the test with `ruby path/to/the_test.rb`.

At the moment the Ruby problems `skip` all but the first test, in order to not
overwhelm people with errors.

If you want to temporarily disable the skips while working on a problem, you can
define an empty `skip` method in the test suite:

```ruby
def skip
end
```

Just remember to delete it before submitting the problem.

## Pull Requests

We welcome pull requests that provide fixes to existing problems (missing
tests, interesting edge cases, improved APIs), as well as new problems.

If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the
change.

Please submit changes to a single problem per pull request unless you're
submitting a general change across many of the problems (e.g. formatting).

Thank you so much for contributing! :sparkles:

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
