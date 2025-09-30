require 'minitest/autorun'
require_relative 'resistor_color'

class ResistorColorTest < Minitest::Test
  def test_black
    # skip
    actual = ResistorColor.color_code('black')
    expected = 0
    assert_equal expected, actual
  end

  def test_white
    skip
    actual = ResistorColor.color_code('white')
    expected = 9
    assert_equal expected, actual
  end

  def test_orange
    skip
    actual = ResistorColor.color_code('orange')
    expected = 3
    assert_equal expected, actual
  end

  def test_colors
    skip
    expected = %w[black brown red orange yellow green blue violet grey white]
    assert_equal expected, ResistorColor::COLORS
  end
end
