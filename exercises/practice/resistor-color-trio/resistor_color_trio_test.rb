require 'minitest/autorun'
require_relative 'resistor_color_trio'

class ResistorColorTrioTest < Minitest::Test
  def test_orange_and_orange_and_black
    # skip
    actual = ResistorColorTrio.new(%w[orange orange black]).label
    expected = 'Resistor value: 33 ohms'
    assert_equal expected, actual
  end

  def test_blue_and_grey_and_brown
    skip
    actual = ResistorColorTrio.new(%w[blue grey brown]).label
    expected = 'Resistor value: 680 ohms'
    assert_equal expected, actual
  end

  def test_red_and_black_and_red
    skip
    actual = ResistorColorTrio.new(%w[red black red]).label
    expected = 'Resistor value: 2 kiloohms'
    assert_equal expected, actual
  end

  def test_green_and_brown_and_orange
    skip
    actual = ResistorColorTrio.new(%w[green brown orange]).label
    expected = 'Resistor value: 51 kiloohms'
    assert_equal expected, actual
  end

  def test_yellow_and_violet_and_yellow
    skip
    actual = ResistorColorTrio.new(%w[yellow violet yellow]).label
    expected = 'Resistor value: 470 kiloohms'
    assert_equal expected, actual
  end

  def test_blue_and_violet_and_blue
    skip
    actual = ResistorColorTrio.new(%w[blue violet blue]).label
    expected = 'Resistor value: 67 megaohms'
    assert_equal expected, actual
  end

  def test_minimum_possible_value
    skip
    actual = ResistorColorTrio.new(%w[black black black]).label
    expected = 'Resistor value: 0 ohms'
    assert_equal expected, actual
  end

  def test_maximum_possible_value
    skip
    actual = ResistorColorTrio.new(%w[white white white]).label
    expected = 'Resistor value: 99 gigaohms'
    assert_equal expected, actual
  end

  def test_first_two_colors_make_an_invalid_octal_number
    skip
    actual = ResistorColorTrio.new(%w[black grey black]).label
    expected = 'Resistor value: 8 ohms'
    assert_equal expected, actual
  end

  def test_ignore_extra_colors
    skip
    actual = ResistorColorTrio.new(%w[blue green yellow orange]).label
    expected = 'Resistor value: 650 kiloohms'
    assert_equal expected, actual
  end
end
