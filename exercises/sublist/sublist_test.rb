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








  # def test_bookkeeping
  #   assert_equal 1, BracketPush::VERSION
  # end
end