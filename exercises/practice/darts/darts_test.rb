require 'minitest/autorun'
require_relative 'darts'

class DartsTest < Minitest::Test
  def test_missed_target
    # skip
    assert_equal 0, Darts.new(-9, 9).score
  end

  def test_on_the_outer_circle
    skip
    assert_equal 1, Darts.new(0, 10).score
  end

  def test_on_the_middle_circle
    skip
    assert_equal 5, Darts.new(-5, 0).score
  end

  def test_on_the_inner_circle
    skip
    assert_equal 10, Darts.new(0, -1).score
  end

  def test_exactly_on_center
    skip
    assert_equal 10, Darts.new(0, 0).score
  end

  def test_near_the_center
    skip
    assert_equal 10, Darts.new(-0.1, -0.1).score
  end

  def test_just_within_the_inner_circle
    skip
    assert_equal 10, Darts.new(0.7, 0.7).score
  end

  def test_just_outside_the_inner_circle
    skip
    assert_equal 5, Darts.new(0.8, -0.8).score
  end

  def test_just_within_the_middle_circle
    skip
    assert_equal 5, Darts.new(-3.5, 3.5).score
  end

  def test_just_outside_the_middle_circle
    skip
    assert_equal 1, Darts.new(-3.6, -3.6).score
  end

  def test_just_within_the_outer_circle
    skip
    assert_equal 1, Darts.new(-7.0, 7.0).score
  end

  def test_just_outside_the_outer_circle
    skip
    assert_equal 0, Darts.new(7.1, -7.1).score
  end

  def test_asymmetric_position_between_the_inner_and_middle_circles
    skip
    assert_equal 5, Darts.new(0.5, -4).score
  end
end
