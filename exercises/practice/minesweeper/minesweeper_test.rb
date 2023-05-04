require 'minitest/autorun'
require_relative 'minesweeper'

class MinesweeperTest < Minitest::Test
  def test_no_rows
    input = []
    expected = []
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_no_columns
    input = [""]
    expected = [""]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_no_mines
    input = ["   ", "   ", "   "]
    expected = ["   ", "   ", "   "]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_minefield_with_only_mines
    input = ["***", "***", "***"]
    expected = ["***", "***", "***"]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_mine_surrounded_by_spaces
    input = ["   ", " * ", "   "]
    expected = ["111", "1*1", "111"]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_space_surrounded_by_mines
    input = ["***", "* *", "***"]
    expected = ["***", "*8*", "***"]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_horizontal_line
    input = [" * * "]
    expected = ["1*2*1"]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_horizontal_line_mines_at_edges
    input = ["*   *"]
    expected = ["*1 1*"]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_vertical_line
    input = [" ", "*", " ", "*", " "]
    expected = ["1", "*", "2", "*", "1"]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_vertical_line_mines_at_edges
    input = ["*", " ", " ", " ", "*"]
    expected = ["*", "1", " ", "1", "*"]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_cross
    input = ["  *  ", "  *  ", "*****", "  *  ", "  *  "]
    expected = [" 2*2 ", "25*52", "*****", "25*52", " 2*2 "]
    assert_equal expected, Minesweeper.annotate(input)
  end

  def test_large_minefield
    input = [" *  * ", "  *   ", "    * ", "   * *", " *  * ", "      "]
    expected = ["1*22*1", "12*322", " 123*2", "112*4*", "1*22*2", "111111"]
    assert_equal expected, Minesweeper.annotate(input)
  end
end
