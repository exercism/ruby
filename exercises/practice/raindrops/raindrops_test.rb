require 'minitest/autorun'
require_relative 'raindrops'

class RaindropsTest < Minitest::Test
  def test_the_sound_for_1_is_1
    # skip
    actual = Raindrops.convert(1)
    expected = '1'
    assert_equal expected, actual
  end

  def test_the_sound_for_3_is_pling
    skip
    actual = Raindrops.convert(3)
    expected = 'Pling'
    assert_equal expected, actual
  end

  def test_the_sound_for_5_is_plang
    skip
    actual = Raindrops.convert(5)
    expected = 'Plang'
    assert_equal expected, actual
  end

  def test_the_sound_for_7_is_plong
    skip
    actual = Raindrops.convert(7)
    expected = 'Plong'
    assert_equal expected, actual
  end

  def test_the_sound_for_6_is_pling_as_it_has_a_factor_3
    skip
    actual = Raindrops.convert(6)
    expected = 'Pling'
    assert_equal expected, actual
  end

  def test_2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base
    skip
    actual = Raindrops.convert(8)
    expected = '8'
    assert_equal expected, actual
  end

  def test_the_sound_for_9_is_pling_as_it_has_a_factor_3
    skip
    actual = Raindrops.convert(9)
    expected = 'Pling'
    assert_equal expected, actual
  end

  def test_the_sound_for_10_is_plang_as_it_has_a_factor_5
    skip
    actual = Raindrops.convert(10)
    expected = 'Plang'
    assert_equal expected, actual
  end

  def test_the_sound_for_14_is_plong_as_it_has_a_factor_of_7
    skip
    actual = Raindrops.convert(14)
    expected = 'Plong'
    assert_equal expected, actual
  end

  def test_the_sound_for_15_is_plingplang_as_it_has_factors_3_and_5
    skip
    actual = Raindrops.convert(15)
    expected = 'PlingPlang'
    assert_equal expected, actual
  end

  def test_the_sound_for_21_is_plingplong_as_it_has_factors_3_and_7
    skip
    actual = Raindrops.convert(21)
    expected = 'PlingPlong'
    assert_equal expected, actual
  end

  def test_the_sound_for_25_is_plang_as_it_has_a_factor_5
    skip
    actual = Raindrops.convert(25)
    expected = 'Plang'
    assert_equal expected, actual
  end

  def test_the_sound_for_27_is_pling_as_it_has_a_factor_3
    skip
    actual = Raindrops.convert(27)
    expected = 'Pling'
    assert_equal expected, actual
  end

  def test_the_sound_for_35_is_plangplong_as_it_has_factors_5_and_7
    skip
    actual = Raindrops.convert(35)
    expected = 'PlangPlong'
    assert_equal expected, actual
  end

  def test_the_sound_for_49_is_plong_as_it_has_a_factor_7
    skip
    actual = Raindrops.convert(49)
    expected = 'Plong'
    assert_equal expected, actual
  end

  def test_the_sound_for_52_is_52
    skip
    actual = Raindrops.convert(52)
    expected = '52'
    assert_equal expected, actual
  end

  def test_the_sound_for_105_is_plingplangplong_as_it_has_factors_3_5_and_7
    skip
    actual = Raindrops.convert(105)
    expected = 'PlingPlangPlong'
    assert_equal expected, actual
  end

  def test_the_sound_for_3125_is_plang_as_it_has_a_factor_5
    skip
    actual = Raindrops.convert(3125)
    expected = 'Plang'
    assert_equal expected, actual
  end
end
