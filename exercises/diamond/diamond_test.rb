#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'diamond'

class DiamondTest < Minitest::Test
  def test_letter_A
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_C
    skip
    answer = Diamond.make_diamond("C")
    string = "  A  \n"+
             " B B \n"+
             "C   C\n"+
             " B B \n"+
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_E
    skip
    answer = Diamond.make_diamond("E")
    string = "    A    \n"+
             "   B B   \n"+
             "  C   C  \n"+
             " D     D \n"+
             "E       E\n"+
             " D     D \n"+
             "  C   C  \n"+
             "   B B   \n"+
             "    A    \n"
    assert_equal string, answer
  end

  def test_bookkeeping
    skip
    assert_equal 1, Bookkeeping::VERSION
  end
end