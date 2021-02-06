require 'minitest/autorun'
require_relative 'minesweeper'

class MinesweeperTest < Minitest::Test
  def test_transform_1
    inp = ['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
           '| *  * |', '|      |', '+------+']
    out = ['+------+', '|1*22*1|', '|12*322|', '| 123*2|', '|112*4*|',
           '|1*22*2|', '|111111|', '+------+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform_2
    skip
    inp = ['+-----+', '| * * |', '|     |', '|   * |', '|  * *|',
           '| * * |', '+-----+']
    out = ['+-----+', '|1*2*1|', '|11322|', '| 12*2|', '|12*4*|',
           '|1*3*2|', '+-----+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform_3
    skip
    inp = ['+-----+', '| * * |', '+-----+']
    out = ['+-----+', '|1*2*1|', '+-----+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform_4
    skip
    inp = ['+-+', '|*|', '| |', '|*|', '| |', '| |', '+-+']
    out = ['+-+', '|*|', '|2|', '|*|', '|1|', '| |', '+-+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform_5
    skip
    inp = ['+-+', '|*|', '+-+']
    out = ['+-+', '|*|', '+-+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform_6
    skip
    inp = ['+--+', '|**|', '|**|', '+--+']
    out = ['+--+', '|**|', '|**|', '+--+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform_7
    skip
    inp = ['+--+', '|**|', '|**|', '+--+']
    out = ['+--+', '|**|', '|**|', '+--+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform_8
    skip
    inp = ['+---+', '|***|', '|* *|', '|***|', '+---+']
    out = ['+---+', '|***|', '|*8*|', '|***|', '+---+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform_9
    skip
    inp = ['+-----+', '|     |', '|   * |', '|     |', '|     |',
           '| *   |', '+-----+']
    out = ['+-----+', '|  111|', '|  1*1|', '|  111|', '|111  |',
           '|1*1  |', '+-----+']
    assert_equal out, Board.transform(inp)
  end

  def test_different_len
    skip
    inp = ['+-+', '| |', '|*  |', '|  |', '+-+']
    assert_raises(ArgumentError) do
      Board.transform(inp)
    end
  end

  def test_faulty_border
    skip
    inp = ['+-----+', '*   * |', '+-- --+']
    assert_raises(ArgumentError) do
      Board.transform(inp)
    end
  end

  def test_invalid_char
    skip
    inp = ['+-----+', '|X  * |', '+-----+']
    assert_raises(ArgumentError) do
      Board.transform(inp)
    end
  end
end
