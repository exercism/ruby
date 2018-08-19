require 'minitest/autorun'
require_relative 'complex_numbers'

# Common test data version: 1.0.0 '117d062'
class ComplexNumberTest < Minitest::Test
  def test_imaginary_unit
    # skip
    expected = ComplexNumber.new(-1, 0)
    assert_equal expected, ComplexNumber.new(0, 1) * ComplexNumber.new(0, 1)
  end

  def test_add_purely_real_numbers
    skip
    expected = ComplexNumber.new(3, 0)
    assert_equal expected, ComplexNumber.new(1, 0) + ComplexNumber.new(2, 0)
  end

  def test_add_purely_imaginary_numbers
    skip
    expected = ComplexNumber.new(0, 3)
    assert_equal expected, ComplexNumber.new(0, 1) + ComplexNumber.new(0, 2)
  end

  def test_add_numbers_with_real_and_imaginary_part
    skip
    expected = ComplexNumber.new(4, 6)
    assert_equal expected, ComplexNumber.new(1, 2) + ComplexNumber.new(3, 4)
  end

  def test_subtract_purely_real_numbers
    skip
    expected = ComplexNumber.new(-1, 0)
    assert_equal expected, ComplexNumber.new(1, 0) - ComplexNumber.new(2, 0)
  end

  def test_subtract_purely_imaginary_numbers
    skip
    expected = ComplexNumber.new(0, -1)
    assert_equal expected, ComplexNumber.new(0, 1) - ComplexNumber.new(0, 2)
  end

  def test_subtract_numbers_with_real_and_imaginary_part
    skip
    expected = ComplexNumber.new(-2, -2)
    assert_equal expected, ComplexNumber.new(1, 2) - ComplexNumber.new(3, 4)
  end

  def test_multiply_purely_real_numbers
    skip
    expected = ComplexNumber.new(2, 0)
    assert_equal expected, ComplexNumber.new(1, 0) * ComplexNumber.new(2, 0)
  end

  def test_multiply_purely_imaginary_numbers
    skip
    expected = ComplexNumber.new(-2, 0)
    assert_equal expected, ComplexNumber.new(0, 1) * ComplexNumber.new(0, 2)
  end

  def test_multiply_numbers_with_real_and_imaginary_part
    skip
    expected = ComplexNumber.new(-5, 10)
    assert_equal expected, ComplexNumber.new(1, 2) * ComplexNumber.new(3, 4)
  end

  def test_divide_purely_real_numbers
    skip
    expected = ComplexNumber.new(0.5, 0)
    assert_equal expected, ComplexNumber.new(1, 0) / ComplexNumber.new(2, 0)
  end

  def test_divide_purely_imaginary_numbers
    skip
    expected = ComplexNumber.new(0.5, 0)
    assert_equal expected, ComplexNumber.new(0, 1) / ComplexNumber.new(0, 2)
  end

  def test_divide_numbers_with_real_and_imaginary_part
    skip
    expected = ComplexNumber.new(0.44, 0.08)
    assert_equal expected, ComplexNumber.new(1, 2) / ComplexNumber.new(3, 4)
  end

  def test_absolute_value_of_a_positive_purely_real_number
    skip
    expected = 5
    assert_equal expected, ComplexNumber.new(5, 0).abs
  end

  def test_absolute_value_of_a_negative_purely_real_number
    skip
    expected = 5
    assert_equal expected, ComplexNumber.new(-5, 0).abs
  end

  def test_absolute_value_of_a_purely_imaginary_number_with_positive_imaginary_part
    skip
    expected = 5
    assert_equal expected, ComplexNumber.new(0, 5).abs
  end

  def test_absolute_value_of_a_purely_imaginary_number_with_negative_imaginary_part
    skip
    expected = 5
    assert_equal expected, ComplexNumber.new(0, -5).abs
  end

  def test_absolute_value_of_a_number_with_real_and_imaginary_part
    skip
    expected = 5
    assert_equal expected, ComplexNumber.new(3, 4).abs
  end

  def test_conjugate_a_purely_real_number
    skip
    expected = ComplexNumber.new(5, 0)
    assert_equal expected, ComplexNumber.new(5, 0).conjugate
  end

  def test_conjugate_a_purely_imaginary_number
    skip
    expected = ComplexNumber.new(0, -5)
    assert_equal expected, ComplexNumber.new(0, 5).conjugate
  end

  def test_conjugate_a_number_with_real_and_imaginary_part
    skip
    expected = ComplexNumber.new(1, -1)
    assert_equal expected, ComplexNumber.new(1, 1).conjugate
  end

  def test_real_part_of_a_purely_real_number
    skip
    expected = 1
    assert_equal expected, ComplexNumber.new(1, 0).real
  end

  def test_real_part_of_a_purely_imaginary_number
    skip
    expected = 0
    assert_equal expected, ComplexNumber.new(0, 1).real
  end

  def test_real_part_of_a_number_with_real_and_imaginary_part
    skip
    expected = 1
    assert_equal expected, ComplexNumber.new(1, 2).real
  end

  def test_imaginary_part_of_a_purely_real_number
    skip
    expected = 0
    assert_equal expected, ComplexNumber.new(1, 0).imaginary
  end

  def test_imaginary_part_of_a_purely_imaginary_number
    skip
    expected = 1
    assert_equal expected, ComplexNumber.new(0, 1).imaginary
  end

  def test_imaginary_part_of_a_number_with_real_and_imaginary_part
    skip
    expected = 2
    assert_equal expected, ComplexNumber.new(1, 2).imaginary
  end

  def test_eulers_identityformula
    skip
    expected = ComplexNumber.new(-1, 0)
    assert_equal expected, ComplexNumber.new(0, Math::PI).exp
  end

  def test_exponential_of_0
    skip
    expected = ComplexNumber.new(1, 0)
    assert_equal expected, ComplexNumber.new(0, 0).exp
  end

  def test_exponential_of_a_purely_real_number
    skip
    expected = ComplexNumber.new(Math::E, 0)
    assert_equal expected, ComplexNumber.new(1, 0).exp
  end
end
