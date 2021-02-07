require 'minitest/autorun'
require_relative 'resistor_color_trio'

# Common test data version: 1.1.0 2c41a51
class ResistorColorTrioTest < Minitest::Test
  def test_orange_and_orange_and_black
    # skip
    assert_equal "Resistor value: 33 ohms", ResistorColorTrio.new(%w[orange orange black]).label
  end

  def test_blue_and_grey_and_brown
    skip
    assert_equal "Resistor value: 680 ohms", ResistorColorTrio.new(%w[blue grey brown]).label
  end

  def test_red_and_black_and_red
    skip
    assert_equal "Resistor value: 2 kiloohms", ResistorColorTrio.new(%w[red black red]).label
  end

  def test_green_and_brown_and_orange
    skip
    assert_equal "Resistor value: 51 kiloohms", ResistorColorTrio.new(%w[green brown orange]).label
  end

  def test_yellow_and_violet_and_yellow
    skip
    assert_equal "Resistor value: 470 kiloohms", ResistorColorTrio.new(%w[yellow violet yellow]).label
  end

  def test_invalid_color
    skip
    assert_raises(ArgumentError) do
      ResistorColorTrio.new(%w[yellow purple black]).label
    end
  end
end
