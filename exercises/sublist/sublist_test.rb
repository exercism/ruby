gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'sublist'

class SublistTest < Minitest::Test
  SUBLIST = 0
  SUPERLIST = 1
  EQUAL = 2
  UNEQUAL = 3

  def test_empty_lists
    assert_equal EQUAL, Sublist.new.check_lists([],[])
  end

  def test_empty_list_within
    assert_equal SUBLIST, Sublist.new.check_lists([], [1,2,3])
  end

  def test_within_empty_list
    assert_equal SUPERLIST, Sublist.new.check_lists([1,2,3], [])
  end

  def test_list_equals_itself
    assert_equal EQUAL, Sublist.new.check_lists([1,2,3], [1,2,3])
  end

  def test_different_lists
    assert_equal UNEQUAL, Sublist.new.check_lists([1,2,3], [2,3,4])
  end

  def test_consecutive
    assert_equal SUBLIST, Sublist.new.check_lists([1, 1, 2], [0, 1, 1, 1, 2, 1, 2])
  end





  # def test_bookkeeping
  #   assert_equal 1, BracketPush::VERSION
  # end
end