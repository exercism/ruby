#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'series'

class SeriesTest < Minitest::Test
  def test_simple_slices_of_one
    series = Series.new('01234')
    assert_equal ['0', '1', '2', '3', '4'], series.slices(1)
  end

  def test_simple_slices_of_one_again
    skip
    series = Series.new('92834')
    assert_equal ['9', '2', '8', '3', '4'], series.slices(1)
  end

  def test_simple_slices_of_two
    skip
    series = Series.new('01234')
    assert_equal ['01', '12', '23', '34'], series.slices(2)
  end

  def test_other_slices_of_two
    skip
    series = Series.new('98273463')
    expected = ['98', '82', '27', '73', '34', '46', '63']
    assert_equal expected, series.slices(2)
  end

  def test_simple_slices_of_two_again
    skip
    series = Series.new('37103')
    assert_equal ['37', '71', '10', '03'], series.slices(2)
  end

  def test_simple_slices_of_three
    skip
    series = Series.new('01234')
    assert_equal ['012', '123', '234'], series.slices(3)
  end

  def test_simple_slices_of_three_again
    skip
    series = Series.new('31001')
    assert_equal ['310', '100', '001'], series.slices(3)
  end

  def test_other_slices_of_three
    skip
    series = Series.new('982347')
    expected = ['982', '823', '234', '347']
    assert_equal expected, series.slices(3)
  end

  def test_simple_slices_of_four
    skip
    series = Series.new('01234')
    assert_equal ['0123', '1234'], series.slices(4)
  end

  def test_simple_slices_of_four_again
    skip
    series = Series.new('91274')
    assert_equal ['9127', '1274'], series.slices(4)
  end

  def test_simple_slices_of_five
    skip
    series = Series.new('01234')
    assert_equal ['01234'], series.slices(5)
  end

  def test_simple_slices_of_five_again
    skip
    series = Series.new('81228')
    assert_equal ['81228'], series.slices(5)
  end

  def test_simple_slice_that_blows_up
    skip
    series = Series.new('01234')
    assert_raises ArgumentError do
      series.slices(6)
    end
  end

  def test_more_complicated_slice_that_blows_up
    skip
    slice_string = '01032987583'

    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(slice_string.length + 1)
    end
  end
  
  def test_sequential_slices
    skip
    series = Series.new('1234')
    assert_equal ['12', '23', '34'], series.slices(2)
    assert_equal ['123', '234'], series.slices(3)
  end
end
