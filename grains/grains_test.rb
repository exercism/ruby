require 'minitest/autorun'
require_relative 'grains'

class GrainsTest < Minitest::Test
  def test_square_1
    assert_equal 1, Grains.new.square(1)
  end

  def test_square_2
    skip
    assert_equal 2, Grains.new.square(2)
  end

  def test_square_3
    skip
    assert_equal 4, Grains.new.square(3)
  end

  def test_square_4
    skip
    assert_equal 8, Grains.new.square(4)
  end

  def test_square_16
    skip
    assert_equal 32_768, Grains.new.square(16)
  end

  def test_square_32
    skip
    assert_equal 2_147_483_648, Grains.new.square(32)
  end

  def test_square_64
    skip
    assert_equal 9_223_372_036_854_775_808, Grains.new.square(64)
  end

  def test_total_grains
    skip
    assert_equal 18_446_744_073_709_551_615, Grains.new.total
  end
end
