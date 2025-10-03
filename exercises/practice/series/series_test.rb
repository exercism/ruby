require 'minitest/autorun'
require_relative 'series'

class SeriesTest < Minitest::Test
  def test_slices_of_one_from_one
    # skip
    actual = Series.new('1').slices(1)
    expected = ["1"]
    assert_equal expected, actual
  end

  def test_slices_of_one_from_two
    skip
    actual = Series.new('12').slices(1)
    expected = %w[1 2]
    assert_equal expected, actual
  end

  def test_slices_of_two
    skip
    actual = Series.new('35').slices(2)
    expected = ["35"]
    assert_equal expected, actual
  end

  def test_slices_of_two_overlap
    skip
    actual = Series.new('9142').slices(2)
    expected = %w[91 14 42]
    assert_equal expected, actual
  end

  def test_slices_can_include_duplicates
    skip
    actual = Series.new('777777').slices(3)
    expected = %w[777 777 777 777]
    assert_equal expected, actual
  end

  def test_slices_of_a_long_series
    skip
    actual = Series.new('918493904243').slices(5)
    expected = %w[91849 18493 84939 49390 93904 39042 90424 04243]
    assert_equal expected, actual
  end

  def test_slice_length_is_too_large
    skip
    slice_string = '12345'
    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(6)
    end
  end

  def test_slice_length_cannot_be_zero
    skip
    slice_string = '12345'
    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(0)
    end
  end

  def test_slice_length_cannot_be_negative
    skip
    slice_string = '123'
    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(-1)
    end
  end

  def test_empty_series_is_invalid
    skip
    slice_string = ''
    assert_raises ArgumentError do
      Series.new(slice_string)
    end
  end
end
