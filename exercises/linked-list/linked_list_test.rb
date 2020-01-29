require 'minitest/autorun'
require_relative 'linked_list'

class DequeTest < Minitest::Test
  def test_push_pop
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    assert_equal 20, deque.pop
    assert_equal 10, deque.pop
  end

  def test_push_shift
    skip
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    assert_equal 10, deque.shift
    assert_equal 20, deque.shift
  end

  def test_unshift_shift
    skip
    deque = Deque.new
    deque.unshift(10)
    deque.unshift(20)
    assert_equal 20, deque.shift
    assert_equal 10, deque.shift
  end

  def test_unshift_pop
    skip
    deque = Deque.new
    deque.unshift(10)
    deque.unshift(20)
    assert_equal 10, deque.pop
    assert_equal 20, deque.pop
  end

  def test_example
    skip
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    assert_equal 20, deque.pop
    deque.push(30)
    assert_equal 10, deque.shift
    deque.unshift(40)
    deque.push(50)
    assert_equal 40, deque.shift
    assert_equal 50, deque.pop
    assert_equal 30, deque.shift
  end

  def test_pop_to_empty
    skip
    deque = Deque.new
    deque.push(10)
    assert_equal 10, deque.pop
    deque.push(20)
    assert_equal 20, deque.shift
  end

  def test_shift_to_empty
    skip
    deque = Deque.new
    deque.unshift(10)
    assert_equal 10, deque.shift
    deque.unshift(20)
    assert_equal 20, deque.pop
  end
end
