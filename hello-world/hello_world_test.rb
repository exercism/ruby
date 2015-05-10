require 'minitest/autorun'
require_relative 'hello_world'
class HelloWorldTest < Minitest::Test
  def test_no_name
    assert_equal 'Hello, world!', HelloWorld.hello(''), 'Greeting given no name'
  end

  def test_sample_name
    assert_equal 'Hello, Alice!', HelloWorld.hello('Alice'), 'Greeting given the name "Alice"'
  end

  def test_other_sample_name
    assert_equal 'Hello, Bob!', HelloWorld.hello('Bob'), 'Greeting given the name "Bob"'
  end
end
