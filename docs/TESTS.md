## Running Tests

Execute the tests with:

```bash
$ ruby hamming_test.rb
```

Only the first test will be executed, all the others have been made pending
using the `skip` method. Delete or comment the next `skip` as you get
each test passing.

## Customizing Test Reporting

If you want color, execute the tests with:

```bash
$ ruby hamming_test.rb -p
```

If you want to see the test names, execute the tests with:

```bash
$ ruby hamming_tests.rb -v
```

If you would like to run only one test, you can specify one or a group
with regular expression style matching.

```bash
$ ruby hamming_tests.rb -n /empty/
```

You can combine the options as well.

## Disabling All The Skips

With your new found powers of being able to select the individual or
groups of tests that you want to run, you may want to disable all the
skips.

### The Quick and Dirty

Taking advantage of the fact that in Ruby methods are overridable, if
you were to add this line of code;

```ruby
def skip ; end
```

like this in the Hamming test file

```ruby
class HammingTest < Minitest::Test
  def skip ; end
  def test_identical_strands
```

then all the skips will still evaluate, yet will let your tests run.

### The Still Quick And Cleaner

Of course, editing all the files through time can be irritating, so you
could do like we did in developing the exercises... make a file that has
the skip definition in it, and require that as a library when we want
it.

We created a `lib` folder to keep our "helper" things in, and it looks
like this:

```ruby
require 'minitest/autorun'
# You can use this to disabe all skips in the current exercise by issuing the
# following command:
#     ruby -I../lib -rdisable_skip <fiename_test.rb>

module Minitest
  class Test
    def skip(_msg='', _bt=caller)
    end
  end
end
```

The description on how to use it is commented in that file listing, and
the file listing is in its complete state.

