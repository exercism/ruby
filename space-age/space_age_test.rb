require 'minitest/autorun'
require_relative 'space_age'

class SpaceAgeTest < Minitest::Test
  def test_age_in_seconds
    age = SpaceAge.new(1_000_000)
    assert_equal 1_000_000, age.seconds
  end

  def test_age_in_earth_years
    skip
    age = SpaceAge.new(1_000_000_000)
    assert_in_delta 31.69, age.on_earth, 0.01
  end

  def test_age_in_mercury_years
    skip
    age = SpaceAge.new(2_134_835_688)
    assert_in_delta 67.65, age.on_earth, 0.01
    assert_in_delta 280.88, age.on_mercury, 0.01
  end

  def test_age_in_venus_years
    skip
    age = SpaceAge.new(189_839_836)
    assert_in_delta 6.02, age.on_earth, 0.01
    assert_in_delta 9.78, age.on_venus, 0.01
  end

  def test_age_on_mars
    skip
    age = SpaceAge.new(2_329_871_239)
    assert_in_delta 73.83, age.on_earth, 0.01
    assert_in_delta 39.25, age.on_mars, 0.01
  end

  def test_age_on_jupiter
    skip
    age = SpaceAge.new(901_876_382)
    assert_in_delta 28.58, age.on_earth, 0.01
    assert_in_delta 2.41, age.on_jupiter, 0.01
  end

  def test_age_on_saturn
    skip
    age = SpaceAge.new(3_000_000_000)
    assert_in_delta 95.06, age.on_earth, 0.01
    assert_in_delta 3.23, age.on_saturn, 0.01
  end

  def test_age_on_uranus
    skip
    age = SpaceAge.new(3_210_123_456)
    assert_in_delta 101.72, age.on_earth, 0.01
    assert_in_delta 1.21, age.on_uranus, 0.01
  end

  def test_age_on_neptune
    skip
    age = SpaceAge.new(8_210_123_456)
    assert_in_delta 260.16, age.on_earth, 0.01
    assert_in_delta 1.58, age.on_neptune, 0.01
  end
end

