require 'minitest/autorun'
begin
  require_relative 'hello_world'
rescue LoadError => e
  puts "\n\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class HelloWorldTest < Minitest::Test
  def test_no_name
    assert_equal 'Hello, world!', HelloWorld.hello, 'When giving no name, we should greet the world!'
  end

  def test_sample_name
    skip
    assert_equal 'Hello, Alice!', HelloWorld.hello('Alice'), 'When giving "Alice" we should greet Alice!'
  end

  def test_other_sample_name
    skip
    assert_equal 'Hello, Bob!', HelloWorld.hello('Bob'), 'When giving "Bob" we should greet Bob!'
  end

  def test_no_strange_name
    skip
    assert_equal 'Hello, !', HelloWorld.hello(''), 'When giving an empty string, it is strange, but should have a space and punctuation'
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
