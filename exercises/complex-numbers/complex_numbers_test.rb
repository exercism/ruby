require 'minitest/autorun'
require_relative 'complex_numbers'

# Common test data version: 1.0.0 '117d062'
class ComplexNumbersTest < Minitest::Test
  def test_imaginary_unit
    # #skip
    expected = ComplexNumber.new([-1, 0])
    assert_equal expected, ComplexNumber.new([0, 1]) * ComplexNumber.new([0, 1])
  end

  def test_add_purely_real_numbers
    #skip
    expected = ComplexNumber.new([3, 0])
    assert_equal expected, ComplexNumber.new([1, 0]) + ComplexNumber.new([2, 0])
  end

  def test_add_purely_imaginary_numbers
    #skip
    expected = ComplexNumber.new([0, 3])
    assert_equal expected, ComplexNumber.new([0, 1]) + ComplexNumber.new([0, 2])
  end

  def test_add_numbers_with_real_and_imaginary_part
    #skip
    expected = ComplexNumber.new([4, 6])
    assert_equal expected, ComplexNumber.new([1, 2]) + ComplexNumber.new([3, 4])
  end

  def test_subtract_purely_real_numbers
    #skip
    expected = ComplexNumber.new([-1, 0])
    assert_equal expected, ComplexNumber.new([1, 0]) - ComplexNumber.new([2, 0])
  end

  def test_subtract_purely_imaginary_numbers
    #skip
    expected = ComplexNumber.new([0, -1])
    assert_equal expected, ComplexNumber.new([0, 1]) - ComplexNumber.new([0, 2])
  end

  def test_subtract_numbers_with_real_and_imaginary_part
    #skip
    expected = ComplexNumber.new([-2, -2])
    assert_equal expected, ComplexNumber.new([1, 2]) - ComplexNumber.new([3, 4])
  end

  def test_multiply_purely_real_numbers
    #skip
    expected = ComplexNumber.new([2, 0])
    assert_equal expected, ComplexNumber.new([1, 0]) * ComplexNumber.new([2, 0])
  end

  def test_multiply_purely_imaginary_numbers
    #skip
    expected = ComplexNumber.new([-2, 0])
    assert_equal expected, ComplexNumber.new([0, 1]) * ComplexNumber.new([0, 2])
  end

  def test_multiply_numbers_with_real_and_imaginary_part
    #skip
    expected = ComplexNumber.new([-5, 10])
    assert_equal expected, ComplexNumber.new([1, 2]) * ComplexNumber.new([3, 4])
  end

  def test_divide_purely_real_numbers
    #skip
    expected = ComplexNumber.new([0.5, 0])
    assert_equal expected, ComplexNumber.new([1, 0]) / ComplexNumber.new([2, 0])
  end

  def test_divide_purely_imaginary_numbers
    #skip
    expected = ComplexNumber.new([0.5, 0])
    assert_equal expected, ComplexNumber.new([0, 1]) / ComplexNumber.new([0, 2])
  end

  def test_divide_numbers_with_real_and_imaginary_part
    #skip
    expected = ComplexNumber.new([0.44, 0.08])
    assert_equal expected, ComplexNumber.new([1, 2]) / ComplexNumber.new([3, 4])
  end

  def test_absolute_value_of_a_positive_purely_real_number
    #skip
    expected = ComplexNumber.new([5])
    assert_equal expected, ComplexNumber.new([5, 0]).abs
  end

  def test_absolute_value_of_a_negative_purely_real_number
    #skip
    expected = ComplexNumber.new([5])
    assert_equal expected, ComplexNumber.new([-5, 0]).abs
  end

  def test_absolute_value_of_a_purely_imaginary_number_with_positive_imaginary_part
    #skip
    expected = ComplexNumber.new([5])
    assert_equal expected, ComplexNumber.new([0, 5]).abs
  end

  def test_absolute_value_of_a_purely_imaginary_number_with_negative_imaginary_part
    #skip
    expected = ComplexNumber.new([5])
    assert_equal expected, ComplexNumber.new([0, -5]).abs
  end

  def test_absolute_value_of_a_number_with_real_and_imaginary_part
    #skip
    expected = ComplexNumber.new([5])
    assert_equal expected, ComplexNumber.new([3, 4]).abs
  end

  def test_conjugate_a_purely_real_number
    #skip
    expected = ComplexNumber.new([5, 0])
    assert_equal expected, ComplexNumber.new([5, 0]).conjugate
  end

  def test_conjugate_a_purely_imaginary_number
    #skip
    expected = ComplexNumber.new([0, -5])
    assert_equal expected, ComplexNumber.new([0, 5]).conjugate
  end

  def test_conjugate_a_number_with_real_and_imaginary_part
    #skip
    expected = ComplexNumber.new([1, -1])
    assert_equal expected, ComplexNumber.new([1, 1]).conjugate
  end

  def test_real_part_of_a_purely_real_number
    #skip
    expected = ComplexNumber.new([1])
    assert_equal expected, ComplexNumber.new([1, 0]).real
  end

  def test_real_part_of_a_purely_imaginary_number
    #skip
    expected = ComplexNumber.new([0])
    assert_equal expected, ComplexNumber.new([0, 1]).real
  end

  def test_real_part_of_a_number_with_real_and_imaginary_part
    #skip
    expected = ComplexNumber.new([1])
    assert_equal expected, ComplexNumber.new([1, 2]).real
  end

  def test_imaginary_part_of_a_purely_real_number
    #skip
    expected = ComplexNumber.new([0])
    assert_equal expected, ComplexNumber.new([1, 0]).imaginary
  end

  def test_imaginary_part_of_a_purely_imaginary_number
    #skip
    expected = ComplexNumber.new([1])
    assert_equal expected, ComplexNumber.new([0, 1]).imaginary
  end

  def test_imaginary_part_of_a_number_with_real_and_imaginary_part
    #skip
    expected = ComplexNumber.new([2])
    assert_equal expected, ComplexNumber.new([1, 2]).imaginary
  end

  def test_eulers_identityformula
    #skip
    expected = ComplexNumber.new([-1, 0])
    assert_equal expected, ComplexNumber.new([0, Math::PI]).exp
  end

  def test_exponential_of_0
    #skip
    expected = ComplexNumber.new([1, 0])
    assert_equal expected, ComplexNumber.new([0, 0]).exp
  end

  def test_exponential_of_a_purely_real_number
    #skip
    expected = ComplexNumber.new([Math::E, 0])
    assert_equal expected, ComplexNumber.new([1, 0]).exp
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
    #skip
    assert_equal 1, BookKeeping::VERSION
  end
end
