#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'dominoes'

# Test data version:
# 08a0cda
class DominoesTest < Minitest::Test
  def test_empty_input
    skip
    expect = true
    actual = Dominoes.new.can_chain?([])
    assert_equal(expect, actual)
  end

  def test_singleton_input_chainable
    skip
    expect = true
    actual = Dominoes.new.can_chain?([[1, 1]])
    assert_equal(expect, actual)
  end

  def test_singleton_input_not_chainable
    skip
    expect = false
    actual = Dominoes.new.can_chain?([[1, 2]])
    assert_equal(expect, actual)
  end

  def test_three_elements
    skip
    expect = true
    actual = Dominoes.new.can_chain?([[1, 2], [3, 1], [2, 3]])
    assert_equal(expect, actual)
  end

  def test_can_reverse_dominoes
    skip
    expect = true
    actual = Dominoes.new.can_chain?([[1, 2], [1, 3], [2, 3]])
    assert_equal(expect, actual)
  end

  def test_cant_be_chained
    skip
    expect = false
    actual = Dominoes.new.can_chain?([[1, 2], [4, 1], [2, 3]])
    assert_equal(expect, actual)
  end

  def disconnected_simple
    skip
    expect = false
    actual = Dominoes.new.can_chain?([[1, 1], [2, 2]])
    assert_equal(expect, actual)
  end

  def disconnected_double_loop
    skip
    expect = false
    actual = Dominoes.new.can_chain?([[1, 2], [2, 1], [3, 4], [4, 3]])
    assert_equal(expect, actual)
  end

  def disconnected_single_isolated
    skip
    expect = false
    actual = Dominoes.new.can_chain?([[1, 2], [2, 1], [3, 4], [4, 3]])
    assert_equal(expect, actual)
  end

  def need_backtrack
    skip
    expect = true
    actual = Dominoes.new.can_chain?([[1, 2], [2, 1], [3, 4], [4, 3]])
    assert_equal(expect, actual)
  end

  def 
    
    expect = 
    actual = 
    assert_equal(expect, actual)
  end

  def 
    
    expect = 
    actual = 
    assert_equal(expect, actual)
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 2, BookKeeping::VERSION
  end
end
