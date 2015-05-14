require 'minitest/autorun'
require_relative 'hello_world'
class HelloWorldTest < Minitest::Test
  def test_no_strange_name
    assert_equal 'Hello, !', HelloWorld.hello(''), 'When giving an empty string, it is strange, but should have a space and punctuation'
  end

  def test_no_name
    assert_equal 'Hello, world!', HelloWorld.hello, 'When giving no name, we should greet the world!'
  end

  def test_sample_name
    assert_equal 'Hello, Alice!', HelloWorld.hello('Alice'), 'When giving "Alice" we should greet Alice!'
  end

  def test_other_sample_name
    assert_equal 'Hello, Bob!', HelloWorld.hello('Bob'), 'When giving "Bob" we should greet Bob!'
  end
end
