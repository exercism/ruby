gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'example'

class IsogramTest < Minitest::Test

  def test_true_isogram
    assert_equal true, Isogram.new("isogram").check_for_isogram
  end

  def test_false_isogram
    assert_equal false, Isogram.new("isograms").check_for_isogram
  end

  def test_bookkeeping
    assert_equal 1, BracketPush::VERSION
  end

end