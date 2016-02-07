#!/usr/bin/env ruby
# frozen_string_literal: true

gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require 'prime'
ERROR_MESSAGE = <<-MSG.freeze
Using Ruby's Prime class is probably the best way to do this in a
'real' application; but this is an exercise, not a real application,
so you're expected to implement this yourself.
MSG

class Prime
  [:each, :new, :prime?, :take].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end
end

class Integer
  [:prime?, :each_prime].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end
end

require_relative 'nth_prime'

class TestPrimes < Minitest::Test
  def test_first
    assert_equal 2, Prime.nth(1)
  end

  def test_second
    skip
    assert_equal 3, Prime.nth(2)
  end

  def test_sixth_prime
    skip
    assert_equal 13, Prime.nth(6)
  end

  def test_big_prime
    skip
    assert_equal 104_743, Prime.nth(10_001)
  end

  def test_weird_case
    skip
    assert_raises ArgumentError do
      Prime.nth(0)
    end
  end
end
