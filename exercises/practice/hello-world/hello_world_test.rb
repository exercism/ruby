require 'minitest/autorun'
require_relative 'hello_world'

class HelloWorldTest < Minitest::Test
  def test_say_hi
    # skip
    assert_equal "Hello, World!", HelloWorld.hello
  end
end

__END__

*****************************************************
You got an error, which is exactly as it should be.
This is the first step in the Test-Driven Development
(TDD) process.

The most important part of the error is

   cannot load such file

It's looking for a file named hello_world.rb that doesn't
exist yet.

To fix the error, create an empty file named hello_world.rb
in the same directory as the hello_world_test.rb file.

Then run the test again.

For more guidance as you work on this exercise, see
GETTING_STARTED.md.
*****************************************************
