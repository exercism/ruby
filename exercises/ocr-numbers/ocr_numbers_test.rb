#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'ocr_numbers'

# Common test data version: 1.0.0 80782b6
class OcrNumbersTest < Minitest::Test
  def test_recognizes_0
    # skip
    assert_equal "0", OcrNumbers.convert(" _ \n| |\n|_|\n   ")
  end

  def test_recognizes_1
    skip
    assert_equal "1", OcrNumbers.convert("   \n  |\n  |\n   ")
  end

  def test_unreadable_but_correctly_sized_inputs_return_?
    skip
    assert_equal "?", OcrNumbers.convert("   \n  _\n  |\n   ")
  end

  def test_input_with_a_number_of_lines_that_is_not_a_multiple_of_four_raises_an_error
    skip
    assert_raises(ArgumentError) { OcrNumbers.convert(" _ \n| |\n   ") }
  end

  def test_input_with_a_number_of_columns_that_is_not_a_multiple_of_three_raises_an_error
    skip
    assert_raises(ArgumentError) { OcrNumbers.convert("    \n   |\n   |\n    ") }
  end

  def test_recognizes_110101100
    skip
    assert_equal "110101100", OcrNumbers.convert("       _     _        _  _ \n  |  || |  || |  |  || || |\n  |  ||_|  ||_|  |  ||_||_|\n                           ")
  end

  def test_garbled_numbers_in_a_string_are_replaced_with_?
    skip
    assert_equal "11?10?1?0", OcrNumbers.convert("       _     _           _ \n  |  || |  || |     || || |\n  |  | _|  ||_|  |  ||_||_|\n                           ")
  end

  def test_recognizes_2
    skip
    assert_equal "2", OcrNumbers.convert(" _ \n _|\n|_ \n   ")
  end

  def test_recognizes_3
    skip
    assert_equal "3", OcrNumbers.convert(" _ \n _|\n _|\n   ")
  end

  def test_recognizes_4
    skip
    assert_equal "4", OcrNumbers.convert("   \n|_|\n  |\n   ")
  end

  def test_recognizes_5
    skip
    assert_equal "5", OcrNumbers.convert(" _ \n|_ \n _|\n   ")
  end

  def test_recognizes_6
    skip
    assert_equal "6", OcrNumbers.convert(" _ \n|_ \n|_|\n   ")
  end

  def test_recognizes_7
    skip
    assert_equal "7", OcrNumbers.convert(" _ \n  |\n  |\n   ")
  end

  def test_recognizes_8
    skip
    assert_equal "8", OcrNumbers.convert(" _ \n|_|\n|_|\n   ")
  end

  def test_recognizes_9
    skip
    assert_equal "9", OcrNumbers.convert(" _ \n|_|\n _|\n   ")
  end

  def test_recognizes_string_of_decimal_numbers
    skip
    assert_equal "1234567890", OcrNumbers.convert("    _  _     _  _  _  _  _  _ \n  | _| _||_||_ |_   ||_||_|| |\n  ||_  _|  | _||_|  ||_| _||_|\n                              ")
  end

  def test_numbers_separated_by_empty_lines_are_recognized_lines_are_joined_by_commas
    skip
    assert_equal "123,456,789", OcrNumbers.convert("    _  _ \n  | _| _|\n  ||_  _|\n         \n    _  _ \n|_||_ |_ \n  | _||_|\n         \n _  _  _ \n  ||_||_|\n  ||_| _|\n         ")
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
    assert_equal 1, BookKeeping::VERSION
  end
end
