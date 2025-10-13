require 'minitest/autorun'
require_relative 'ocr_numbers'

class OcrNumbersTest < Minitest::Test
  def test_recognizes_0
    # skip
    input = [' _ ',
             '| |',
             '|_|',
             '   '].join("\n")
    expected = '0'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_1
    skip
    input = ['   ',
             '  |',
             '  |',
             '   '].join("\n")
    expected = '1'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_unreadable_but_correctly_sized_inputs_return_
    skip
    input = ['   ',
             '  _',
             '  |',
             '   '].join("\n")
    expected = '?'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_input_with_a_number_of_lines_that_is_not_a_multiple_of_four_raises_an_error
    skip
    input = [' _ ',
             '| |',
             '   '].join("\n")
    assert_raises(ArgumentError) do
      OcrNumbers.convert(input)
    end
  end

  def test_input_with_a_number_of_columns_that_is_not_a_multiple_of_three_raises_an_error
    skip
    input = ['    ',
             '   |',
             '   |',
             '    '].join("\n")
    assert_raises(ArgumentError) do
      OcrNumbers.convert(input)
    end
  end

  def test_recognizes_110101100
    skip
    input = ['       _     _        _  _ ',
             '  |  || |  || |  |  || || |',
             '  |  ||_|  ||_|  |  ||_||_|',
             '                           '].join("\n")
    expected = '110101100'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_garbled_numbers_in_a_string_are_replaced_with_
    skip
    input = ['       _     _           _ ',
             '  |  || |  || |     || || |',
             '  |  | _|  ||_|  |  ||_||_|',
             '                           '].join("\n")
    expected = '11?10?1?0'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_2
    skip
    input = [' _ ',
             ' _|',
             '|_ ',
             '   '].join("\n")
    expected = '2'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_3
    skip
    input = [' _ ',
             ' _|',
             ' _|',
             '   '].join("\n")
    expected = '3'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_4
    skip
    input = ['   ',
             '|_|',
             '  |',
             '   '].join("\n")
    expected = '4'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_5
    skip
    input = [' _ ',
             '|_ ',
             ' _|',
             '   '].join("\n")
    expected = '5'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_6
    skip
    input = [' _ ',
             '|_ ',
             '|_|',
             '   '].join("\n")
    expected = '6'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_7
    skip
    input = [' _ ',
             '  |',
             '  |',
             '   '].join("\n")
    expected = '7'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_8
    skip
    input = [' _ ',
             '|_|',
             '|_|',
             '   '].join("\n")
    expected = '8'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_9
    skip
    input = [' _ ',
             '|_|',
             ' _|',
             '   '].join("\n")
    expected = '9'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_recognizes_string_of_decimal_numbers
    skip
    input = ['    _  _     _  _  _  _  _  _ ',
             '  | _| _||_||_ |_   ||_||_|| |',
             '  ||_  _|  | _||_|  ||_| _||_|',
             '                              '].join("\n")
    expected = '1234567890'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end

  def test_numbers_separated_by_empty_lines_are_recognized_lines_are_joined_by_commas
    skip
    input = ['    _  _ ',
             '  | _| _|',
             '  ||_  _|',
             '         ',
             '    _  _ ',
             '|_||_ |_ ',
             '  | _||_|',
             '         ',
             ' _  _  _ ',
             '  ||_||_|',
             '  ||_| _|',
             '         '].join("\n")
    expected = '123,456,789'
    actual = OcrNumbers.convert(input)
    assert_equal expected, actual
  end
end
