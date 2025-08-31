require 'minitest/autorun'
require_relative 'grains'

class GrainsTest < Minitest::Test
  def test_grains_on_square_1
    # skip
    assert_equal 1, Grains.square(1)
  end

  def test_grains_on_square_2
    skip
    assert_equal 2, Grains.square(2)
  end

  def test_grains_on_square_3
    skip
    assert_equal 4, Grains.square(3)
  end

  def test_grains_on_square_4
    skip
    assert_equal 8, Grains.square(4)
  end

  def test_grains_on_square_16
    skip
    assert_equal 32_768, Grains.square(16)
  end

  def test_grains_on_square_32
    skip
    assert_equal 2_147_483_648, Grains.square(32)
  end

  def test_grains_on_square_64
    skip
    assert_equal 9_223_372_036_854_775_808, Grains.square(64)
  end

  def test_square_0_is_invalid
    skip
    assert_raises(ArgumentError) do
      Grains.square(0)
    end
  end

  def test_negative_square_is_invalid
    skip
    assert_raises(ArgumentError) do
      Grains.square(-1)
    end
  end

  def test_square_greater_than_64_is_invalid
    skip
    assert_raises(ArgumentError) do
      Grains.square(65)
    end
  end

  def test_returns_the_total_number_of_grains_on_the_board
    skip
    assert_equal 18_446_744_073_709_551_615, Grains.total
  end
end
