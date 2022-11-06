require 'minitest/autorun'
require_relative 'complex_numbers'

class ComplexNumbersTest < Minitest::Test
  def test_real_part_real_part_of_a_purely_real_number
    # skip
    assert_equal 1, ComplexNumber.new(1, 0).real
  end

  def test_real_part_real_part_of_a_purely_imaginary_number
    skip
    assert_equal 0, ComplexNumber.new(0, 1).real
  end

  def test_real_part_real_part_of_a_number_with_real_and_imaginary_part
    skip
    assert_equal 1, ComplexNumber.new(1, 2).real
  end

  def test_imaginary_part_imaginary_part_of_a_purely_real_number
    skip
    assert_equal 0, ComplexNumber.new(1, 0).imaginary
  end

  def test_imaginary_part_imaginary_part_of_a_purely_imaginary_number
    skip
    assert_equal 1, ComplexNumber.new(0, 1).imaginary
  end

  def test_imaginary_part_imaginary_part_of_a_number_with_real_and_imaginary_part
    skip
    assert_equal 2, ComplexNumber.new(1, 2).imaginary
  end

  def test_imaginary_unit
    skip
    product = ComplexNumber.new(0, 1) * ComplexNumber.new(0, 1)
    assert_equal ComplexNumber.new(-1, 0), product
  end

  def test_arithmetic_addition_add_purely_real_numbers
    skip
    sum = ComplexNumber.new(1, 0) + ComplexNumber.new(2, 0)
    assert_equal ComplexNumber.new(3, 0), sum
  end

  def test_arithmetic_addition_add_purely_imaginary_numbers
    skip
    sum = ComplexNumber.new(0, 1) + ComplexNumber.new(0, 2)
    assert_equal ComplexNumber.new(0, 3), sum
  end

  def test_arithmetic_addition_add_numbers_with_real_and_imaginary_part
    skip
    sum = ComplexNumber.new(1, 2) + ComplexNumber.new(3, 4)
    assert_equal ComplexNumber.new(4, 6), sum
  end

  def test_arithmetic_subtraction_subtract_purely_real_numbers
    skip
    difference = ComplexNumber.new(1, 0) - ComplexNumber.new(2, 0)
    assert_equal ComplexNumber.new(-1, 0), difference
  end

  def test_arithmetic_subtraction_subtract_purely_imaginary_numbers
    skip
    difference = ComplexNumber.new(0, 1) - ComplexNumber.new(0, 2)
    assert_equal ComplexNumber.new(0, -1), difference
  end

  def test_arithmetic_subtraction_subtract_numbers_with_real_and_imaginary_part
    skip
    difference = ComplexNumber.new(1, 2) - ComplexNumber.new(3, 4)
    assert_equal ComplexNumber.new(-2, -2), difference
  end

  def test_arithmetic_multiplication_multiply_purely_real_numbers
    skip
    product = ComplexNumber.new(1, 0) * ComplexNumber.new(2, 0)
    assert_equal ComplexNumber.new(2, 0), product
  end

  def test_arithmetic_multiplication_multiply_purely_imaginary_numbers
    skip
    product = ComplexNumber.new(0, 1) * ComplexNumber.new(0, 2)
    assert_equal ComplexNumber.new(-2, 0), product
  end

  def test_arithmetic_multiplication_multiply_numbers_with_real_and_imaginary_part
    skip
    product = ComplexNumber.new(1, 2) * ComplexNumber.new(3, 4)
    assert_equal ComplexNumber.new(-5, 10), product
  end

  def test_arithmetic_division_divide_purely_real_numbers
    skip
    quotient = ComplexNumber.new(1, 0) / ComplexNumber.new(2, 0)
    assert_equal ComplexNumber.new(0.5, 0), quotient
  end

  def test_arithmetic_division_divide_purely_imaginary_numbers
    skip
    quotient = ComplexNumber.new(0, 1) / ComplexNumber.new(0, 2)
    assert_equal ComplexNumber.new(0.5, 0), quotient
  end

  def test_arithmetic_division_divide_numbers_with_real_and_imaginary_part
    skip
    quotient = ComplexNumber.new(1, 2) / ComplexNumber.new(3, 4)
    assert_equal ComplexNumber.new(0.44, 0.08), quotient
  end

  def test_absolute_value_absolute_value_of_a_positive_purely_real_number
    skip
    assert_equal 5, ComplexNumber.new(5, 0).abs
  end

  def test_absolute_value_absolute_value_of_a_negative_purely_real_number
    skip
    assert_equal 5, ComplexNumber.new(-5, 0).abs
  end

  def test_absolute_value_absolute_value_of_a_purely_imaginary_number_with_positive_imaginary_part
    skip
    assert_equal 5, ComplexNumber.new(0, 5).abs
  end

  def test_absolute_value_absolute_value_of_a_purely_imaginary_number_with_negative_imaginary_part
    skip
    assert_equal 5, ComplexNumber.new(0, -5).abs
  end

  def test_absolute_value_absolute_value_of_a_number_with_real_and_imaginary_part
    skip
    assert_equal 5, ComplexNumber.new(3, 4).abs
  end

  def test_complex_conjugate_conjugate_a_purely_real_number
    skip
    assert_equal ComplexNumber.new(5, 0), ComplexNumber.new(5, 0).conjugate
  end

  def test_complex_conjugate_conjugate_a_purely_imaginary_number
    skip
    assert_equal ComplexNumber.new(0, -5), ComplexNumber.new(0, 5).conjugate
  end

  def test_complex_conjugate_conjugate_a_number_with_real_and_imaginary_part
    skip
    assert_equal ComplexNumber.new(1, -1), ComplexNumber.new(1, 1).conjugate
  end

  def test_complex_exponential_function_eulers_identityformula
    skip
    assert_equal ComplexNumber.new(-1, 0), ComplexNumber.new(0, Math::PI).exp
  end

  def test_complex_exponential_function_exponential_of_0
    skip
    assert_equal ComplexNumber.new(1, 0), ComplexNumber.new(0, 0).exp
  end

  def test_complex_exponential_function_exponential_of_a_purely_real_number
    skip
    assert_equal ComplexNumber.new(Math::E, 0), ComplexNumber.new(1, 0).exp
  end

  def test_complex_exponential_function_exponential_of_a_number_with_real_and_imaginary_part
    skip
    assert_equal ComplexNumber.new(-2, 0), ComplexNumber.new(Math.log(2), Math::PI).exp
  end

  def test_complex_exponential_function_exponential_resulting_in_a_number_with_real_and_imaginary_part
    skip
    assert_equal ComplexNumber.new(1, 1), ComplexNumber.new(Math.log(2) / 2, Math::PI / 4).exp
  end

  def test_operations_between_real_numbers_and_complex_numbers_add_real_number_to_complex_number
    skip
    sum = ComplexNumber.new(1, 2) + ComplexNumber.new(5)
    assert_equal ComplexNumber.new(6, 2), sum
  end

  def test_operations_between_real_numbers_and_complex_numbers_add_complex_number_to_real_number
    skip
    sum = ComplexNumber.new(5) + ComplexNumber.new(1, 2)
    assert_equal ComplexNumber.new(6, 2), sum
  end

  def test_operations_between_real_numbers_and_complex_numbers_subtract_real_number_from_complex_number
    skip
    difference = ComplexNumber.new(5, 7) - ComplexNumber.new(4)
    assert_equal ComplexNumber.new(1, 7), difference
  end

  def test_operations_between_real_numbers_and_complex_numbers_subtract_complex_number_from_real_number
    skip
    difference = ComplexNumber.new(4) - ComplexNumber.new(5, 7)
    assert_equal ComplexNumber.new(-1, -7), difference
  end

  def test_operations_between_real_numbers_and_complex_numbers_multiply_complex_number_by_real_number
    skip
    product = ComplexNumber.new(2, 5) * ComplexNumber.new(5)
    assert_equal ComplexNumber.new(10, 25), product
  end

  def test_operations_between_real_numbers_and_complex_numbers_multiply_real_number_by_complex_number
    skip
    product = ComplexNumber.new(5) * ComplexNumber.new(2, 5)
    assert_equal ComplexNumber.new(10, 25), product
  end

  def test_operations_between_real_numbers_and_complex_numbers_divide_complex_number_by_real_number
    skip
    quotient = ComplexNumber.new(10, 100) / ComplexNumber.new(10)
    assert_equal ComplexNumber.new(1, 10), quotient
  end

  def test_operations_between_real_numbers_and_complex_numbers_divide_real_number_by_complex_number
    skip
    quotient = ComplexNumber.new(5) / ComplexNumber.new(1, 1)
    assert_equal ComplexNumber.new(2.5, -2.5), quotient
  end
end
