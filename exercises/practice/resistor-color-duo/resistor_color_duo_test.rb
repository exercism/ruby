require 'minitest/autorun'
require_relative 'resistor_color_duo'

class ResistorColorDuoTest < Minitest::Test
  def test_brown_and_black
    # skip
    assert_equal 10, ResistorColorDuo.value(%w[brown black])
  end

  def test_blue_and_grey
    skip
    assert_equal 68, ResistorColorDuo.value(%w[blue grey])
  end

  def test_yellow_and_violet
    skip
    assert_equal 47, ResistorColorDuo.value(%w[yellow violet])
  end

  def test_white_and_red
    skip
    assert_equal 92, ResistorColorDuo.value(%w[white red])
  end

  def test_orange_and_orange
    skip
    assert_equal 33, ResistorColorDuo.value(%w[orange orange])
  end

  def test_ignore_additional_colors
    skip
    assert_equal 51, ResistorColorDuo.value(%w[green brown orange])
  end

  def test_black_and_brown_one_digit
    skip
    assert_equal 1, ResistorColorDuo.value(%w[black brown])
  end
end
