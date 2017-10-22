require 'minitest/autorun'
require_relative 'sum_of_multiples'

# Common test data version: 1.1.0 df076b2
class SumOfMultiplesTest < Minitest::Test
  def test_multiples_of_3_or_5_up_to_1
    # skip
    assert_equal 0, SumOfMultiples.new(3, 5).to(1)
  end

  def test_multiples_of_3_or_5_up_to_4
    skip
    assert_equal 3, SumOfMultiples.new(3, 5).to(4)
  end

  def test_multiples_of_3_up_to_7
    skip
    assert_equal 9, SumOfMultiples.new(3).to(7)
  end

  def test_multiples_of_3_or_5_up_to_10
    skip
    assert_equal 23, SumOfMultiples.new(3, 5).to(10)
  end

  def test_multiples_of_3_or_5_up_to_100
    skip
    assert_equal 2_318, SumOfMultiples.new(3, 5).to(100)
  end

  def test_multiples_of_3_or_5_up_to_1000
    skip
    assert_equal 233_168, SumOfMultiples.new(3, 5).to(1000)
  end

  def test_multiples_of_7_13_or_17_up_to_20
    skip
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_multiples_of_4_or_6_up_to_15
    skip
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_multiples_of_5_6_or_8_up_to_150
    skip
    assert_equal 4_419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_multiples_of_5_or_25_up_to_51
    skip
    assert_equal 275, SumOfMultiples.new(5, 25).to(51)
  end

  def test_multiples_of_43_or_47_up_to_10000
    skip
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10000)
  end

  def test_multiples_of_1_up_to_100
    skip
    assert_equal 4_950, SumOfMultiples.new(1).to(100)
  end

  def test_multiples_of_an_empty_list_up_to_10000
    skip
    assert_equal 0, SumOfMultiples.new().to(10000)
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
