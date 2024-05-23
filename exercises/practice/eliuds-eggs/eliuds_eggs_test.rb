require 'minitest/autorun'
require_relative 'eliuds_eggs'

class EliudsEggsTest < Minitest::Test
  def test_0_eggs
    # skip
    assert_equal 0, EliudsEggs.egg_count(0)
  end

  def test_1_egg
    skip
    assert_equal 1, EliudsEggs.egg_count(16)
  end

  def test_4_eggs
    skip
    assert_equal 4, EliudsEggs.egg_count(89)
  end

  def test_13_eggs
    skip
    assert_equal 13, EliudsEggs.egg_count(2_000_000_000)
  end
end
