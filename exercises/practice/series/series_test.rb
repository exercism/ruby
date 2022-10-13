require 'minitest/autorun'
require_relative 'series'

class SeriesTest < Minitest::Test
  def test_slices_of_one_from_one
    # skip
    series = Series.new("1")
    assert_equal ["1"], series.slices(1)
  end

  def test_slices_of_one_from_two
    skip
    series = Series.new("12")
    assert_equal %w[1 2], series.slices(1)
  end

  def test_slices_of_two
    skip
    series = Series.new("35")
    assert_equal ["35"], series.slices(2)
  end

  def test_slices_of_two_overlap
    skip
    series = Series.new("9142")
    assert_equal %w[91 14 42], series.slices(2)
  end

  def test_slices_can_include_duplicates
    skip
    series = Series.new("777777")
    assert_equal %w[777 777 777 777], series.slices(3)
  end

  def test_slices_of_a_long_series
    skip
    series = Series.new("918493904243")
    assert_equal %w[91849 18493 84939 49390 93904 39042 90424 04243], series.slices(5)
  end

  def test_slice_length_is_too_large
    skip
    slice_string = "12345"
    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(6)
    end
  end

  def test_slice_length_cannot_be_zero
    skip
    slice_string = "12345"
    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(0)
    end
  end

  def test_slice_length_cannot_be_negative
    skip
    slice_string = "123"
    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(-1)
    end
  end

  def test_empty_series_is_invalid
    skip
    slice_string = ""
    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(1)
    end
  end
end
