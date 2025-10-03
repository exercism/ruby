require 'minitest/autorun'
require_relative 'say'

class SayTest < Minitest::Test
  def test_zero
    # skip
    actual = Say.new(0).in_english
    expected = 'zero'
    assert_equal expected, actual
  end

  def test_one
    skip
    actual = Say.new(1).in_english
    expected = 'one'
    assert_equal expected, actual
  end

  def test_fourteen
    skip
    actual = Say.new(14).in_english
    expected = 'fourteen'
    assert_equal expected, actual
  end

  def test_twenty
    skip
    actual = Say.new(20).in_english
    expected = 'twenty'
    assert_equal expected, actual
  end

  def test_twenty_two
    skip
    actual = Say.new(22).in_english
    expected = 'twenty-two'
    assert_equal expected, actual
  end

  def test_thirty
    skip
    actual = Say.new(30).in_english
    expected = 'thirty'
    assert_equal expected, actual
  end

  def test_ninety_nine
    skip
    actual = Say.new(99).in_english
    expected = 'ninety-nine'
    assert_equal expected, actual
  end

  def test_one_hundred
    skip
    actual = Say.new(100).in_english
    expected = 'one hundred'
    assert_equal expected, actual
  end

  def test_one_hundred_twenty_three
    skip
    actual = Say.new(123).in_english
    expected = 'one hundred twenty-three'
    assert_equal expected, actual
  end

  def test_two_hundred
    skip
    actual = Say.new(200).in_english
    expected = 'two hundred'
    assert_equal expected, actual
  end

  def test_nine_hundred_ninety_nine
    skip
    actual = Say.new(999).in_english
    expected = 'nine hundred ninety-nine'
    assert_equal expected, actual
  end

  def test_one_thousand
    skip
    actual = Say.new(1000).in_english
    expected = 'one thousand'
    assert_equal expected, actual
  end

  def test_one_thousand_two_hundred_thirty_four
    skip
    actual = Say.new(1234).in_english
    expected = 'one thousand two hundred thirty-four'
    assert_equal expected, actual
  end

  def test_one_million
    skip
    actual = Say.new(1_000_000).in_english
    expected = 'one million'
    assert_equal expected, actual
  end

  def test_one_million_two_thousand_three_hundred_forty_five
    skip
    actual = Say.new(1_002_345).in_english
    expected = 'one million two thousand three hundred forty-five'
    assert_equal expected, actual
  end

  def test_one_billion
    skip
    actual = Say.new(1_000_000_000).in_english
    expected = 'one billion'
    assert_equal expected, actual
  end

  def test_a_big_number
    skip
    actual = Say.new(987_654_321_123).in_english
    expected = 'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three'
    assert_equal expected, actual
  end

  def test_numbers_below_zero_are_out_of_range
    skip
    number = -1
    assert_raises(ArgumentError) do
      Say.new(number).in_english
    end
  end

  def test_numbers_above_999999999999_are_out_of_range
    skip
    number = 1_000_000_000_000
    assert_raises(ArgumentError) do
      Say.new(number).in_english
    end
  end
end
