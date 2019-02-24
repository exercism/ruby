require 'minitest/autorun'
require_relative 'resistor_colors'

# Common test data version: 1.0.0 e1c6d44
class ResistorColorsTest < Minitest::Test
  def test_brown_and_black
    # skip
    assert_equal 10, ResistorColors.value(["brown", "black"])
  end

  def test_blue_and_grey
    skip
    assert_equal 68, ResistorColors.value(["blue", "grey"])
  end

  def test_yellow_and_violet
    skip
    assert_equal 47, ResistorColors.value(["yellow", "violet"])
  end

  def test_orange_and_orange
    skip
    assert_equal 33, ResistorColors.value(["orange", "orange"])
  end
end
