gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'roman_numerals'

# Common test data version: 1.0.0 070e8d5
class RomanNumeralsTest < Minitest::Test
  def test_1
    assert_equal 'I', Numeric.new(1).to_roman
  end

  def test_2
    assert_equal 'II', Numeric.new(2).to_roman
  end

  def test_3
    assert_equal 'III', Numeric.new(3).to_roman
  end

  def test_4
    assert_equal 'IV', Numeric.new(4).to_roman
  end

  def test_5
    assert_equal 'V', Numeric.new(5).to_roman
  end

  def test_6
    assert_equal 'VI', Numeric.new(6).to_roman
  end

  def test_9
    assert_equal 'IX', Numeric.new(9).to_roman
  end

  def test_27
    assert_equal 'XXVII', Numeric.new(27).to_roman
  end

  def test_48
    assert_equal 'XLVIII', Numeric.new(48).to_roman
  end

  def test_59
    assert_equal 'LIX', Numeric.new(59).to_roman
  end

  def test_93
    assert_equal 'XCIII', Numeric.new(93).to_roman
  end

  def test_141
    assert_equal 'CXLI', Numeric.new(141).to_roman
  end

  def test_163
    assert_equal 'CLXIII', Numeric.new(163).to_roman
  end

  def test_402
    assert_equal 'CDII', Numeric.new(402).to_roman
  end

  def test_575
    assert_equal 'DLXXV', Numeric.new(575).to_roman
  end

  def test_911
    assert_equal 'CMXI', Numeric.new(911).to_roman
  end

  def test_1024
    assert_equal 'MXXIV', Numeric.new(1024).to_roman
  end

  def test_3000
    assert_equal 'MMM', Numeric.new(3000).to_roman
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
    assert_equal 3, BookKeeping::VERSION
  end

end
