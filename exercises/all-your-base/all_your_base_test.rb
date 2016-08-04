gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'all_your_base'

class AllYourBaseTest < Minitest::Test
  def test_single_bit_to_one_decimal
    digits = [1]
    input_base = 2
    output_base = 10
    expected = [1]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_binary_to_single_decimal
    skip
    digits = [1, 0, 1]
    input_base = 2
    output_base = 10
    expected = [5]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_single_decimal_to_binary
    skip
    digits = [5]
    input_base = 10
    output_base = 2
    expected = [1, 0, 1]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_binary_to_multiple_decimal
    skip
    digits = [1, 0, 1, 0, 1, 0]
    input_base = 2
    output_base = 10
    expected = [4, 2]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_decimal_to_binary
    skip
    digits = [4, 2]
    input_base = 10
    output_base = 2
    expected = [1, 0, 1, 0, 1, 0]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_trinary_to_hexadecimal
    skip
    digits = [1, 1, 2, 0]
    input_base = 3
    output_base = 16
    expected = [2, 10]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_hexadecimal_to_trinary
    skip
    digits = [2, 10]
    input_base = 16
    output_base = 3
    expected = [1, 1, 2, 0]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_15_bit_integer
    skip
    digits = [3, 46, 60]
    input_base = 97
    output_base = 73
    expected = [6, 10, 45]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_empty_list
    skip
    digits = []
    input_base = 2
    output_base = 10
    expected = []

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_single_zero
    skip
    digits = [0]
    input_base  = 10
    output_base = 2
    expected = [0]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_multiple_zeroes
    skip
    digits = [0, 0, 0]
    input_base  = 10
    output_base = 2
    expected = [0]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_leading_zeros
    skip
    digits = [0, 6, 0]
    input_base = 7
    output_base = 10
    expected = [4, 2]

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_negative_digit
    skip
    digits = [1, -1, 1, 0, 1, 0]
    input_base = 2
    output_base = 10
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_invalid_positive_digit
    skip
    digits = [1, 2, 1, 0, 1, 0]
    input_base = 2
    output_base = 10
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_first_base_is_one
    skip
    digits = []
    input_base = 1
    output_base = 10
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_second_base_is_one
    skip
    digits = [1, 0, 1, 0, 1, 0]
    input_base = 2
    output_base = 1
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_first_base_is_zero
    skip
    digits = []
    input_base = 0
    output_base = 10
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_second_base_is_zero
    skip
    digits = [7]
    input_base = 10
    output_base = 0
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_first_base_is_negative
    skip
    digits = [1]
    input_base = -2
    output_base = 10
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_second_base_is_negative
    skip
    digits = [1]
    input_base = 2
    output_base = -7
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_both_bases_are_negative
    skip
    digits = [1]
    input_base = -2
    output_base = -7
    expected = nil

    converted = BaseConverter.convert(input_base, digits, output_base)

    assert_equal expected, converted,
                 "Input base: #{input_base}, output base #{output_base}. " \
                 "Expected #{expected} but got #{converted}."
  end

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
