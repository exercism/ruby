require 'minitest/autorun'
require_relative 'flower_field'

class FlowerFieldTest < Minitest::Test
  def test_no_rows
    input = []
    expected = []
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_no_columns
    skip
    input = [""]
    expected = [""]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_no_flowers
    skip
    input = ["   ", "   ", "   "]
    expected = ["   ", "   ", "   "]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_garden_full_of_flowers
    skip
    input = ["***", "***", "***"]
    expected = ["***", "***", "***"]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_flower_surrounded_by_spaces
    skip
    input = ["   ", " * ", "   "]
    expected = ["111", "1*1", "111"]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_space_surrounded_by_flowers
    skip
    input = ["***", "* *", "***"]
    expected = ["***", "*8*", "***"]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_horizontal_line
    skip
    input = [" * * "]
    expected = ["1*2*1"]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_horizontal_line_flowers_at_edges
    skip
    input = ["*   *"]
    expected = ["*1 1*"]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_vertical_line
    skip
    input = [" ", "*", " ", "*", " "]
    expected = ["1", "*", "2", "*", "1"]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_vertical_line_flowers_at_edges
    skip
    input = ["*", " ", " ", " ", "*"]
    expected = ["*", "1", " ", "1", "*"]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_cross
    skip
    input = ["  *  ", "  *  ", "*****", "  *  ", "  *  "]
    expected = [" 2*2 ", "25*52", "*****", "25*52", " 2*2 "]
    assert_equal expected, FlowerField.annotate(input)
  end

  def test_large_garden
    skip
    input = [" *  * ", "  *   ", "    * ", "   * *", " *  * ", "      "]
    expected = ["1*22*1", "12*322", " 123*2", "112*4*", "1*22*2", "111111"]
    assert_equal expected, FlowerField.annotate(input)
  end
end
