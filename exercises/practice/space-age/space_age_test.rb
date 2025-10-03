require 'minitest/autorun'
require_relative 'space_age'

class SpaceAgeTest < Minitest::Test
  # assert_in_delta will pass if the difference
  # between the values being compared is less
  # than the allowed delta
  DELTA = 0.01

  def test_age_on_earth
    # skip
    actual = SpaceAge.new(1_000_000_000).on_earth
    expected = 31.69
    assert_in_delta expected, actual, DELTA
  end

  def test_age_on_mercury
    skip
    actual = SpaceAge.new(2_134_835_688).on_mercury
    expected = 280.88
    assert_in_delta expected, actual, DELTA
  end

  def test_age_on_venus
    skip
    actual = SpaceAge.new(189_839_836).on_venus
    expected = 9.78
    assert_in_delta expected, actual, DELTA
  end

  def test_age_on_mars
    skip
    actual = SpaceAge.new(2_129_871_239).on_mars
    expected = 35.88
    assert_in_delta expected, actual, DELTA
  end

  def test_age_on_jupiter
    skip
    actual = SpaceAge.new(901_876_382).on_jupiter
    expected = 2.41
    assert_in_delta expected, actual, DELTA
  end

  def test_age_on_saturn
    skip
    actual = SpaceAge.new(2_000_000_000).on_saturn
    expected = 2.15
    assert_in_delta expected, actual, DELTA
  end

  def test_age_on_uranus
    skip
    actual = SpaceAge.new(1_210_123_456).on_uranus
    expected = 0.46
    assert_in_delta expected, actual, DELTA
  end

  def test_age_on_neptune
    skip
    actual = SpaceAge.new(1_821_023_456).on_neptune
    expected = 0.35
    assert_in_delta expected, actual, DELTA
  end
end
