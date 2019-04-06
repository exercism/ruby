require 'minitest/autorun'
require_relative 'resistor_color_duo'

# Common test data version: 2.0.0 8b44ce1
class ResistorColorDuoTest < Minitest::Test
  def test_brown_and_black
    # skip
    assert_equal 10, ResistorColorDuo.value(["brown", "black"])
  end

  def test_blue_and_grey
    skip
    assert_equal 68, ResistorColorDuo.value(["blue", "grey"])
  end

  def test_yellow_and_violet
    skip
    assert_equal 47, ResistorColorDuo.value(["yellow", "violet"])
  end

  def test_orange_and_orange
    skip
    assert_equal 33, ResistorColorDuo.value(["orange", "orange"])
  end
end
